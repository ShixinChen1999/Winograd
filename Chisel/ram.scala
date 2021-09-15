import chisel3._

class Dual_SRAM_16x960_IO extends Bundle{
  val clka=Input(Clock())
  val ena=Input(Bool())
  val addra=Input(UInt(10.W))
  val dina=Input(UInt(16.W))
  val clkb=Input(Clock())
  val enb=Input(Bool())
  val wea=Input(Bool())
  val addrb=Input(UInt(10.W))
  val doutb=Output(UInt(16.W))
}

class Dual_SRAM_16x960 extends BlackBox{
  val io=IO(new Dual_SRAM_16x960_IO)
}

class DualPortRAM_IO extends Bundle{
  val in_addr = Input(UInt(10.W))//输入地址
  val dataIn = Input(UInt(16.W))//输入数据
  val input_valid = Input(Bool())//表示信号写有效
  val output_addr =Input(UInt(10.W))
  val output_valid = Input(Bool())//表示信号读有效
  val dataOut = Output(UInt(16.W))
}

class DualPortRAM extends Module {
  val io = IO(new DualPortRAM_IO)

  val RAM = Module(new Dual_SRAM_16x960())
  RAM.io.clka:=clock
  RAM.io.clkb:=clock



  //wr
  RAM.io.wea:=io.input_valid
  RAM.io.ena:=io.input_valid

  RAM.io.addra:=io.in_addr
  RAM.io.dina:=io.dataIn
  //rd
  RAM.io.enb:=io.output_valid

  RAM.io.addrb:=io.output_addr
  io.dataOut:=RAM.io.doutb
}

object DualPortRAM extends App{

  chisel3.Driver.emitVerilog(new DualPortRAM())

}
