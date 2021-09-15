module DualPortRAM( // @[:@17.2]
  input         clock, // @[:@18.4]
  input         reset, // @[:@19.4]
  input  [9:0]  io_in_addr, // @[:@20.4]
  input  [15:0] io_dataIn, // @[:@20.4]
  input         io_input_valid, // @[:@20.4]
  input  [9:0]  io_output_addr, // @[:@20.4]
  input         io_output_valid, // @[:@20.4]
  output [15:0] io_dataOut // @[:@20.4]
);
  wire [15:0] RAM_doutb; // @[SRAM.scala 56:19:@22.4]
  wire [9:0] RAM_addrb; // @[SRAM.scala 56:19:@22.4]
  wire  RAM_wea; // @[SRAM.scala 56:19:@22.4]
  wire  RAM_enb; // @[SRAM.scala 56:19:@22.4]
  wire  RAM_clkb; // @[SRAM.scala 56:19:@22.4]
  wire [15:0] RAM_dina; // @[SRAM.scala 56:19:@22.4]
  wire [9:0] RAM_addra; // @[SRAM.scala 56:19:@22.4]
  wire  RAM_ena; // @[SRAM.scala 56:19:@22.4]
  wire  RAM_clka; // @[SRAM.scala 56:19:@22.4]
  Dual_SRAM_16x960 RAM ( // @[SRAM.scala 56:19:@22.4]
    .doutb(RAM_doutb),
    .addrb(RAM_addrb),
    .wea(RAM_wea),
    .enb(RAM_enb),
    .clkb(RAM_clkb),
    .dina(RAM_dina),
    .addra(RAM_addra),
    .ena(RAM_ena),
    .clka(RAM_clka)
  );
  assign io_dataOut = RAM_doutb; // @[SRAM.scala 65:13:@40.4]
  assign RAM_addrb = io_output_addr; // @[SRAM.scala 64:15:@39.4]
  assign RAM_wea = io_input_valid; // @[SRAM.scala 59:13:@34.4]
  assign RAM_enb = io_output_valid; // @[SRAM.scala 63:13:@38.4]
  assign RAM_clkb = clock; // @[SRAM.scala 58:14:@33.4]
  assign RAM_dina = io_dataIn; // @[SRAM.scala 62:14:@37.4]
  assign RAM_addra = io_in_addr; // @[SRAM.scala 61:15:@36.4]
  assign RAM_ena = io_input_valid; // @[SRAM.scala 60:13:@35.4]
  assign RAM_clka = clock; // @[SRAM.scala 57:14:@32.4]
endmodule
