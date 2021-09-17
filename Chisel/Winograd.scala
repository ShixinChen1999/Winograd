import chisel3._
import chisel3.core.Module.{clock, reset}
import chisel3.util._

class Pipe_out extends BlackBox with Config {
  val io = IO(new Bundle{
    val clock=Input(Clock())
    val reset=Input(Bool())
    val io_in_valid=Input(Bool())
    val io_dIn_0=Input(SInt((2*MUL_WIDTH+2).W))
    val io_dIn_1=Input(SInt((2*MUL_WIDTH+2).W))
    val io_dOut=Input(SInt((2*MUL_WIDTH+2).W))
    val io_out_valid=Output(Bool())
  })
}

object Pipe_out {
  def apply(op1:Bool,op3: SInt,op4:SInt):(Bool,SInt) = {
    val inst = Module(new Pipe_out())
    inst.io.clock:=clock
    inst.io.reset:=reset
    inst.io.io_in_valid:=op1
    inst.io.io_dIn_0:=op3
    inst.io.io_dIn_1:=op4
    (inst.io.io_out_valid,inst.io.io_dOut)
  }
}



//create adder IP
class Add_9in_10out_IP extends Bundle with Config{
  val A=Input(SInt(B_WIDTH.W))
  val B=Input(SInt(B_WIDTH.W))
  val S=Output(SInt((B_WIDTH+1).W))
  val CLK=Input(Clock())
}

class Add_9in_10out extends BlackBox{
  val io=IO(new Add_9in_10out_IP)
}

object Add_9in_10out{
  def apply(op1: SInt, op2: SInt):SInt = {
    val inst = Module(new Add_9in_10out)
    inst.io.A := op1
    inst.io.B := op2
    inst.io.CLK:=clock
    inst.io.S
  }
}

//create B IP
class B_IO extends Bundle with Config {
  val  dIn = Input(Vec(MAC_WIDTH,SInt(B_WIDTH.W)))
  val  dOut = Output(Vec(MAC_WIDTH,SInt((B_WIDTH+1).W)))
}

class B extends Module with Config{
  val io=IO(new B_IO)
  io.dOut(0):=Add_9in_10out(io.dIn(3),-io.dIn(1))
  io.dOut(1):=Add_9in_10out(io.dIn(2),io.dIn(1))
  io.dOut(2):=Add_9in_10out(io.dIn(1),-io.dIn(2))
  io.dOut(3):=Add_9in_10out(io.dIn(2),-io.dIn(0))
}



class B_module_IO extends Bundle with Config{
  val mac_in_valid=Input(Bool())
  val  dIn = Input(Vec(MAC_WIDTH,SInt(B_WIDTH.W)))
  val  dOut = Output(Vec(MAC_WIDTH,SInt((B_WIDTH+1).W)))
  val  out_valid=Output(Bool())
}

class B_module extends Module with Config{
  val io=IO(new B_module_IO)
  val m_B=Module(new B)

  m_B.io.dIn(0):=io.dIn(0)
  m_B.io.dIn(1):=io.dIn(1)
  m_B.io.dIn(2):=io.dIn(2)
  m_B.io.dIn(3):=io.dIn(3)

  //val cnt =RegInit(0.S(3.W))
  //val cnt_EN=RegInit(false.B)

  val out1=VecInit(Seq.fill(MAC_WIDTH)(0.S((B_WIDTH+1).W)
    .asTypeOf(SInt((B_WIDTH+1).W))))
  val out2=VecInit(Seq.fill(MAC_WIDTH)(0.S((B_WIDTH+1).W)
    .asTypeOf(SInt((B_WIDTH+1).W))))
  val out3=VecInit(Seq.fill(MAC_WIDTH)(0.S((B_WIDTH+1).W)
    .asTypeOf(SInt((B_WIDTH+1).W))))
  val out4=VecInit(Seq.fill(MAC_WIDTH)(0.S((B_WIDTH+1).W)
    .asTypeOf(SInt((B_WIDTH+1).W))))

  //val m_long2short=Module(new leaky_relu_long_2_short(B_WIDTH+1,BT_WIDTH))

 //cnt_EN:=ShiftRegister(io.mac_in_valid,4)

 //val cntReg = RegInit (0.S(3.W))
 // cntReg := Mux((!cnt_EN)||cntReg === 3.S, 0.S, cntReg + 1.S)
 // cnt:=cntReg
 val (cnt, cnt_EN)=Counter(io.mac_in_valid,4)
  /////long2short
  /*
  out1(0):=leaky_relu_long_2_short(m_B.io.dOut(0))//串并转换
  out2(0):=ShiftRegister(leaky_relu_long_2_short(m_B.io.dOut(1)),1)//串并转换
  out3(0):=ShiftRegister(leaky_relu_long_2_short(m_B.io.dOut(2)),2)//串并转换
  out4(0):=ShiftRegister(leaky_relu_long_2_short(m_B.io.dOut(3)),3)//串并转换
*/

  out1(0):=m_B.io.dOut(0)//串并转换
  out2(0):=ShiftRegister(m_B.io.dOut(1),1)//串并转换
  out3(0):=ShiftRegister(m_B.io.dOut(2),2)//串并转换
  out4(0):=ShiftRegister(m_B.io.dOut(3),3)//串并转换

  for(i<-1 until MAC_WIDTH){
    out1(i):=RegNext(out1(i-1))
    out2(i):=RegNext(out2(i-1))
    out3(i):=RegNext(out3(i-1))
    out4(i):=RegNext(out4(i-1))
  }

  when(cnt===0.U) {
    io.dOut(0) := out1(0)
    io.dOut(1) := out1(1)
    io.dOut(2) := out1(2)
    io.dOut(3) := out1(3)
  }.elsewhen(cnt===1.U) {
    io.dOut(0) := out2(0)
    io.dOut(1) := out2(1)
    io.dOut(2) := out2(2)
    io.dOut(3) := out2(3)

  }.elsewhen(cnt===2.U){
    io.dOut(0) := out3(0)
    io.dOut(1) := out3(1)
    io.dOut(2) := out3(2)
    io.dOut(3) := out3(3)
  }.elsewhen(cnt===3.U){
    io.dOut(0) := out4(0)
    io.dOut(1) := out4(1)
    io.dOut(2) := out4(2)
    io.dOut(3) := out4(3)
  }.otherwise{
    io.dOut(0) := 0.S
    io.dOut(1):= 0.S
    io.dOut(2):= 0.S
    io.dOut(3):= 0.S
  }
  io.out_valid:=ShiftRegister(io.mac_in_valid,MAC_WIDTH)
}

object B_module {
  def apply(op1:Bool,op2: Vec[SInt]):(Bool,Vec[SInt]) = {
    val inst = Module(new B_module)
    inst.io.mac_in_valid:=op1
    for(i <- 0 until 4) {
      inst.io.dIn(i) := op2(i)
    }
    (inst.io.out_valid,inst.io.dOut)
  }
}

class Add_8in_9out_IP extends Bundle with Config{
  val A=Input(SInt(BT_WIDTH.W))
  val B=Input(SInt(BT_WIDTH.W))
  val S=Output(SInt(B_WIDTH.W))
  val CLK=Input(Clock())
}

class Add_8in_9out extends BlackBox{
  val io=IO(new Add_8in_9out_IP)
}

object Add_8in_9out{
  def apply(op1: SInt, op2: SInt):SInt = {
    val inst = Module(new Add_8in_9out)
    inst.io.A := op1
    inst.io.B := op2
    inst.io.CLK:=clock
    inst.io.S
  }
}

class BT_IO extends Bundle with Config {
  val  dIn1 = Input(SInt(BT_WIDTH.W))
  val  dIn2 = Input(SInt(BT_WIDTH.W))
  val  dIn3 = Input(SInt(BT_WIDTH.W))
  val  dIn4 = Input(SInt(BT_WIDTH.W))
  val  dOut1 = Output(SInt((B_WIDTH).W))
  val  dOut2 = Output(SInt((B_WIDTH).W))
  val  dOut3 = Output(SInt((B_WIDTH).W))
  val  dOut4 = Output(SInt((B_WIDTH).W))
}





class BT extends Module with Config{
  val io=IO(new BT_IO)//溢出保护
  io.dOut1:=Add_8in_9out(io.dIn1,-io.dIn3)
  io.dOut2:=Add_8in_9out(io.dIn2,io.dIn3)
  io.dOut3:=Add_8in_9out(-io.dIn2,io.dIn3)
  io.dOut4:=Add_8in_9out(io.dIn2,-io.dIn4)
}


class BT_module_IO extends Bundle with Config{
  val mac_in_valid=Input(Bool())
  val  dIn = Input(Vec(MAC_WIDTH,SInt(BT_WIDTH.W)))
  val  dOut = Output(Vec(MAC_WIDTH,SInt(B_WIDTH.W)))
  val  out_valid=Output(Bool())
}

class BT_module extends Module with Config{
  val io=IO(new BT_module_IO)

  val m_BT=Module(new BT)

  m_BT.io.dIn1:=io.dIn(0)
  m_BT.io.dIn2:=io.dIn(1)
  m_BT.io.dIn3:=io.dIn(2)
  m_BT.io.dIn4:=io.dIn(3)

  val out1=VecInit(Seq.fill(MAC_WIDTH)(0.S(B_WIDTH.W)
    .asTypeOf(SInt(B_WIDTH.W))))
  val out2=VecInit(Seq.fill(MAC_WIDTH)(0.S(B_WIDTH.W)
    .asTypeOf(SInt(B_WIDTH.W))))
  val out3=VecInit(Seq.fill(MAC_WIDTH)(0.S(B_WIDTH.W)
    .asTypeOf(SInt(B_WIDTH.W))))
  val out4=VecInit(Seq.fill(MAC_WIDTH)(0.S(B_WIDTH.W)
    .asTypeOf(SInt(B_WIDTH.W))))


  val (cnt, cnt_EN)=Counter(io.mac_in_valid,4)
  out1(0):=m_BT.io.dOut1//串并转换
  out2(0):=ShiftRegister(m_BT.io.dOut2,1)//串并转换
  out3(0):=ShiftRegister(m_BT.io.dOut3,2)//串并转换
  out4(0):=ShiftRegister(m_BT.io.dOut4,3)//串并转换
  for(i<-1 until MAC_WIDTH){
    out1(i):=RegNext(out1(i-1))
    out2(i):=RegNext(out2(i-1))
    out3(i):=RegNext(out3(i-1))
    out4(i):=RegNext(out4(i-1))
  }

  when(cnt===0.U) {
    io.dOut(0) := out1(0)
    io.dOut(1) := out1(1)
    io.dOut(2) := out1(2)
    io.dOut(3) := out1(3)
  }.elsewhen(cnt===1.U) {
    io.dOut(0) := out2(0)
    io.dOut(1) := out2(1)
    io.dOut(2) := out2(2)
    io.dOut(3) := out2(3)
  }.elsewhen(cnt===2.U){
    io.dOut(0) := out3(0)
    io.dOut(1) := out3(1)
    io.dOut(2) := out3(2)
    io.dOut(3) := out3(3)
  }.elsewhen(cnt===3.U){
    io.dOut(0) := out4(0)
    io.dOut(1) := out4(1)
    io.dOut(2) := out4(2)
    io.dOut(3) := out4(3)
  }.otherwise{
    io.dOut(0) := 0.S
    io.dOut(1):= 0.S
    io.dOut(2) := 0.S
    io.dOut(3) := 0.S
  }
  io.out_valid:=ShiftRegister(io.mac_in_valid,MAC_WIDTH)
}

object BT_module {
  def apply(op1:Bool,op2: Vec[SInt]):(Bool,Vec[SInt]) = {
    val inst = Module(new BT_module)
    inst.io.mac_in_valid:=op1
    for(i <- 0 until 4) {
      inst.io.dIn(i) := op2(i)
    }
    (inst.io.out_valid,inst.io.dOut)
  }
}



class Mul_8in_16out_IP extends Bundle with Config{
  val A=Input(SInt(MUL_WIDTH.W))
  val B=Input(SInt(MUL_WIDTH.W))
  val P=Output(SInt((2*MUL_WIDTH).W))
  val CLK=Input(Clock())
}

class Mul_8in_16out extends BlackBox{
  val io=IO(new Mul_8in_16out_IP)
}

object Mul_8in_16out{
  def apply(op1: SInt, op2: SInt):SInt = {
    val inst = Module(new Mul_8in_16out)
    inst.io.A := op1
    inst.io.B := op2
    inst.io.CLK:=clock
    inst.io.P
  }
}


class MUL_IO extends Bundle with Config{

  val  dIn_B = Input(Vec(MAC_WIDTH,SInt(MUL_WIDTH.W)))
  val  dIn_G = Input(Vec(MAC_WIDTH,SInt(MUL_WIDTH.W)))
  val  dOut = Output(Vec(MAC_WIDTH,SInt((2*MUL_WIDTH).W)))

}





class MUL extends Module with Config{
  val io=IO(new MUL_IO)
  for(i <- 0 until MAC_WIDTH){
    io.dOut(i):=Mul_8in_16out(io.dIn_B(i),io.dIn_G(i))
  }
}

class MUL_module_IO extends Bundle with Config{
  val mac_in_valid=Input(Bool())
  val  dIn_B = Input(Vec(MAC_WIDTH,SInt(MUL_WIDTH.W)))
  val  dIn_G = Input(Vec(MAC_WIDTH,SInt(MUL_WIDTH.W)))
  val  dOut = Output(Vec(MAC_WIDTH,SInt((2*MUL_WIDTH).W)))
  val  out_valid=Output(Bool())
}

class MUL_module extends Module with Config{
  val io=IO(new MUL_module_IO)
  val m_MUL=Module(new MUL)


  for(i <- 0 until MAC_WIDTH){
    m_MUL.io.dIn_G(i):=io.dIn_G(i)
    m_MUL.io.dIn_B(i):=io.dIn_B(i)
    io.dOut(i):=ShiftRegister(m_MUL.io.dOut(i),MAC_WIDTH-1)
  }


  /*
    val cnt =RegInit(0.S(3.W))
    val cnt_EN=RegInit(false.B)

    val out1=VecInit(Seq.fill(MAC_WIDTH)(0.S((2*MUL_WIDTH).W)
      .asTypeOf(SInt((2*MUL_WIDTH).W))))
    val out2=VecInit(Seq.fill(MAC_WIDTH)(0.S((2*MUL_WIDTH).W)
      .asTypeOf(SInt((2*MUL_WIDTH).W))))
    val out3=VecInit(Seq.fill(MAC_WIDTH)(0.S((2*MUL_WIDTH).W)
      .asTypeOf(SInt((2*MUL_WIDTH).W))))
    val out4=VecInit(Seq.fill(MAC_WIDTH)(0.S((2*MUL_WIDTH).W)
      .asTypeOf(SInt((2*MUL_WIDTH).W))))


    cnt_EN:=ShiftRegister(io.mac_in_valid,4)

    val cntReg = RegInit (0.S(3.W))
    cntReg := Mux((!cnt_EN)||cntReg === 3.S, 0.S, cntReg + 1.S)
    cnt:=cntReg
    out1(0):=m_MUL.io.dOut(0)//串并转换
    out2(0):=ShiftRegister(m_MUL.io.dOut(1),1)//串并转换
    out3(0):=ShiftRegister(m_MUL.io.dOut(2),2)//串并转换
    out4(0):=ShiftRegister(m_MUL.io.dOut(3),3)//串并转换
    for(i<-1 until MAC_WIDTH){
      out1(i):=RegNext(out1(i-1))
      out2(i):=RegNext(out2(i-1))
      out3(i):=RegNext(out3(i-1))
      out4(i):=RegNext(out4(i-1))
    }

    when(cnt_EN&&cntReg===0.U) {
      io.dOut(0) := out1(0)
      io.dOut(1) := out1(1)
      io.dOut(2) := out1(2)
      io.dOut(3) := out1(3)
    }.elsewhen(cnt_EN&&cntReg===1.U) {
      io.dOut(0) := out2(0)
      io.dOut(1) := out2(1)
      io.dOut(2) := out2(2)
      io.dOut(3) := out2(3)
    }.elsewhen(cnt_EN&&cntReg===2.U){
      io.dOut(0) := out3(0)
      io.dOut(1) := out3(1)
      io.dOut(2) := out3(2)
      io.dOut(3) := out3(3)
    }.elsewhen(cnt_EN&&cntReg===3.U){
      io.dOut(0) := out4(0)
      io.dOut(1) := out4(1)
      io.dOut(2) := out4(2)
      io.dOut(3) := out4(3)
    }.otherwise{
      io.dOut(0) := 0.S
      io.dOut(1):= 0.S
      io.dOut(2) := 0.S
      io.dOut(3) := 0.S
    }*/
  io.out_valid:=ShiftRegister(io.mac_in_valid,MAC_WIDTH)
}

object MUL_module {
  def apply(op1:Bool,op2: Vec[SInt],op3:Vec[SInt]):(Bool,Vec[SInt]) = {
    val inst = Module(new MUL_module)
    inst.io.mac_in_valid:=op1
    for(i <- 0 until 4) {
      inst.io.dIn_B(i) := op2(i)
      inst.io.dIn_G(i) := op3(i)
    }
    (inst.io.out_valid,inst.io.dOut)
  }
}

////////////////////////////////////////////////////
//                   AT                           //
////////////////////////////////////////////////////

class Add_23in_24out_IP extends Bundle with Config{
  val A=Input(SInt(23.W))
  val B=Input(SInt(23.W))
  val S=Output(SInt(24.W))
  val CLK=Input(Clock())
}

class Add_23in_24out extends BlackBox{
  val io=IO(new Add_23in_24out_IP)
}

object Add_23in_24out{
  def apply(op1: SInt, op2: SInt):SInt = {
    val inst = Module(new Add_23in_24out)
    inst.io.A := op1
    inst.io.B := op2
    inst.io.CLK:=clock
    inst.io.S
  }
}


class AT_IO extends Bundle with Config{


  val  dIn = Input(Vec(MAC_WIDTH,SInt((2*MUL_WIDTH+3).W)))
  val  dOut = Output(Vec(MAC_WIDTH/2,SInt((2*MUL_WIDTH+4).W)))

}





class AT extends Module with Config{
  val io=IO(new AT_IO)

  io.dOut(0):=Add_23in_24out(Add_23in_24out(io.dIn(1),io.dIn(2)),ShiftRegister(io.dIn(3),1))
  io.dOut(1):=Add_23in_24out(Add_23in_24out(io.dIn(2),-io.dIn(1)),-ShiftRegister(io.dIn(0),1))
}

class AT_module_IO extends Bundle with Config{
  val mac_in_valid=Input(Bool())
  val  dIn = Input(Vec(MAC_WIDTH,SInt((2*MUL_WIDTH+3).W)))
  val  dOut = Output(Vec(MAC_WIDTH,SInt((2*MUL_WIDTH+4).W)))
  val  out_valid=Output(Bool())
}

class AT_module extends Module with Config{
  val io=IO(new AT_module_IO)
  val m_AT=Module(new AT)


  for(i <- 0 until MAC_WIDTH){
    m_AT.io.dIn(i):=io.dIn(i)
  }

  //io.dOut(0):=m_AT.io.dOut(0)
  //io.dOut(1):=m_AT.io.dOut(1)



  val cnt =RegInit(0.U(3.W))
  val cnt_EN=RegInit(false.B)

  val out1=VecInit(Seq.fill(MAC_WIDTH)(0.S((2*MUL_WIDTH+2).W)
    .asTypeOf(SInt((2*MUL_WIDTH+4).W))))
  val out2=VecInit(Seq.fill(MAC_WIDTH)(0.S((2*MUL_WIDTH+2).W)
    .asTypeOf(SInt((2*MUL_WIDTH+4).W))))
  val out_temp=VecInit(Seq.fill(MAC_WIDTH)(0.S((2*MUL_WIDTH+2).W)
    .asTypeOf(SInt((2*MUL_WIDTH+4).W))))





  val (cntReg,cnt_valid)=Counter(ShiftRegister(io.mac_in_valid,4),4)

  out1(0):=m_AT.io.dOut(0)//串并转换
  out2(0):=ShiftRegister(m_AT.io.dOut(1),1)//串并转换
  for(i<-1 until MAC_WIDTH){
    out1(i):=RegNext(out1(i-1))
    out2(i):=RegNext(out2(i-1))
  }

  when(cntReg===1.U) {
    out_temp(0) := out1(0)
    out_temp(1) := out1(1)
    out_temp(2) := out1(2)
    out_temp(3) := out1(3)
  }.elsewhen(cntReg===2.U) {
    out_temp(0) := out2(0)
    out_temp(1) := out2(1)
    out_temp(2) := out2(2)
    out_temp(3) := out2(3)
  }.otherwise{
    out_temp(0) := 0.S
    out_temp(1):= 0.S
    out_temp(2) := 0.S
    out_temp(3) := 0.S
  }
  for(i <- 0 until MAC_WIDTH){
    io.dOut(i):=ShiftRegister(out_temp(i),3)
  }


  io.out_valid:=ShiftRegister(io.mac_in_valid,MAC_WIDTH*2)
}

object AT_module {
  def apply(op1:Bool,op2: Vec[SInt]):(Bool,Vec[SInt]) = {
    val inst = Module(new AT_module)
    inst.io.mac_in_valid:=op1
    for(i <- 0 until 4) {
      inst.io.dIn(i) := op2(i)
    }
    (inst.io.out_valid,inst.io.dOut)
  }
}


class BT_B_MUL_AT_IO extends Bundle with Config{
  val mac_in_valid=Input(Bool())
  val  dIn = Input(Vec(MAC_WIDTH,SInt((BT_WIDTH).W)))
  //val  dIn_G = Input(SInt((KERNEL_SIZE*MUL_WIDTH).W))
  val  dIn_G = Input(Vec(MAC_WIDTH,SInt(MUL_WIDTH.W)))
  val  dOut = Output(SInt((2*MUL_WIDTH+4).W))
  val  out_valid=Output(Bool())
}

class Winograd extends Module with Config{

  val io=IO(new BT_B_MUL_AT_IO)

  /*
  val dIn_G=VecInit(Seq.fill(KERNEL_SIZE)(0.S(MUL_WIDTH.W)
    .asTypeOf(SInt(MUL_WIDTH.W))))
 val out=VecInit(Seq.fill(1)(0.S((2*MUL_WIDTH+2).W)
    .asTypeOf(SInt((2*MUL_WIDTH+2).W))))
  for(i <- 0 until KERNEL_SIZE){
    dIn_G(i):=io.dIn_G(MUL_WIDTH*(i+1)-1,MUL_WIDTH*i).asSInt()
  }
*/
  val out=RegInit(0.S((2*MUL_WIDTH+2).W))


  val res_BT=BT_module(io.mac_in_valid,io.dIn)
  val res_B=B_module(res_BT._1,res_BT._2)

  val res_MUL=MUL_module(res_B._1,res_B._2,io.dIn_G)
  val res_AT=AT_module(res_MUL._1,res_MUL._2)
  //val res_AT3=AT_module(res_AT._1,res_AT._2)
  val res_AT2=AT_module(res_AT._1,res_AT._2)


  //io.out_valid:=false.B
//  val (cnt,cnt_valid)=Counter(res_AT2._1,4)
//  val data_valid=RegInit(false.B)
//  when((cnt===0.S||cnt===1.S)){
//      data_valid:=true.B
//  }.otherwise{
//    data_valid:=false.B
//  }

  //val dData_pipe=Reg(Vec(2,SInt((2*MUL_WIDTH+2).W)))
  //dData_pipe(0):=res_AT2._2(2)
  //dData_pipe(1):=res_AT2._2(3)
  val pip_out=Pipe_out(res_AT2._1,res_AT2._2(3),res_AT2._2(2))

  io.out_valid:=ShiftRegister(pip_out._1,2)
  io.dOut:=pip_out._2

  //out:=ShiftRegister(res_AT2._2(2),1)
  //io.dOut:=Mux(res_AT2._2(3)===0.S,out,res_AT2._2(3))
  //io.out_valid:=pip_out._1
  //io.dOut:=B_module(BT_module(io.mac_in_valid,io.dIn)._1,BT_module(io.mac_in_valid,io.dIn)._2)._2
}

object Winograd extends App{
  chisel3.Driver.emitVerilog(new Winograd())
}

