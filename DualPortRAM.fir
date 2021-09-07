;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit DualPortRAM : 
  extmodule Dual_SRAM_16x960 : 
    output doutb : UInt<16>
    input addrb : UInt<10>
    input wea : UInt<1>
    input enb : UInt<1>
    input clkb : Clock
    input dina : UInt<16>
    input addra : UInt<10>
    input ena : UInt<1>
    input clka : Clock
    
    defname = Dual_SRAM_16x960
    
    
  module DualPortRAM : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip in_addr : UInt<10>, flip dataIn : UInt<16>, flip input_valid : UInt<1>, flip output_addr : UInt<10>, flip output_valid : UInt<1>, dataOut : UInt<16>}
    
    inst RAM of Dual_SRAM_16x960 @[ram.scala 32:19]
    RAM.doutb is invalid
    RAM.addrb is invalid
    RAM.wea is invalid
    RAM.enb is invalid
    RAM.clkb is invalid
    RAM.dina is invalid
    RAM.addra is invalid
    RAM.ena is invalid
    RAM.clka is invalid
    RAM.clka <= clock @[ram.scala 33:14]
    RAM.clkb <= clock @[ram.scala 34:14]
    RAM.wea <= io.input_valid @[ram.scala 39:13]
    RAM.ena <= io.input_valid @[ram.scala 40:13]
    RAM.addra <= io.in_addr @[ram.scala 42:15]
    RAM.dina <= io.dataIn @[ram.scala 43:14]
    RAM.enb <= io.output_valid @[ram.scala 45:13]
    RAM.addrb <= io.output_addr @[ram.scala 47:15]
    io.dataOut <= RAM.doutb @[ram.scala 48:13]
    
