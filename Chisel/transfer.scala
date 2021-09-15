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



class Transfer2_IO extends Bundle with Config {
  val dIn=Input(UInt(IN_BIT_WIDTH.W))
  val dIn_addr=Input(UInt(ADDR_WIDTH.W))
  val input_valid=Input(Bool())//输入有效，低电平则为无效
  //val row_finish=Input(Bool())//行结束信号，意味着需要切换RAM,在知道图片大小的情况下，可以忽略这一层
  //val dOut=Output(Vec(OUT_NUM,UInt(OUT_BIT_WIDTH.W)))
  val RAM_OUT=Output(Vec(OUT_NUM+2,UInt(OUT_BIT_WIDTH.W)))
  val out_valid=Output(Bool())
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
class Transfer2 extends Module with Config{
  val io=IO(new Transfer2_IO)

  def ram_write(RAM:DualPortRAM_IO,address:UInt,data:UInt)={
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



  //先存储零




  val (cnt,cnt_valid)=Counter(io.input_valid,(IN_WIDTH+PADDING))

  //行计数器
  //val (cnt_col,cnt_col_valid)=Conter_pause(io.input_valid,(IN_HIGHT+2).U,cnt_valid)
  //SRAM计数器
  val (cnt_ram,cnt_ram_valid)=Conter_pause(io.input_valid,(RAM_NUM*RAM_GRP).U,cnt_valid)
  //val (cnt_1,cnt_valid_1)=Counter(io.input_valid,IN_HIGHT*IN_WIDTH)
  val U_ram=VecInit(Seq.fill(6)(Module(new DualPortRAM).io))//能否使用二维数组

//NOT Padding
// when(io.input_valid){
//   when(cnt_ram===0.U){
//     ram_write(U_ram(0),cnt,io.dIn)
//     ram_keep(U_ram(1))
//     ram_keep(U_ram(2))
//     ram_keep(U_ram(3))
//     ram_keep(U_ram(4))
//     ram_keep(U_ram(5))
//   }.elsewhen(cnt_ram===1.U){
//     ram_write(U_ram(1),cnt,io.dIn)
//     ram_keep(U_ram(0))
//     ram_keep(U_ram(2))
//     ram_keep(U_ram(3))
//     ram_keep(U_ram(4))
//     ram_keep(U_ram(5))
//   }.elsewhen(cnt_ram===2.U){
//     ram_write(U_ram(2),cnt,io.dIn)
//     ram_keep(U_ram(0))
//     ram_keep(U_ram(1))
//     ram_keep(U_ram(3))
//     ram_keep(U_ram(4))
//     ram_keep(U_ram(5))
//   }.elsewhen(cnt_ram===3.U) {
//     ram_write(U_ram(3), cnt, io.dIn)
//     ram_keep(U_ram(0))
//     ram_keep(U_ram(1))
//     ram_keep(U_ram(2))
//     ram_keep(U_ram(4))
//     ram_keep(U_ram(5))
//   }.elsewhen(cnt_ram===4.U){
//     ram_write(U_ram(4), cnt, io.dIn)
//     ram_keep(U_ram(0))
//     ram_keep(U_ram(1))
//     ram_keep(U_ram(2))
//     ram_keep(U_ram(3))
//     ram_keep(U_ram(5))
//   }.elsewhen(cnt_ram===5.U){
//     ram_write(U_ram(5), cnt, io.dIn)
//     ram_keep(U_ram(0))
//     ram_keep(U_ram(1))
//     ram_keep(U_ram(2))
//     ram_keep(U_ram(3))
//     ram_keep(U_ram(4))
//   }.otherwise{
//     ram_keep(U_ram(0))
//     ram_keep(U_ram(1))
//     ram_keep(U_ram(2))
//     ram_keep(U_ram(3))
//     ram_keep(U_ram(4))
//     ram_keep(U_ram(5))
//   }
// }.otherwise{
//     ram_keep(U_ram(0))
//     ram_keep(U_ram(1))
//     ram_keep(U_ram(2))
//     ram_keep(U_ram(3))
//     ram_keep(U_ram(4))
//     ram_keep(U_ram(5))
// }


//  val start=RegInit(false.B)
//  val end=RegInit(false.B)
//  //判断第一行与最后一行
//  when(io.input_valid){
//    when(cnt_col===0.U){
//      start:=true.B
//    }.otherwise{
//      start:=false.B
//    }
//    when(cnt_col===(IN_HIGHT+1).U){
//      end:=true.B
//    }.otherwise{
//      end:=false.B
//    }
//  }


  when(io.input_valid){
    when(cnt_ram===0.U){


          ram_write(U_ram(0),cnt,io.dIn)

        ram_keep(U_ram(1))
        ram_keep(U_ram(2))
        ram_keep(U_ram(3))
        ram_keep(U_ram(4))
        ram_keep(U_ram(5))

    }.elsewhen(cnt_ram===1.U){

//      when(start||end){
//        ram_write(U_ram(1),cnt,0.U)
//      }.otherwise{
        ram_write(U_ram(1),cnt,io.dIn)
 //    }
      ram_keep(U_ram(0))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }.elsewhen(cnt_ram===2.U){

        ram_write(U_ram(2),cnt,io.dIn)

      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(3))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }.elsewhen(cnt_ram===3.U) {

        ram_write(U_ram(3),cnt,io.dIn)

      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(2))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }.elsewhen(cnt_ram===4.U){

      ram_write(U_ram(4),cnt,io.dIn)

      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(5))
    }.elsewhen(cnt_ram===5.U){

      ram_write(U_ram(5),cnt,io.dIn)
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(4))
    }.otherwise{
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }
  }.otherwise{
    ram_keep(U_ram(0))
    ram_keep(U_ram(1))
    ram_keep(U_ram(2))
    ram_keep(U_ram(3))
    ram_keep(U_ram(4))
    ram_keep(U_ram(5))
  }
//  when(cnt_ram===0.U||cnt_ram===1.U){//在六个buffer之间进行信息存储
//    when((cnt_col)%2.U===0.U&&cnt%2.U===0.U){//两个ram之间交替存储01为一组，23为一组，45一组
//      ram_write(U_ram(0),cnt,io.dIn)
//      ram_keep(U_ram(1))
//      ram_keep(U_ram(2))
//      ram_keep(U_ram(3))
//      ram_keep(U_ram(4))
//      ram_keep(U_ram(5))
//    }.elsewhen((cnt_col)%2.U===0.U&&cnt%2.U===1.U){
//      ram_write(U_ram(1),cnt,io.dIn)
//      ram_keep(U_ram(0))
//      ram_keep(U_ram(2))
//      ram_keep(U_ram(3))
//      ram_keep(U_ram(4))
//      ram_keep(U_ram(5))
//    }.elsewhen((cnt_col)%2.U===1.U&&cnt%2.U===0.U){//cnt等价于地址
//      ram_write(U_ram(1),cnt,io.dIn)
//      ram_keep(U_ram(0))
//      ram_keep(U_ram(2))
//      ram_keep(U_ram(3))
//      ram_keep(U_ram(4))
//      ram_keep(U_ram(5))
//    }.otherwise{
//      ram_write(U_ram(0),io.dIn_addr%IN_WIDTH.U,io.dIn)
//      ram_keep(U_ram(1))
//      ram_keep(U_ram(2))
//      ram_keep(U_ram(3))
//      ram_keep(U_ram(4))
//      ram_keep(U_ram(5))
//    }
//  }.elsewhen(cnt_ram===2.U||cnt_ram===3.U){
//    when((cnt_col)%2.U===0.U&&cnt%2.U===0.U){//两个ram之间交替存储
//      ram_write(U_ram(2),io.dIn_addr%IN_WIDTH.U,io.dIn)
//      ram_keep(U_ram(3))
//      ram_keep(U_ram(0))
//      ram_keep(U_ram(1))
//      ram_keep(U_ram(4))
//      ram_keep(U_ram(5))
//    }.elsewhen((cnt_col)%2.U===0.U&&cnt%2.U===1.U){
//      ram_write(U_ram(3),io.dIn_addr%IN_WIDTH.U,io.dIn)
//      ram_keep(U_ram(2))
//      ram_keep(U_ram(0))
//      ram_keep(U_ram(1))
//      ram_keep(U_ram(4))
//      ram_keep(U_ram(5))
//    }.elsewhen((cnt_col)%2.U===1.U&&cnt%2.U===0.U){//cnt等价于地址
//      ram_write(U_ram(3),io.dIn_addr%IN_WIDTH.U,io.dIn)
//      ram_keep(U_ram(2))
//      ram_keep(U_ram(0))
//      ram_keep(U_ram(1))
//      ram_keep(U_ram(4))
//      ram_keep(U_ram(5))
//    }.otherwise{
//      ram_write(U_ram(2),io.dIn_addr%IN_WIDTH.U,io.dIn)
//      ram_keep(U_ram(3))
//      ram_keep(U_ram(0))
//      ram_keep(U_ram(1))
//      ram_keep(U_ram(4))
//      ram_keep(U_ram(5))
//    }
//  }.otherwise{
//    when((cnt_col)%2.U===0.U&&cnt%2.U===0.U){//两个ram之间交替存储
//      ram_write(U_ram(4),io.dIn_addr%(IN_WIDTH.U),io.dIn)
//      ram_keep(U_ram(5))
//      ram_keep(U_ram(2))
//      ram_keep(U_ram(3))
//      ram_keep(U_ram(0))
//      ram_keep(U_ram(1))
//    }.elsewhen((cnt_col)%2.U===0.U&&cnt%2.U===1.U){
//      ram_write(U_ram(5),io.dIn_addr%(IN_WIDTH.U),io.dIn)
//      ram_keep(U_ram(4))
//      ram_keep(U_ram(2))
//      ram_keep(U_ram(3))
//      ram_keep(U_ram(0))
//      ram_keep(U_ram(1))
//    }.elsewhen((cnt_col)%2.U===1.U&&cnt%2.U===0.U){//cnt等价于地址
//      ram_write(U_ram(5),io.dIn_addr%(IN_WIDTH.U),io.dIn)
//      ram_keep(U_ram(4))
//      ram_keep(U_ram(2))
//      ram_keep(U_ram(3))
//      ram_keep(U_ram(0))
//      ram_keep(U_ram(1))
//    }.otherwise{
//      ram_write(U_ram(4),io.dIn_addr%(IN_WIDTH.U),io.dIn)
//      ram_keep(U_ram(5))
//      ram_keep(U_ram(2))
//      ram_keep(U_ram(3))
//      ram_keep(U_ram(0))
//      ram_keep(U_ram(1))
//    }
//  }

  io.out_valid:=ShiftRegister(io.input_valid,LATANCY+1)


  val (cnt2,cnt2_valid)=Counter(io.out_valid,2)//两个周期读一拍
  val (cnt_ram_out,cnt_ram_out_valid)=Conter_pause(io.out_valid,(IN_WIDTH+PADDING).U,cnt2_valid)//三种模式
  val (cnt_out,cnt_out_valid)=Conter_pause(io.out_valid,RAM_GRP.U,cnt_ram_out_valid)//三种模式


  val out_temp=Reg(Vec(4,UInt(IN_BIT_WIDTH.W)))
  //VecInit(Seq.fill(4)(0.U(IN_BIT_WIDTH.W)))


  when(io.out_valid){
    when(cnt_out===0.U){
      out_temp(0):=ram_read(U_ram(0),cnt_ram_out)
      out_temp(1):=ram_read(U_ram(1),cnt_ram_out)
      out_temp(2):=ram_read(U_ram(2),cnt_ram_out)
      out_temp(3):=ram_read(U_ram(3),cnt_ram_out)
    }.elsewhen(cnt_out===1.U){
      out_temp(0):=ram_read(U_ram(2),cnt_ram_out)
      out_temp(1):=ram_read(U_ram(3),cnt_ram_out)
      out_temp(2):=ram_read(U_ram(4),cnt_ram_out)
      out_temp(3):=ram_read(U_ram(5),cnt_ram_out)
    }.elsewhen(cnt_out===2.U){
      out_temp(0):=ram_read(U_ram(4),cnt_ram_out)
      out_temp(1):=ram_read(U_ram(5),cnt_ram_out)
      out_temp(2):=ram_read(U_ram(0),cnt_ram_out)
      out_temp(3):=ram_read(U_ram(1),cnt_ram_out)
    }
  }



  for(i <- 0 until RAM_GRP*RAM_NUM ){
    io.RAM_OUT(i):=U_ram(i).io_dataOut
  }
//    for(i <- 0 until 4 ){
//      io.RAM_OUT(i):=out_temp(i)
//    }
//  io.RAM_OUT(4):=0.U
//  io.RAM_OUT(5):=0.U

}

class Transfer_IO extends Bundle with Config {
  val dIn=Input(UInt(IN_BIT_WIDTH.W))
  val dIn_addr=Input(UInt(ADDR_WIDTH.W))
  val input_valid=Input(Bool())//输入有效，低电平则为无效
  //val row_finish=Input(Bool())//行结束信号，意味着需要切换RAM,在知道图片大小的情况下，可以忽略这一层
  //val dOut=Output(Vec(OUT_NUM,UInt(OUT_BIT_WIDTH.W)))
  val RAM_OUT=Output(Vec(OUT_NUM+2,UInt(OUT_BIT_WIDTH.W)))
  val out_valid=Output(Bool())
}

class Transfer extends Module with Config{
  val io=IO(new Transfer_IO)

  def ram_write(RAM:DualPortRAM_IO,address:UInt,data:UInt)={
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



  val (cnt,cnt_valid)=Counter(io.input_valid,IN_WIDTH*IN_HIGHT)
  //val (cnt_1,cnt_valid_1)=Counter(io.input_valid,IN_HIGHT*IN_WIDTH)
  val U_ram=VecInit(Seq.fill(6)(Module(new DualPortRAM).io))//能否使用二维数组


  val NUM_RAM=(cnt/IN_WIDTH.U)%6.U
  // printf("%d\n",NUM_RAM)

  when((cnt/IN_WIDTH.U)%6.U===0.U||(cnt/IN_WIDTH.U)%6.U===1.U){//在六个buffer之间进行信息存储
    when((cnt/IN_WIDTH.U)%2.U===0.U&&cnt%2.U===0.U){//两个ram之间交替存储01为一组，23为一组，45一组
      ram_write(U_ram(0),io.dIn_addr%IN_WIDTH.U,io.dIn)
      ram_keep(U_ram(1))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }.elsewhen((cnt/IN_WIDTH.U)%2.U===0.U&&cnt%2.U===1.U){
      ram_write(U_ram(1),io.dIn_addr%IN_WIDTH.U,io.dIn)
      ram_keep(U_ram(0))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }.elsewhen((cnt/IN_WIDTH.U)%2.U===1.U&&cnt%2.U===0.U){//cnt等价于地址
      ram_write(U_ram(1),io.dIn_addr%IN_WIDTH.U,io.dIn)
      ram_keep(U_ram(0))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }.otherwise{
      ram_write(U_ram(0),io.dIn_addr%IN_WIDTH.U,io.dIn)
      ram_keep(U_ram(1))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }
  }.elsewhen((cnt/IN_WIDTH.U)%6.U===2.U||(cnt/IN_WIDTH.U)%6.U===3.U){
    when((cnt/IN_WIDTH.U)%2.U===0.U&&cnt%2.U===0.U){//两个ram之间交替存储
      ram_write(U_ram(2),io.dIn_addr%IN_WIDTH.U,io.dIn)
      ram_keep(U_ram(3))
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }.elsewhen((cnt/IN_WIDTH.U)%2.U===0.U&&cnt%2.U===1.U){
      ram_write(U_ram(3),io.dIn_addr%IN_WIDTH.U,io.dIn)
      ram_keep(U_ram(2))
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }.elsewhen((cnt/IN_WIDTH.U)%2.U===1.U&&cnt%2.U===0.U){//cnt等价于地址
      ram_write(U_ram(3),io.dIn_addr%IN_WIDTH.U,io.dIn)
      ram_keep(U_ram(2))
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }.otherwise{
      ram_write(U_ram(2),io.dIn_addr%IN_WIDTH.U,io.dIn)
      ram_keep(U_ram(3))
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
      ram_keep(U_ram(4))
      ram_keep(U_ram(5))
    }
  }.otherwise{
    when((cnt/IN_WIDTH.U)%2.U===0.U&&cnt%2.U===0.U){//两个ram之间交替存储
      ram_write(U_ram(4),io.dIn_addr%(IN_WIDTH.U),io.dIn)
      ram_keep(U_ram(5))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
    }.elsewhen((cnt/IN_WIDTH.U)%2.U===0.U&&cnt%2.U===1.U){
      ram_write(U_ram(5),io.dIn_addr%(IN_WIDTH.U),io.dIn)
      ram_keep(U_ram(4))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
    }.elsewhen((cnt/IN_WIDTH.U)%2.U===1.U&&cnt%2.U===0.U){//cnt等价于地址
      ram_write(U_ram(5),io.dIn_addr%(IN_WIDTH.U),io.dIn)
      ram_keep(U_ram(4))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
    }.otherwise{
      ram_write(U_ram(4),io.dIn_addr%(IN_WIDTH.U),io.dIn)
      ram_keep(U_ram(5))
      ram_keep(U_ram(2))
      ram_keep(U_ram(3))
      ram_keep(U_ram(0))
      ram_keep(U_ram(1))
    }
  }

  io.out_valid:=ShiftRegister(io.input_valid,LATANCY)

  val (cnt_out,cnt_out_valid)=Counter(io.out_valid,IN_WIDTH*IN_HIGHT)//两个周期读一拍

  val dOut_addr=cnt_out/2.U
  val out_temp=VecInit(Seq.fill(4)(0.U(IN_BIT_WIDTH.W)))

  when(io.out_valid){
    when(cnt_out%2.U===0.U){//两拍实现一个读操作
      when((cnt_out/IN_WIDTH.U)%6.U===0.U||(cnt_out/IN_WIDTH.U)%6.U===1.U){//对应读取1，2，3，4 ram
        when((cnt_out/IN_WIDTH.U)%4.U===0.U){
          out_temp(0):=ram_read(U_ram(0),dOut_addr%(IN_WIDTH.U))
          out_temp(1):=ram_read(U_ram(1),dOut_addr%(IN_WIDTH.U))
          out_temp(2):=ram_read(U_ram(2),dOut_addr%(IN_WIDTH.U))
          out_temp(3):=ram_read(U_ram(3),dOut_addr%(IN_WIDTH.U))
        }.otherwise{//((cnt_out/IN_WIDTH.U)%2.U===1.U)
          out_temp(0):=ram_read(U_ram(1),dOut_addr%(IN_WIDTH.U))
          out_temp(1):=ram_read(U_ram(0),dOut_addr%(IN_WIDTH.U))
          out_temp(2):=ram_read(U_ram(3),dOut_addr%(IN_WIDTH.U))
          out_temp(3):=ram_read(U_ram(2),dOut_addr%(IN_WIDTH.U))
        }
      }.elsewhen((cnt_out/IN_WIDTH.U)%6.U===2.U||(cnt_out/IN_WIDTH.U)%6.U===3.U){
        when((cnt_out/IN_WIDTH.U)%4.U===0.U){
          out_temp(0):=ram_read(U_ram(2),dOut_addr%(IN_WIDTH.U))
          out_temp(1):=ram_read(U_ram(3),dOut_addr%(IN_WIDTH.U))
          out_temp(2):=ram_read(U_ram(4),dOut_addr%(IN_WIDTH.U))
          out_temp(3):=ram_read(U_ram(5),dOut_addr%(IN_WIDTH.U))
        }.otherwise{//((cnt_out/IN_WIDTH.U)%2.U===1.U)
          out_temp(0):=ram_read(U_ram(3),dOut_addr%(IN_WIDTH.U))
          out_temp(1):=ram_read(U_ram(2),dOut_addr%(IN_WIDTH.U))
          out_temp(2):=ram_read(U_ram(5),dOut_addr%(IN_WIDTH.U))
          out_temp(3):=ram_read(U_ram(4),dOut_addr%(IN_WIDTH.U))
        }
      }.elsewhen((cnt_out/IN_WIDTH.U)%6.U===4.U||(cnt_out/IN_WIDTH.U)%6.U===5.U){
        when((cnt_out/IN_WIDTH.U)%4.U===0.U){
         out_temp(0):=ram_read(U_ram(4),dOut_addr%(IN_WIDTH.U))
          out_temp(1):=ram_read(U_ram(5),dOut_addr%(IN_WIDTH.U))
          out_temp(2):=ram_read(U_ram(0),dOut_addr%(IN_WIDTH.U))
          out_temp(3):=ram_read(U_ram(1),dOut_addr%(IN_WIDTH.U))

        }.otherwise{//((cnt_out/IN_WIDTH.U)%2.U===1.U)
          out_temp(0):=ram_read(U_ram(5),dOut_addr%(IN_WIDTH.U))
          out_temp(1):=ram_read(U_ram(4),dOut_addr%(IN_WIDTH.U))
          out_temp(2):=ram_read(U_ram(1),dOut_addr%(IN_WIDTH.U))
          out_temp(3):=ram_read(U_ram(0),dOut_addr%(IN_WIDTH.U))
        }
      }
    }
  }


    for(i <- 0 until RAM_GRP*RAM_NUM ){
      io.RAM_OUT(i):=U_ram(i).io_dataOut
    }

}

object Transfer2 extends App{

  chisel3.Driver.emitVerilog(new Transfer2())

}

