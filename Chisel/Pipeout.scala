import chisel3._
import chisel3.util._

trait Config {
  val IN_HIGHT=360//12*16
  val IN_WIDTH=640////16
  val PADDING=2//左右各一个
  val IN_BIT_WIDTH=8
  val OUT_BIT_WIDTH=8
  val ADDR_WIDTH=10
  val RAM_NUM=2
  val RAM_GRP=3
  val OUT_NUM=4
  val LATANCY=4*IN_WIDTH

  val BT_WIDTH=8
  val BT_WIDTH_1=8
  val B_WIDTH=9
  val MUL_WIDTH=10
  val CONW=8
  val MAC_WIDTH=4
  val KERNEL_SIZE=MAC_WIDTH*MAC_WIDTH

  /////////////long_2_short
  val DIN_W=26
  val DOUT_W=8
  val DIN_DECIMAL=14
  val DOUT_DECIMAL=7
}

class DualPortRAM_IO extends Bundle{
  val clock  = Input(Clock())
  val reset = Input(Bool())
  val io_in_addr = Input(UInt(10.W))//输入地址
  val io_dataIn = Input(UInt(16.W))//输入数据
  val io_input_valid = Input(Bool())//表示信号写有效
  val io_output_addr =Input(UInt(10.W))
  val io_output_valid = Input(Bool())//表示信号读有效
  val io_dataOut = Output(UInt(16.W))
}
class DualPortRAM extends BlackBox{
  val io=IO(new DualPortRAM_IO)
}



class Conter_pause extends Module{
  val io=IO(new Bundle{
    val valid=Input(Bool())
    val goal_num=Input(UInt(12.W))//可配置
    val pulse=Input(Bool())
    val cnt=Output(UInt(12.W))
    val out_valid=Output(Bool())
  })

  val cnt_temp=RegInit(0.U(12.W))
  when(io.valid) {
    when(io.pulse && (io.cnt =/= (io.goal_num - 1.U))) {
      cnt_temp := cnt_temp+ 1.U
      io.out_valid := false.B
    }.elsewhen(io.pulse && (io.cnt === (io.goal_num - 1.U))) {
      cnt_temp := 0.U
      io.out_valid := true.B
    }.otherwise{
      cnt_temp := cnt_temp
      io.out_valid := false.B
    }
  }.otherwise{
    cnt_temp := 0.U
    io.out_valid := false.B
  }

  io.cnt:=cnt_temp
}


object Conter_pause{
  def apply(valid:Bool,goal_num:UInt,pulse:Bool):(UInt,Bool)={
    val inst=Module(new Conter_pause())
    inst.io.valid:=valid
    inst.io.goal_num:=goal_num
    inst.io.pulse:=pulse
    (inst.io.cnt,inst.io.out_valid)
  }
}

class Pipe_out extends Module with Config{
  val io=IO(new Bundle{
    val in_valid=Input(Bool())
    //val data_valid=Input(Bool())
    val dIn = Input(Vec(MAC_WIDTH-2,SInt((2*MUL_WIDTH+2).W)))
    val dOut = Output(SInt((2*MUL_WIDTH+2).W))
    val out_valid = Output(Bool())
  })


  def ram_write(RAM:DualPortRAM_IO,address:UInt,data: UInt)={
    RAM.clock:=clock
    RAM.reset:=reset
    RAM.io_input_valid:=true.B
    RAM.io_in_addr:=address
    RAM.io_dataIn:=data
    RAM.io_output_valid:=DontCare
    RAM.io_output_addr:=DontCare
    RAM.io_dataOut:=DontCare
  }
  def ram_read(RAM:DualPortRAM_IO,address:UInt):UInt={
    RAM.clock:=clock
    RAM.reset:=reset
    RAM.io_input_valid:=DontCare
    RAM.io_in_addr:=DontCare
    RAM.io_dataIn:=DontCare
    RAM.io_output_valid:=true.B
    RAM.io_output_addr:=address
    RAM.io_dataOut
  }
  def ram_keep(RAM:DualPortRAM_IO)={
    RAM.clock:=clock
    RAM.reset:=reset
    RAM.io_input_valid:=false.B
    RAM.io_in_addr:=DontCare
    RAM.io_dataIn:=DontCare
    RAM.io_output_valid:=false.B
    RAM.io_output_addr:=DontCare
    RAM.io_dataOut:=DontCare
  }


  val U_ram=VecInit(Seq.fill(4)(Module(new DualPortRAM).io))//能否使用二维数组

  val (cnt1,cnt1_valid)=Counter(io.in_valid,4)
  val data_valid=RegInit(false.B)
  when((cnt1===0.U||cnt1===1.U)&&io.in_valid){
    data_valid:=true.B
  }.otherwise{
    data_valid:=false.B
  }

  val (cnt_inter,cnt_inter_valid)=Counter(io.in_valid,2*IN_WIDTH+5)
  val start=RegInit(false.B)
  when(cnt_inter_valid){
    start:=true.B
  }
  when(start){
    start:=true.B
  }

  //val start=ShiftRegister(io.in_valid,2*IN_WIDTH+4)


  val (cnt,cnt_valid)=Conter_pause(io.in_valid,(IN_WIDTH+2).U,data_valid)//0-17  except 16,17
  val (cnt_col,cnt_col_valid)=Conter_pause(io.in_valid,2.U,cnt_valid)

  val (cnt_out,cnt_out_valid)=Counter(start,IN_WIDTH+2)
  val (cnt_col_out,cnt_col_out_valid)=Conter_pause(start,4.U,cnt_out_valid)


  //out


  val (cnt_row,cnt_row_valid)=Conter_pause(start,(IN_HIGHT).U,cnt_out_valid)
  val (cnt_end_flag,cnt_end_flag_valid)=Conter_pause(start,2.U,cnt_row_valid)


  //写入RAM
  when(io.in_valid){
    when(cnt_col===0.U&&data_valid){
      ram_write(U_ram(0),cnt,RegNext(io.dIn(0).asUInt()))
      ram_write(U_ram(1),cnt,RegNext(io.dIn(1).asUInt()))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
    }.elsewhen(cnt_col===1.U&&data_valid){
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_write(U_ram(2),cnt,RegNext(io.dIn(0).asUInt()))
      ram_write(U_ram(3),cnt,RegNext(io.dIn(1).asUInt()))
    }.otherwise{
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
    }
  }.otherwise{
    ram_keep(U_ram(0))
    ram_keep(U_ram(1))
    ram_keep(U_ram(2))
    ram_keep(U_ram(3))
  }


  //读出ram




//  when(cnt_row_valid){
//    start:=false.B
//  }
//  when(!start){
//    start:=false.B
//  }

  when(start&&(cnt_end_flag===0.U)){
    when(cnt_out===IN_WIDTH.U||cnt_out===(IN_WIDTH+1).U){
      io.out_valid:=false.B
    }.otherwise{
      io.out_valid:=true.B
    }
  }.otherwise{
    io.out_valid:=false.B
  }


  val out_temp=RegInit(0.S((2*MUL_WIDTH+2).W))
  when(start){
    when(cnt_col_out===0.U){
      ram_read(U_ram(0),cnt_out).asSInt()
    }.elsewhen(cnt_col_out===1.U){
      ram_read(U_ram(1),cnt_out).asSInt()
    }.elsewhen(cnt_col_out===2.U){
      ram_read(U_ram(2),cnt_out).asSInt()
    }.elsewhen(cnt_col_out===3.U){
      ram_read(U_ram(3),cnt_out).asSInt()
    }
  }

  when(start){
    when(cnt_col_out===0.U){
      out_temp:=U_ram(0).io_dataOut.asSInt()
    }.elsewhen(cnt_col_out===1.U){
      out_temp:=U_ram(1).io_dataOut.asSInt()
    }.elsewhen(cnt_col_out===2.U){
      out_temp:=U_ram(2).io_dataOut.asSInt()
    }.elsewhen(cnt_col_out===3.U){
      out_temp:=U_ram(3).io_dataOut.asSInt()
    }.otherwise{
      out_temp:=0.S
    }
  }.otherwise{
    out_temp:=0.S
  }

  io.dOut:=out_temp

}

object Pipe_out {
  def apply(op1:Bool,op3: SInt,op4:SInt):(Bool,SInt) = {
    val inst = Module(new Pipe_out)
    inst.io.in_valid:=op1
    inst.io.dIn(0):=op3
    inst.io.dIn(1):=op4
    (inst.io.out_valid,inst.io.dOut)
  }
}



object Pipeout extends App{

  chisel3.Driver.emitVerilog(new Pipe_out())

}

