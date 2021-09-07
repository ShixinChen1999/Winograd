import chisel3._
import chisel3.util._

import scala.math._

class SinglePortRAM extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(10.W))
    val dataIn = Input(UInt(32.W))
    val en = Input(Bool())
    val we = Input(Bool())
    val dataOut = Output(UInt(32.W))
  })
  val syncRAM = SyncReadMem(1024, UInt(32.W))
  when(io.en) {
    when(io.we) {
      syncRAM.write(io.addr, io.dataIn)
      io.dataOut := DontCare
    } .otherwise {
      io.dataOut := syncRAM.read(io.addr)
    }
  } .otherwise {
    io.dataOut := DontCare
  }
}

trait Config {
  val IN_HIGHT=12//12*16
  val IN_WIDTH=16////16
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

class Transfer_IO extends Bundle with Config {
  val clock=Input(Clock())
  val reset=Input(Bool())
  val io_dIn=Input(UInt(IN_BIT_WIDTH.W))
  val io_dIn_addr=Input(UInt(ADDR_WIDTH.W))
  val io_input_valid=Input(Bool())//输入有效，低电平则为无效
  //val row_finish=Input(Bool())//行结束信号，意味着需要切换RAM,在知道图片大小的情况下，可以忽略这一层
  val io_RAM_OUT_0=Output(UInt(OUT_BIT_WIDTH.W))
  val io_RAM_OUT_1=Output(UInt(OUT_BIT_WIDTH.W))
  val io_RAM_OUT_2=Output(UInt(OUT_BIT_WIDTH.W))
  val io_RAM_OUT_3=Output(UInt(OUT_BIT_WIDTH.W))
  val io_RAM_OUT_4=Output(UInt(OUT_BIT_WIDTH.W))
  val io_RAM_OUT_5=Output(UInt(OUT_BIT_WIDTH.W))
  val io_out_valid=Output(Bool())


  //val io_out_temp=Output(Vec(OUT_NUM,UInt(OUT_BIT_WIDTH.W)))
  //val io_RAM_OUT=Output(Vec(OUT_NUM+2,UInt(OUT_BIT_WIDTH.W)))
}

class Transfer extends BlackBox with Config {
  val io = IO(new Transfer_IO)
}

class data_gen_IO extends Bundle with Config{
  val input_valid=Input(Bool())
  val dOut=Output(UInt(IN_BIT_WIDTH.W))
  val dOut_addr=Output(UInt(ADDR_WIDTH.W))
  val dOut_valid=Output(Bool())
}

class data_gen(IN_HIGHT:Int,IN_WIDTH:Int) extends Module with Config {
  val io=IO(new data_gen_IO)
  val temp=RegInit(0.U(IN_BIT_WIDTH.W))

  val random_data= for(i <-0 until (IN_HIGHT*IN_WIDTH)) yield (random*i).round.toInt

  val (cnt,valid)=Counter(io.input_valid,(IN_HIGHT*IN_WIDTH))//a 代表计数，b代表计数完成信号

  when(io.input_valid){
    io.dOut_valid:=ShiftRegister(io.input_valid,1)//TODO:the end of picture transfer needs a signal to symbolize different pictures
    io.dOut_addr:=cnt.asUInt()
  }.otherwise{
    io.dOut_valid:=false.B
    io.dOut_addr:=0.U(ADDR_WIDTH.W)
  }

  when(io.dOut_valid){
    for(i <- 0 until (IN_HIGHT*IN_WIDTH)){
      temp:=(cnt%128.U).asUInt()//(cnt.asUInt*100.U)%(128.U)+1.U
    }
  }.otherwise{
    temp:=0.U(IN_BIT_WIDTH.W)
  }
  io.dOut:=temp
}

class Padding extends Module with Config{
  val io=IO(new Bundle{
    val dIn=Input(UInt(IN_BIT_WIDTH.W))
    val in_valid=Input(Bool())
    val dOut=Output(UInt(IN_BIT_WIDTH.W))
    val out_vaild=Output(Bool())
  })



  //定义一个循环移位的模块
  val LENGTH=2*IN_HIGHT+2*IN_WIDTH+5
  //val Buffer=VecInit(Seq.fill(LENGTH)(0.U(IN_BIT_WIDTH.W)))
  val Buffer=Reg(Vec(LENGTH,UInt(IN_BIT_WIDTH.W)))
  val addr=RegInit((LENGTH-1).U)

  //定义一个存储空间，这个空间至少要达到图片的一个宽度大小，

  val (cnt,cnt_valid)=Counter(io.in_valid,IN_WIDTH)
  val (cnt_col,cnt_col_valid)=Conter_pause(io.in_valid,(IN_HIGHT+2).U,cnt_valid)



  for(i <- 0 until LENGTH){
    Buffer(i):=0.U
  }

  when(ShiftRegister(io.in_valid,1)){
    for(i<- 1 until LENGTH){
      Buffer(i):=Buffer(i-1)
    }
  }


  when(io.in_valid){

    when(cnt===0.U){
        when(cnt_col===0.U||cnt_col===(IN_HIGHT).U){
          addr:=addr-IN_WIDTH.U-2.U
        }.otherwise{
            addr:=addr-2.U
        }
      io.dOut:=Buffer(LENGTH-1)
      io.out_vaild:=true.B
      Buffer(addr-2.U):=io.dIn
      when(addr===0.U){
        addr:=0.U//(LENGTH-1).U
      }
      //Buffer(LENGTH-1):=RegNext(Buffer(LENGTH-1))
    }.otherwise{
      io.dOut:=Buffer(LENGTH-1)
      io.out_vaild:=true.B
      Buffer(addr):=io.dIn
      //addr:=addr-1.U
//      when(addr===0.U){
//        addr:=(LENGTH-1).U
//      }

    }
  }.otherwise{
    io.out_vaild:=false.B
    io.dOut:=0.U
  }


  //一开始需要缓存一行

  //之后在固定位置加入零，新进入的元素在buffer中
  //最后达到数量之后再次输入零，每一帧图片进入实际上需要更多时间缓存



}


class G_gen extends Module with Config {
  val io=IO(new Bundle{
    val input_valid=Input(Bool())
    val dOut=Output(Vec(MAC_WIDTH,UInt(IN_BIT_WIDTH.W)))
  })
  val (cnt, cnt_valid)=Counter(io.input_valid,4)
  when(io.input_valid){
    when(cnt===0.U){
      io.dOut(3):=4.U
      io.dOut(2):=12.U
      io.dOut(1):=4.U
      io.dOut(0):=12.U
    }.elsewhen(cnt===1.U){
      io.dOut(3):=24.U
      io.dOut(2):=45.U
      io.dOut(1):=15.U
      io.dOut(0):=36.U
    }.elsewhen(cnt===2.U){
      io.dOut(3):=8.U
      io.dOut(2):=15.U
      io.dOut(1):=5.U
      io.dOut(0):=12.U
    }.elsewhen(cnt===3.U){
      io.dOut(3):=28.U
      io.dOut(2):=48.U
      io.dOut(1):=16.U
      io.dOut(0):=36.U
    }.otherwise{
      io.dOut(0):=0.U
      io.dOut(1):=0.U
      io.dOut(2):=0.U
      io.dOut(3):=0.U
    }
  }.otherwise{
    io.dOut(0):=0.U
    io.dOut(1):=0.U
    io.dOut(2):=0.U
    io.dOut(3):=0.U
  }

}

class data_trans extends Module with Config {
  val io=IO(new Bundle{
    val input_valid=Input(Bool())
    val output_valid=Output(Bool())
    val RAM_OUT=Output(Vec(4,UInt(OUT_BIT_WIDTH.W)))
    val result=Output(UInt((2*MUL_WIDTH+2).W))
  })


  val data_gen=Module(new data_gen(IN_HIGHT,IN_WIDTH))//12*16
  val padding=Module(new Padding)//14*18
  val transfer=Module(new Transfer)
  val dG_in=Module(new G_gen())
  val rank_change=Module(new Rank_Change)
  val winograd=Module(new Winograd)


  //datain
  transfer.io.reset:=reset
  transfer.io.clock:=clock
  data_gen.io.input_valid:=io.input_valid

  padding.io.in_valid:=data_gen.io.dOut_valid
  padding.io.dIn:=data_gen.io.dOut

  //transfer.io.io_input_valid:=data_gen.io.dOut_valid
  //transfer.io.io_dIn:=data_gen.io.dOut


  transfer.io.io_dIn_addr:=data_gen.io.dOut_addr

  transfer.io.io_input_valid:=padding.io.out_vaild
  transfer.io.io_dIn:=padding.io.dOut

  //reshape
  rank_change.io.input_valid:=transfer.io.io_out_valid
  rank_change.io.dIn(0):=transfer.io.io_RAM_OUT_0
  rank_change.io.dIn(1):=transfer.io.io_RAM_OUT_1
  rank_change.io.dIn(2):=transfer.io.io_RAM_OUT_2
  rank_change.io.dIn(3):=transfer.io.io_RAM_OUT_3
  rank_change.io.dIn(4):=transfer.io.io_RAM_OUT_4
  rank_change.io.dIn(5):=transfer.io.io_RAM_OUT_5

  ///////////////////winograd
  winograd.io.mac_in_valid:=ShiftRegister(transfer.io.io_out_valid,5)
  dG_in.io.input_valid:=ShiftRegister(transfer.io.io_out_valid,5+8)

  when(winograd.io.mac_in_valid){
    for(i <- 0 until(4)){
      winograd.io.dIn(i):=rank_change.io.dOut(i).asSInt()////////无符号向有符号转变
      winograd.io.dIn_G(i):=dG_in.io.dOut(i).asSInt()
    }
  }.otherwise{
    for(i <- 0 until(4)){
      winograd.io.dIn(i):=0.S
      winograd.io.dIn_G(i):=0.S
    }
  }






  io.output_valid:=winograd.io.out_valid

  when(io.output_valid){
    io.result:=winograd.io.dOut.asUInt()
  }.otherwise{
    io.result:=0.U
  }
  io.RAM_OUT:=rank_change.io.dOut





}

object data_trans extends App{

    chisel3.Driver.emitVerilog(new data_trans())

  }


