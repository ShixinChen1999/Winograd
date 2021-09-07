module Conter_pause( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input        io_valid, // @[:@6.4]
  input  [7:0] io_goal_num, // @[:@6.4]
  input        io_pulse, // @[:@6.4]
  output [7:0] io_cnt, // @[:@6.4]
  output       io_out_valid // @[:@6.4]
);
  reg [7:0] cnt_temp; // @[transfer.scala 66:23:@8.4]
  reg [31:0] _RAND_0;
  wire [8:0] _T_18; // @[transfer.scala 68:49:@10.6]
  wire [8:0] _T_19; // @[transfer.scala 68:49:@11.6]
  wire [7:0] _T_20; // @[transfer.scala 68:49:@12.6]
  wire  _T_21; // @[transfer.scala 68:32:@13.6]
  wire  _T_22; // @[transfer.scala 68:21:@14.6]
  wire [8:0] _T_24; // @[transfer.scala 69:29:@16.8]
  wire [7:0] _T_25; // @[transfer.scala 69:29:@17.8]
  wire  _T_31; // @[transfer.scala 71:38:@25.8]
  wire  _T_32; // @[transfer.scala 71:27:@26.8]
  wire [7:0] _GEN_0; // @[transfer.scala 71:64:@27.8]
  wire [7:0] _GEN_2; // @[transfer.scala 68:58:@15.6]
  wire  _GEN_3; // @[transfer.scala 68:58:@15.6]
  wire [7:0] _GEN_4; // @[transfer.scala 67:20:@9.4]
  assign _T_18 = io_goal_num - 8'h1; // @[transfer.scala 68:49:@10.6]
  assign _T_19 = $unsigned(_T_18); // @[transfer.scala 68:49:@11.6]
  assign _T_20 = _T_19[7:0]; // @[transfer.scala 68:49:@12.6]
  assign _T_21 = io_cnt != _T_20; // @[transfer.scala 68:32:@13.6]
  assign _T_22 = io_pulse & _T_21; // @[transfer.scala 68:21:@14.6]
  assign _T_24 = cnt_temp + 8'h1; // @[transfer.scala 69:29:@16.8]
  assign _T_25 = _T_24[7:0]; // @[transfer.scala 69:29:@17.8]
  assign _T_31 = io_cnt == _T_20; // @[transfer.scala 71:38:@25.8]
  assign _T_32 = io_pulse & _T_31; // @[transfer.scala 71:27:@26.8]
  assign _GEN_0 = _T_32 ? 8'h0 : cnt_temp; // @[transfer.scala 71:64:@27.8]
  assign _GEN_2 = _T_22 ? _T_25 : _GEN_0; // @[transfer.scala 68:58:@15.6]
  assign _GEN_3 = _T_22 ? 1'h0 : _T_32; // @[transfer.scala 68:58:@15.6]
  assign _GEN_4 = io_valid ? _GEN_2 : 8'h0; // @[transfer.scala 67:20:@9.4]
  assign io_cnt = cnt_temp; // @[transfer.scala 83:11:@40.4]
  assign io_out_valid = io_valid ? _GEN_3 : 1'h0; // @[transfer.scala 70:22:@19.8 transfer.scala 73:22:@29.10 transfer.scala 76:22:@33.10 transfer.scala 80:20:@38.6]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  cnt_temp = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      cnt_temp <= 8'h0;
    end else begin
      if (io_valid) begin
        if (_T_22) begin
          cnt_temp <= _T_25;
        end else begin
          if (_T_32) begin
            cnt_temp <= 8'h0;
          end
        end
      end else begin
        cnt_temp <= 8'h0;
      end
    end
  end
endmodule
module Transfer2( // @[:@198.2]
  input        clock, // @[:@199.4]
  input        reset, // @[:@200.4]
  input  [7:0] io_dIn, // @[:@201.4]
  input  [9:0] io_dIn_addr, // @[:@201.4]
  input        io_input_valid, // @[:@201.4]
  output [7:0] io_RAM_OUT_0, // @[:@201.4]
  output [7:0] io_RAM_OUT_1, // @[:@201.4]
  output [7:0] io_RAM_OUT_2, // @[:@201.4]
  output [7:0] io_RAM_OUT_3, // @[:@201.4]
  output [7:0] io_RAM_OUT_4, // @[:@201.4]
  output [7:0] io_RAM_OUT_5, // @[:@201.4]
  output       io_out_valid // @[:@201.4]
);
  wire  Conter_pause_clock; // @[transfer.scala 89:21:@214.4]
  wire  Conter_pause_reset; // @[transfer.scala 89:21:@214.4]
  wire  Conter_pause_io_valid; // @[transfer.scala 89:21:@214.4]
  wire [7:0] Conter_pause_io_goal_num; // @[transfer.scala 89:21:@214.4]
  wire  Conter_pause_io_pulse; // @[transfer.scala 89:21:@214.4]
  wire [7:0] Conter_pause_io_cnt; // @[transfer.scala 89:21:@214.4]
  wire  Conter_pause_io_out_valid; // @[transfer.scala 89:21:@214.4]
  wire [15:0] DualPortRAM_io_dataOut; // @[transfer.scala 144:39:@220.4]
  wire  DualPortRAM_io_output_valid; // @[transfer.scala 144:39:@220.4]
  wire [9:0] DualPortRAM_io_output_addr; // @[transfer.scala 144:39:@220.4]
  wire  DualPortRAM_io_input_valid; // @[transfer.scala 144:39:@220.4]
  wire [15:0] DualPortRAM_io_dataIn; // @[transfer.scala 144:39:@220.4]
  wire [9:0] DualPortRAM_io_in_addr; // @[transfer.scala 144:39:@220.4]
  wire  DualPortRAM_reset; // @[transfer.scala 144:39:@220.4]
  wire  DualPortRAM_clock; // @[transfer.scala 144:39:@220.4]
  wire [15:0] DualPortRAM_1_io_dataOut; // @[transfer.scala 144:39:@229.4]
  wire  DualPortRAM_1_io_output_valid; // @[transfer.scala 144:39:@229.4]
  wire [9:0] DualPortRAM_1_io_output_addr; // @[transfer.scala 144:39:@229.4]
  wire  DualPortRAM_1_io_input_valid; // @[transfer.scala 144:39:@229.4]
  wire [15:0] DualPortRAM_1_io_dataIn; // @[transfer.scala 144:39:@229.4]
  wire [9:0] DualPortRAM_1_io_in_addr; // @[transfer.scala 144:39:@229.4]
  wire  DualPortRAM_1_reset; // @[transfer.scala 144:39:@229.4]
  wire  DualPortRAM_1_clock; // @[transfer.scala 144:39:@229.4]
  wire [15:0] DualPortRAM_2_io_dataOut; // @[transfer.scala 144:39:@238.4]
  wire  DualPortRAM_2_io_output_valid; // @[transfer.scala 144:39:@238.4]
  wire [9:0] DualPortRAM_2_io_output_addr; // @[transfer.scala 144:39:@238.4]
  wire  DualPortRAM_2_io_input_valid; // @[transfer.scala 144:39:@238.4]
  wire [15:0] DualPortRAM_2_io_dataIn; // @[transfer.scala 144:39:@238.4]
  wire [9:0] DualPortRAM_2_io_in_addr; // @[transfer.scala 144:39:@238.4]
  wire  DualPortRAM_2_reset; // @[transfer.scala 144:39:@238.4]
  wire  DualPortRAM_2_clock; // @[transfer.scala 144:39:@238.4]
  wire [15:0] DualPortRAM_3_io_dataOut; // @[transfer.scala 144:39:@247.4]
  wire  DualPortRAM_3_io_output_valid; // @[transfer.scala 144:39:@247.4]
  wire [9:0] DualPortRAM_3_io_output_addr; // @[transfer.scala 144:39:@247.4]
  wire  DualPortRAM_3_io_input_valid; // @[transfer.scala 144:39:@247.4]
  wire [15:0] DualPortRAM_3_io_dataIn; // @[transfer.scala 144:39:@247.4]
  wire [9:0] DualPortRAM_3_io_in_addr; // @[transfer.scala 144:39:@247.4]
  wire  DualPortRAM_3_reset; // @[transfer.scala 144:39:@247.4]
  wire  DualPortRAM_3_clock; // @[transfer.scala 144:39:@247.4]
  wire [15:0] DualPortRAM_4_io_dataOut; // @[transfer.scala 144:39:@256.4]
  wire  DualPortRAM_4_io_output_valid; // @[transfer.scala 144:39:@256.4]
  wire [9:0] DualPortRAM_4_io_output_addr; // @[transfer.scala 144:39:@256.4]
  wire  DualPortRAM_4_io_input_valid; // @[transfer.scala 144:39:@256.4]
  wire [15:0] DualPortRAM_4_io_dataIn; // @[transfer.scala 144:39:@256.4]
  wire [9:0] DualPortRAM_4_io_in_addr; // @[transfer.scala 144:39:@256.4]
  wire  DualPortRAM_4_reset; // @[transfer.scala 144:39:@256.4]
  wire  DualPortRAM_4_clock; // @[transfer.scala 144:39:@256.4]
  wire [15:0] DualPortRAM_5_io_dataOut; // @[transfer.scala 144:39:@265.4]
  wire  DualPortRAM_5_io_output_valid; // @[transfer.scala 144:39:@265.4]
  wire [9:0] DualPortRAM_5_io_output_addr; // @[transfer.scala 144:39:@265.4]
  wire  DualPortRAM_5_io_input_valid; // @[transfer.scala 144:39:@265.4]
  wire [15:0] DualPortRAM_5_io_dataIn; // @[transfer.scala 144:39:@265.4]
  wire [9:0] DualPortRAM_5_io_in_addr; // @[transfer.scala 144:39:@265.4]
  wire  DualPortRAM_5_reset; // @[transfer.scala 144:39:@265.4]
  wire  DualPortRAM_5_clock; // @[transfer.scala 144:39:@265.4]
  wire  Conter_pause_1_clock; // @[transfer.scala 89:21:@1005.4]
  wire  Conter_pause_1_reset; // @[transfer.scala 89:21:@1005.4]
  wire  Conter_pause_1_io_valid; // @[transfer.scala 89:21:@1005.4]
  wire [7:0] Conter_pause_1_io_goal_num; // @[transfer.scala 89:21:@1005.4]
  wire  Conter_pause_1_io_pulse; // @[transfer.scala 89:21:@1005.4]
  wire [7:0] Conter_pause_1_io_cnt; // @[transfer.scala 89:21:@1005.4]
  wire  Conter_pause_1_io_out_valid; // @[transfer.scala 89:21:@1005.4]
  wire  Conter_pause_2_clock; // @[transfer.scala 89:21:@1011.4]
  wire  Conter_pause_2_reset; // @[transfer.scala 89:21:@1011.4]
  wire  Conter_pause_2_io_valid; // @[transfer.scala 89:21:@1011.4]
  wire [7:0] Conter_pause_2_io_goal_num; // @[transfer.scala 89:21:@1011.4]
  wire  Conter_pause_2_io_pulse; // @[transfer.scala 89:21:@1011.4]
  wire [7:0] Conter_pause_2_io_cnt; // @[transfer.scala 89:21:@1011.4]
  wire  Conter_pause_2_io_out_valid; // @[transfer.scala 89:21:@1011.4]
  reg [4:0] value; // @[Counter.scala 26:33:@203.4]
  reg [31:0] _RAND_0;
  wire  _T_38; // @[Counter.scala 34:24:@205.6]
  wire [5:0] _T_40; // @[Counter.scala 35:22:@206.6]
  wire [4:0] _T_41; // @[Counter.scala 35:22:@207.6]
  wire [4:0] _GEN_0; // @[Counter.scala 37:21:@209.6]
  wire [4:0] _GEN_1; // @[Counter.scala 63:17:@204.4]
  wire  _T_232; // @[transfer.scala 226:17:@324.6]
  wire  _T_245; // @[transfer.scala 237:23:@376.8]
  wire  _T_258; // @[transfer.scala 249:23:@428.10]
  wire  _T_271; // @[transfer.scala 258:23:@480.12]
  wire  _T_284; // @[transfer.scala 267:23:@532.14]
  wire  _T_297; // @[transfer.scala 276:23:@584.16]
  wire  _GEN_16; // @[transfer.scala 267:30:@533.14]
  wire  _GEN_27; // @[transfer.scala 258:31:@481.12]
  wire  _GEN_31; // @[transfer.scala 258:31:@481.12]
  wire  _GEN_42; // @[transfer.scala 249:30:@429.10]
  wire  _GEN_46; // @[transfer.scala 249:30:@429.10]
  wire  _GEN_50; // @[transfer.scala 249:30:@429.10]
  wire  _GEN_61; // @[transfer.scala 237:30:@377.8]
  wire  _GEN_65; // @[transfer.scala 237:30:@377.8]
  wire  _GEN_69; // @[transfer.scala 237:30:@377.8]
  wire  _GEN_73; // @[transfer.scala 237:30:@377.8]
  wire  _GEN_83; // @[transfer.scala 226:24:@325.6]
  wire  _GEN_87; // @[transfer.scala 226:24:@325.6]
  wire  _GEN_91; // @[transfer.scala 226:24:@325.6]
  wire  _GEN_95; // @[transfer.scala 226:24:@325.6]
  wire  _GEN_99; // @[transfer.scala 226:24:@325.6]
  reg  _T_335; // @[Reg.scala 11:16:@736.4]
  reg [31:0] _RAND_1;
  reg  _T_337; // @[Reg.scala 11:16:@740.4]
  reg [31:0] _RAND_2;
  reg  _T_339; // @[Reg.scala 11:16:@744.4]
  reg [31:0] _RAND_3;
  reg  _T_341; // @[Reg.scala 11:16:@748.4]
  reg [31:0] _RAND_4;
  reg  _T_343; // @[Reg.scala 11:16:@752.4]
  reg [31:0] _RAND_5;
  reg  _T_345; // @[Reg.scala 11:16:@756.4]
  reg [31:0] _RAND_6;
  reg  _T_347; // @[Reg.scala 11:16:@760.4]
  reg [31:0] _RAND_7;
  reg  _T_349; // @[Reg.scala 11:16:@764.4]
  reg [31:0] _RAND_8;
  reg  _T_351; // @[Reg.scala 11:16:@768.4]
  reg [31:0] _RAND_9;
  reg  _T_353; // @[Reg.scala 11:16:@772.4]
  reg [31:0] _RAND_10;
  reg  _T_355; // @[Reg.scala 11:16:@776.4]
  reg [31:0] _RAND_11;
  reg  _T_357; // @[Reg.scala 11:16:@780.4]
  reg [31:0] _RAND_12;
  reg  _T_359; // @[Reg.scala 11:16:@784.4]
  reg [31:0] _RAND_13;
  reg  _T_361; // @[Reg.scala 11:16:@788.4]
  reg [31:0] _RAND_14;
  reg  _T_363; // @[Reg.scala 11:16:@792.4]
  reg [31:0] _RAND_15;
  reg  _T_365; // @[Reg.scala 11:16:@796.4]
  reg [31:0] _RAND_16;
  reg  _T_367; // @[Reg.scala 11:16:@800.4]
  reg [31:0] _RAND_17;
  reg  _T_369; // @[Reg.scala 11:16:@804.4]
  reg [31:0] _RAND_18;
  reg  _T_371; // @[Reg.scala 11:16:@808.4]
  reg [31:0] _RAND_19;
  reg  _T_373; // @[Reg.scala 11:16:@812.4]
  reg [31:0] _RAND_20;
  reg  _T_375; // @[Reg.scala 11:16:@816.4]
  reg [31:0] _RAND_21;
  reg  _T_377; // @[Reg.scala 11:16:@820.4]
  reg [31:0] _RAND_22;
  reg  _T_379; // @[Reg.scala 11:16:@824.4]
  reg [31:0] _RAND_23;
  reg  _T_381; // @[Reg.scala 11:16:@828.4]
  reg [31:0] _RAND_24;
  reg  _T_383; // @[Reg.scala 11:16:@832.4]
  reg [31:0] _RAND_25;
  reg  _T_385; // @[Reg.scala 11:16:@836.4]
  reg [31:0] _RAND_26;
  reg  _T_387; // @[Reg.scala 11:16:@840.4]
  reg [31:0] _RAND_27;
  reg  _T_389; // @[Reg.scala 11:16:@844.4]
  reg [31:0] _RAND_28;
  reg  _T_391; // @[Reg.scala 11:16:@848.4]
  reg [31:0] _RAND_29;
  reg  _T_393; // @[Reg.scala 11:16:@852.4]
  reg [31:0] _RAND_30;
  reg  _T_395; // @[Reg.scala 11:16:@856.4]
  reg [31:0] _RAND_31;
  reg  _T_397; // @[Reg.scala 11:16:@860.4]
  reg [31:0] _RAND_32;
  reg  _T_399; // @[Reg.scala 11:16:@864.4]
  reg [31:0] _RAND_33;
  reg  _T_401; // @[Reg.scala 11:16:@868.4]
  reg [31:0] _RAND_34;
  reg  _T_403; // @[Reg.scala 11:16:@872.4]
  reg [31:0] _RAND_35;
  reg  _T_405; // @[Reg.scala 11:16:@876.4]
  reg [31:0] _RAND_36;
  reg  _T_407; // @[Reg.scala 11:16:@880.4]
  reg [31:0] _RAND_37;
  reg  _T_409; // @[Reg.scala 11:16:@884.4]
  reg [31:0] _RAND_38;
  reg  _T_411; // @[Reg.scala 11:16:@888.4]
  reg [31:0] _RAND_39;
  reg  _T_413; // @[Reg.scala 11:16:@892.4]
  reg [31:0] _RAND_40;
  reg  _T_415; // @[Reg.scala 11:16:@896.4]
  reg [31:0] _RAND_41;
  reg  _T_417; // @[Reg.scala 11:16:@900.4]
  reg [31:0] _RAND_42;
  reg  _T_419; // @[Reg.scala 11:16:@904.4]
  reg [31:0] _RAND_43;
  reg  _T_421; // @[Reg.scala 11:16:@908.4]
  reg [31:0] _RAND_44;
  reg  _T_423; // @[Reg.scala 11:16:@912.4]
  reg [31:0] _RAND_45;
  reg  _T_425; // @[Reg.scala 11:16:@916.4]
  reg [31:0] _RAND_46;
  reg  _T_427; // @[Reg.scala 11:16:@920.4]
  reg [31:0] _RAND_47;
  reg  _T_429; // @[Reg.scala 11:16:@924.4]
  reg [31:0] _RAND_48;
  reg  _T_431; // @[Reg.scala 11:16:@928.4]
  reg [31:0] _RAND_49;
  reg  _T_433; // @[Reg.scala 11:16:@932.4]
  reg [31:0] _RAND_50;
  reg  _T_435; // @[Reg.scala 11:16:@936.4]
  reg [31:0] _RAND_51;
  reg  _T_437; // @[Reg.scala 11:16:@940.4]
  reg [31:0] _RAND_52;
  reg  _T_439; // @[Reg.scala 11:16:@944.4]
  reg [31:0] _RAND_53;
  reg  _T_441; // @[Reg.scala 11:16:@948.4]
  reg [31:0] _RAND_54;
  reg  _T_443; // @[Reg.scala 11:16:@952.4]
  reg [31:0] _RAND_55;
  reg  _T_445; // @[Reg.scala 11:16:@956.4]
  reg [31:0] _RAND_56;
  reg  _T_447; // @[Reg.scala 11:16:@960.4]
  reg [31:0] _RAND_57;
  reg  _T_449; // @[Reg.scala 11:16:@964.4]
  reg [31:0] _RAND_58;
  reg  _T_451; // @[Reg.scala 11:16:@968.4]
  reg [31:0] _RAND_59;
  reg  _T_453; // @[Reg.scala 11:16:@972.4]
  reg [31:0] _RAND_60;
  reg  _T_455; // @[Reg.scala 11:16:@976.4]
  reg [31:0] _RAND_61;
  reg  _T_457; // @[Reg.scala 11:16:@980.4]
  reg [31:0] _RAND_62;
  reg  _T_459; // @[Reg.scala 11:16:@984.4]
  reg [31:0] _RAND_63;
  reg  _T_461; // @[Reg.scala 11:16:@988.4]
  reg [31:0] _RAND_64;
  reg  _T_463; // @[Reg.scala 11:16:@992.4]
  reg [31:0] _RAND_65;
  reg  value_1; // @[Counter.scala 26:33:@997.4]
  reg [31:0] _RAND_66;
  wire [1:0] _T_469; // @[Counter.scala 35:22:@1000.6]
  wire  _T_470; // @[Counter.scala 35:22:@1001.6]
  wire  _GEN_194; // @[Counter.scala 63:17:@998.4]
  wire  _T_483; // @[transfer.scala 405:17:@1019.6]
  wire  _T_489; // @[transfer.scala 410:23:@1055.8]
  wire  _T_495; // @[transfer.scala 415:23:@1091.10]
  wire [7:0] _GEN_201; // @[transfer.scala 415:30:@1092.10]
  wire  _GEN_236; // @[transfer.scala 410:30:@1056.8]
  wire [7:0] _GEN_237; // @[transfer.scala 410:30:@1056.8]
  wire  _GEN_249; // @[transfer.scala 410:30:@1056.8]
  wire  _GEN_260; // @[transfer.scala 405:24:@1020.6]
  wire [7:0] _GEN_261; // @[transfer.scala 405:24:@1020.6]
  wire  _GEN_273; // @[transfer.scala 405:24:@1020.6]
  wire  _GEN_286; // @[transfer.scala 405:24:@1020.6]
  Conter_pause Conter_pause ( // @[transfer.scala 89:21:@214.4]
    .clock(Conter_pause_clock),
    .reset(Conter_pause_reset),
    .io_valid(Conter_pause_io_valid),
    .io_goal_num(Conter_pause_io_goal_num),
    .io_pulse(Conter_pause_io_pulse),
    .io_cnt(Conter_pause_io_cnt),
    .io_out_valid(Conter_pause_io_out_valid)
  );
  DualPortRAM DualPortRAM ( // @[transfer.scala 144:39:@220.4]
    .io_dataOut(DualPortRAM_io_dataOut),
    .io_output_valid(DualPortRAM_io_output_valid),
    .io_output_addr(DualPortRAM_io_output_addr),
    .io_input_valid(DualPortRAM_io_input_valid),
    .io_dataIn(DualPortRAM_io_dataIn),
    .io_in_addr(DualPortRAM_io_in_addr),
    .reset(DualPortRAM_reset),
    .clock(DualPortRAM_clock)
  );
  DualPortRAM DualPortRAM_1 ( // @[transfer.scala 144:39:@229.4]
    .io_dataOut(DualPortRAM_1_io_dataOut),
    .io_output_valid(DualPortRAM_1_io_output_valid),
    .io_output_addr(DualPortRAM_1_io_output_addr),
    .io_input_valid(DualPortRAM_1_io_input_valid),
    .io_dataIn(DualPortRAM_1_io_dataIn),
    .io_in_addr(DualPortRAM_1_io_in_addr),
    .reset(DualPortRAM_1_reset),
    .clock(DualPortRAM_1_clock)
  );
  DualPortRAM DualPortRAM_2 ( // @[transfer.scala 144:39:@238.4]
    .io_dataOut(DualPortRAM_2_io_dataOut),
    .io_output_valid(DualPortRAM_2_io_output_valid),
    .io_output_addr(DualPortRAM_2_io_output_addr),
    .io_input_valid(DualPortRAM_2_io_input_valid),
    .io_dataIn(DualPortRAM_2_io_dataIn),
    .io_in_addr(DualPortRAM_2_io_in_addr),
    .reset(DualPortRAM_2_reset),
    .clock(DualPortRAM_2_clock)
  );
  DualPortRAM DualPortRAM_3 ( // @[transfer.scala 144:39:@247.4]
    .io_dataOut(DualPortRAM_3_io_dataOut),
    .io_output_valid(DualPortRAM_3_io_output_valid),
    .io_output_addr(DualPortRAM_3_io_output_addr),
    .io_input_valid(DualPortRAM_3_io_input_valid),
    .io_dataIn(DualPortRAM_3_io_dataIn),
    .io_in_addr(DualPortRAM_3_io_in_addr),
    .reset(DualPortRAM_3_reset),
    .clock(DualPortRAM_3_clock)
  );
  DualPortRAM DualPortRAM_4 ( // @[transfer.scala 144:39:@256.4]
    .io_dataOut(DualPortRAM_4_io_dataOut),
    .io_output_valid(DualPortRAM_4_io_output_valid),
    .io_output_addr(DualPortRAM_4_io_output_addr),
    .io_input_valid(DualPortRAM_4_io_input_valid),
    .io_dataIn(DualPortRAM_4_io_dataIn),
    .io_in_addr(DualPortRAM_4_io_in_addr),
    .reset(DualPortRAM_4_reset),
    .clock(DualPortRAM_4_clock)
  );
  DualPortRAM DualPortRAM_5 ( // @[transfer.scala 144:39:@265.4]
    .io_dataOut(DualPortRAM_5_io_dataOut),
    .io_output_valid(DualPortRAM_5_io_output_valid),
    .io_output_addr(DualPortRAM_5_io_output_addr),
    .io_input_valid(DualPortRAM_5_io_input_valid),
    .io_dataIn(DualPortRAM_5_io_dataIn),
    .io_in_addr(DualPortRAM_5_io_in_addr),
    .reset(DualPortRAM_5_reset),
    .clock(DualPortRAM_5_clock)
  );
  Conter_pause Conter_pause_1 ( // @[transfer.scala 89:21:@1005.4]
    .clock(Conter_pause_1_clock),
    .reset(Conter_pause_1_reset),
    .io_valid(Conter_pause_1_io_valid),
    .io_goal_num(Conter_pause_1_io_goal_num),
    .io_pulse(Conter_pause_1_io_pulse),
    .io_cnt(Conter_pause_1_io_cnt),
    .io_out_valid(Conter_pause_1_io_out_valid)
  );
  Conter_pause Conter_pause_2 ( // @[transfer.scala 89:21:@1011.4]
    .clock(Conter_pause_2_clock),
    .reset(Conter_pause_2_reset),
    .io_valid(Conter_pause_2_io_valid),
    .io_goal_num(Conter_pause_2_io_goal_num),
    .io_pulse(Conter_pause_2_io_pulse),
    .io_cnt(Conter_pause_2_io_cnt),
    .io_out_valid(Conter_pause_2_io_out_valid)
  );
  assign _T_38 = value == 5'h11; // @[Counter.scala 34:24:@205.6]
  assign _T_40 = value + 5'h1; // @[Counter.scala 35:22:@206.6]
  assign _T_41 = _T_40[4:0]; // @[Counter.scala 35:22:@207.6]
  assign _GEN_0 = _T_38 ? 5'h0 : _T_41; // @[Counter.scala 37:21:@209.6]
  assign _GEN_1 = io_input_valid ? _GEN_0 : value; // @[Counter.scala 63:17:@204.4]
  assign _T_232 = Conter_pause_io_cnt == 8'h0; // @[transfer.scala 226:17:@324.6]
  assign _T_245 = Conter_pause_io_cnt == 8'h1; // @[transfer.scala 237:23:@376.8]
  assign _T_258 = Conter_pause_io_cnt == 8'h2; // @[transfer.scala 249:23:@428.10]
  assign _T_271 = Conter_pause_io_cnt == 8'h3; // @[transfer.scala 258:23:@480.12]
  assign _T_284 = Conter_pause_io_cnt == 8'h4; // @[transfer.scala 267:23:@532.14]
  assign _T_297 = Conter_pause_io_cnt == 8'h5; // @[transfer.scala 276:23:@584.16]
  assign _GEN_16 = _T_284 ? 1'h0 : _T_297; // @[transfer.scala 267:30:@533.14]
  assign _GEN_27 = _T_271 ? 1'h0 : _T_284; // @[transfer.scala 258:31:@481.12]
  assign _GEN_31 = _T_271 ? 1'h0 : _GEN_16; // @[transfer.scala 258:31:@481.12]
  assign _GEN_42 = _T_258 ? 1'h0 : _T_271; // @[transfer.scala 249:30:@429.10]
  assign _GEN_46 = _T_258 ? 1'h0 : _GEN_27; // @[transfer.scala 249:30:@429.10]
  assign _GEN_50 = _T_258 ? 1'h0 : _GEN_31; // @[transfer.scala 249:30:@429.10]
  assign _GEN_61 = _T_245 ? 1'h0 : _T_258; // @[transfer.scala 237:30:@377.8]
  assign _GEN_65 = _T_245 ? 1'h0 : _GEN_42; // @[transfer.scala 237:30:@377.8]
  assign _GEN_69 = _T_245 ? 1'h0 : _GEN_46; // @[transfer.scala 237:30:@377.8]
  assign _GEN_73 = _T_245 ? 1'h0 : _GEN_50; // @[transfer.scala 237:30:@377.8]
  assign _GEN_83 = _T_232 ? 1'h0 : _T_245; // @[transfer.scala 226:24:@325.6]
  assign _GEN_87 = _T_232 ? 1'h0 : _GEN_61; // @[transfer.scala 226:24:@325.6]
  assign _GEN_91 = _T_232 ? 1'h0 : _GEN_65; // @[transfer.scala 226:24:@325.6]
  assign _GEN_95 = _T_232 ? 1'h0 : _GEN_69; // @[transfer.scala 226:24:@325.6]
  assign _GEN_99 = _T_232 ? 1'h0 : _GEN_73; // @[transfer.scala 226:24:@325.6]
  assign _T_469 = value_1 + 1'h1; // @[Counter.scala 35:22:@1000.6]
  assign _T_470 = _T_469[0:0]; // @[Counter.scala 35:22:@1001.6]
  assign _GEN_194 = io_out_valid ? _T_470 : value_1; // @[Counter.scala 63:17:@998.4]
  assign _T_483 = Conter_pause_2_io_cnt == 8'h0; // @[transfer.scala 405:17:@1019.6]
  assign _T_489 = Conter_pause_2_io_cnt == 8'h1; // @[transfer.scala 410:23:@1055.8]
  assign _T_495 = Conter_pause_2_io_cnt == 8'h2; // @[transfer.scala 415:23:@1091.10]
  assign _GEN_201 = Conter_pause_1_io_cnt; // @[transfer.scala 415:30:@1092.10]
  assign _GEN_236 = _T_489 ? 1'h1 : _T_495; // @[transfer.scala 410:30:@1056.8]
  assign _GEN_237 = _T_489 ? Conter_pause_1_io_cnt : _GEN_201; // @[transfer.scala 410:30:@1056.8]
  assign _GEN_249 = _T_489 ? 1'h0 : _T_495; // @[transfer.scala 410:30:@1056.8]
  assign _GEN_260 = _T_483 ? 1'h1 : _GEN_249; // @[transfer.scala 405:24:@1020.6]
  assign _GEN_261 = _T_483 ? Conter_pause_1_io_cnt : _GEN_201; // @[transfer.scala 405:24:@1020.6]
  assign _GEN_273 = _T_483 ? 1'h1 : _T_489; // @[transfer.scala 405:24:@1020.6]
  assign _GEN_286 = _T_483 ? 1'h0 : _GEN_236; // @[transfer.scala 405:24:@1020.6]
  assign io_RAM_OUT_0 = 8'h0; // @[transfer.scala 426:18:@1127.4]
  assign io_RAM_OUT_1 = 8'h0; // @[transfer.scala 426:18:@1128.4]
  assign io_RAM_OUT_2 = 8'h0; // @[transfer.scala 426:18:@1129.4]
  assign io_RAM_OUT_3 = 8'h0; // @[transfer.scala 426:18:@1130.4]
  assign io_RAM_OUT_4 = 8'h0; // @[transfer.scala 426:18:@1131.4]
  assign io_RAM_OUT_5 = 8'h0; // @[transfer.scala 426:18:@1132.4]
  assign io_out_valid = _T_463; // @[transfer.scala 392:15:@996.4]
  assign Conter_pause_clock = clock; // @[:@215.4]
  assign Conter_pause_reset = reset; // @[:@216.4]
  assign Conter_pause_io_valid = io_input_valid; // @[transfer.scala 90:20:@217.4]
  assign Conter_pause_io_goal_num = 8'h6; // @[transfer.scala 91:23:@218.4]
  assign Conter_pause_io_pulse = io_input_valid & _T_38; // @[transfer.scala 92:20:@219.4]
  assign DualPortRAM_io_output_valid = io_out_valid ? _GEN_260 : 1'h0; // @[transfer.scala 144:20:@276.4]
  assign DualPortRAM_io_output_addr = {{2'd0}, _GEN_261}; // @[transfer.scala 144:20:@277.4]
  assign DualPortRAM_io_input_valid = io_input_valid ? _T_232 : 1'h0; // @[transfer.scala 144:20:@278.4]
  assign DualPortRAM_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 144:20:@279.4]
  assign DualPortRAM_io_in_addr = {{5'd0}, value}; // @[transfer.scala 144:20:@280.4]
  assign DualPortRAM_reset = reset; // @[transfer.scala 144:20:@281.4]
  assign DualPortRAM_clock = clock; // @[transfer.scala 144:20:@282.4]
  assign DualPortRAM_1_io_output_valid = io_out_valid ? _GEN_260 : 1'h0; // @[transfer.scala 144:20:@284.4]
  assign DualPortRAM_1_io_output_addr = {{2'd0}, _GEN_261}; // @[transfer.scala 144:20:@285.4]
  assign DualPortRAM_1_io_input_valid = io_input_valid ? _GEN_83 : 1'h0; // @[transfer.scala 144:20:@286.4]
  assign DualPortRAM_1_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 144:20:@287.4]
  assign DualPortRAM_1_io_in_addr = {{5'd0}, value}; // @[transfer.scala 144:20:@288.4]
  assign DualPortRAM_1_reset = reset; // @[transfer.scala 144:20:@289.4]
  assign DualPortRAM_1_clock = clock; // @[transfer.scala 144:20:@290.4]
  assign DualPortRAM_2_io_output_valid = io_out_valid ? _GEN_273 : 1'h0; // @[transfer.scala 144:20:@292.4]
  assign DualPortRAM_2_io_output_addr = {{2'd0}, _GEN_261}; // @[transfer.scala 144:20:@293.4]
  assign DualPortRAM_2_io_input_valid = io_input_valid ? _GEN_87 : 1'h0; // @[transfer.scala 144:20:@294.4]
  assign DualPortRAM_2_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 144:20:@295.4]
  assign DualPortRAM_2_io_in_addr = {{5'd0}, value}; // @[transfer.scala 144:20:@296.4]
  assign DualPortRAM_2_reset = reset; // @[transfer.scala 144:20:@297.4]
  assign DualPortRAM_2_clock = clock; // @[transfer.scala 144:20:@298.4]
  assign DualPortRAM_3_io_output_valid = io_out_valid ? _GEN_273 : 1'h0; // @[transfer.scala 144:20:@300.4]
  assign DualPortRAM_3_io_output_addr = {{2'd0}, _GEN_261}; // @[transfer.scala 144:20:@301.4]
  assign DualPortRAM_3_io_input_valid = io_input_valid ? _GEN_91 : 1'h0; // @[transfer.scala 144:20:@302.4]
  assign DualPortRAM_3_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 144:20:@303.4]
  assign DualPortRAM_3_io_in_addr = {{5'd0}, value}; // @[transfer.scala 144:20:@304.4]
  assign DualPortRAM_3_reset = reset; // @[transfer.scala 144:20:@305.4]
  assign DualPortRAM_3_clock = clock; // @[transfer.scala 144:20:@306.4]
  assign DualPortRAM_4_io_output_valid = io_out_valid ? _GEN_286 : 1'h0; // @[transfer.scala 144:20:@308.4]
  assign DualPortRAM_4_io_output_addr = {{2'd0}, _GEN_237}; // @[transfer.scala 144:20:@309.4]
  assign DualPortRAM_4_io_input_valid = io_input_valid ? _GEN_95 : 1'h0; // @[transfer.scala 144:20:@310.4]
  assign DualPortRAM_4_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 144:20:@311.4]
  assign DualPortRAM_4_io_in_addr = {{5'd0}, value}; // @[transfer.scala 144:20:@312.4]
  assign DualPortRAM_4_reset = reset; // @[transfer.scala 144:20:@313.4]
  assign DualPortRAM_4_clock = clock; // @[transfer.scala 144:20:@314.4]
  assign DualPortRAM_5_io_output_valid = io_out_valid ? _GEN_286 : 1'h0; // @[transfer.scala 144:20:@316.4]
  assign DualPortRAM_5_io_output_addr = {{2'd0}, _GEN_237}; // @[transfer.scala 144:20:@317.4]
  assign DualPortRAM_5_io_input_valid = io_input_valid ? _GEN_99 : 1'h0; // @[transfer.scala 144:20:@318.4]
  assign DualPortRAM_5_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 144:20:@319.4]
  assign DualPortRAM_5_io_in_addr = {{5'd0}, value}; // @[transfer.scala 144:20:@320.4]
  assign DualPortRAM_5_reset = reset; // @[transfer.scala 144:20:@321.4]
  assign DualPortRAM_5_clock = clock; // @[transfer.scala 144:20:@322.4]
  assign Conter_pause_1_clock = clock; // @[:@1006.4]
  assign Conter_pause_1_reset = reset; // @[:@1007.4]
  assign Conter_pause_1_io_valid = io_out_valid; // @[transfer.scala 90:20:@1008.4]
  assign Conter_pause_1_io_goal_num = 8'h12; // @[transfer.scala 91:23:@1009.4]
  assign Conter_pause_1_io_pulse = io_out_valid & value_1; // @[transfer.scala 92:20:@1010.4]
  assign Conter_pause_2_clock = clock; // @[:@1012.4]
  assign Conter_pause_2_reset = reset; // @[:@1013.4]
  assign Conter_pause_2_io_valid = io_out_valid; // @[transfer.scala 90:20:@1014.4]
  assign Conter_pause_2_io_goal_num = 8'h3; // @[transfer.scala 91:23:@1015.4]
  assign Conter_pause_2_io_pulse = Conter_pause_1_io_out_valid; // @[transfer.scala 92:20:@1016.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{$random}};
  value = _RAND_0[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  _T_335 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_337 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  _T_339 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  _T_341 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  _T_343 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  _T_345 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  _T_347 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  _T_349 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  _T_351 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  _T_353 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  _T_355 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  _T_357 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  _T_359 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  _T_361 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  _T_363 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  _T_365 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  _T_367 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  _T_369 = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  _T_371 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  _T_373 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  _T_375 = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  _T_377 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{$random}};
  _T_379 = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{$random}};
  _T_381 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{$random}};
  _T_383 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{$random}};
  _T_385 = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{$random}};
  _T_387 = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{$random}};
  _T_389 = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{$random}};
  _T_391 = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{$random}};
  _T_393 = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{$random}};
  _T_395 = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{$random}};
  _T_397 = _RAND_32[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{$random}};
  _T_399 = _RAND_33[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{$random}};
  _T_401 = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{$random}};
  _T_403 = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{$random}};
  _T_405 = _RAND_36[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{$random}};
  _T_407 = _RAND_37[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{$random}};
  _T_409 = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{$random}};
  _T_411 = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{$random}};
  _T_413 = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{$random}};
  _T_415 = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{$random}};
  _T_417 = _RAND_42[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{$random}};
  _T_419 = _RAND_43[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{$random}};
  _T_421 = _RAND_44[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{$random}};
  _T_423 = _RAND_45[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{$random}};
  _T_425 = _RAND_46[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{$random}};
  _T_427 = _RAND_47[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{$random}};
  _T_429 = _RAND_48[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{$random}};
  _T_431 = _RAND_49[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{$random}};
  _T_433 = _RAND_50[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{$random}};
  _T_435 = _RAND_51[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{$random}};
  _T_437 = _RAND_52[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{$random}};
  _T_439 = _RAND_53[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{$random}};
  _T_441 = _RAND_54[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{$random}};
  _T_443 = _RAND_55[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{$random}};
  _T_445 = _RAND_56[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{$random}};
  _T_447 = _RAND_57[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{$random}};
  _T_449 = _RAND_58[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{$random}};
  _T_451 = _RAND_59[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{$random}};
  _T_453 = _RAND_60[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{$random}};
  _T_455 = _RAND_61[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{$random}};
  _T_457 = _RAND_62[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{$random}};
  _T_459 = _RAND_63[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_64 = {1{$random}};
  _T_461 = _RAND_64[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_65 = {1{$random}};
  _T_463 = _RAND_65[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_66 = {1{$random}};
  value_1 = _RAND_66[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 5'h0;
    end else begin
      if (io_input_valid) begin
        if (_T_38) begin
          value <= 5'h0;
        end else begin
          value <= _T_41;
        end
      end
    end
    _T_335 <= io_input_valid;
    _T_337 <= _T_335;
    _T_339 <= _T_337;
    _T_341 <= _T_339;
    _T_343 <= _T_341;
    _T_345 <= _T_343;
    _T_347 <= _T_345;
    _T_349 <= _T_347;
    _T_351 <= _T_349;
    _T_353 <= _T_351;
    _T_355 <= _T_353;
    _T_357 <= _T_355;
    _T_359 <= _T_357;
    _T_361 <= _T_359;
    _T_363 <= _T_361;
    _T_365 <= _T_363;
    _T_367 <= _T_365;
    _T_369 <= _T_367;
    _T_371 <= _T_369;
    _T_373 <= _T_371;
    _T_375 <= _T_373;
    _T_377 <= _T_375;
    _T_379 <= _T_377;
    _T_381 <= _T_379;
    _T_383 <= _T_381;
    _T_385 <= _T_383;
    _T_387 <= _T_385;
    _T_389 <= _T_387;
    _T_391 <= _T_389;
    _T_393 <= _T_391;
    _T_395 <= _T_393;
    _T_397 <= _T_395;
    _T_399 <= _T_397;
    _T_401 <= _T_399;
    _T_403 <= _T_401;
    _T_405 <= _T_403;
    _T_407 <= _T_405;
    _T_409 <= _T_407;
    _T_411 <= _T_409;
    _T_413 <= _T_411;
    _T_415 <= _T_413;
    _T_417 <= _T_415;
    _T_419 <= _T_417;
    _T_421 <= _T_419;
    _T_423 <= _T_421;
    _T_425 <= _T_423;
    _T_427 <= _T_425;
    _T_429 <= _T_427;
    _T_431 <= _T_429;
    _T_433 <= _T_431;
    _T_435 <= _T_433;
    _T_437 <= _T_435;
    _T_439 <= _T_437;
    _T_441 <= _T_439;
    _T_443 <= _T_441;
    _T_445 <= _T_443;
    _T_447 <= _T_445;
    _T_449 <= _T_447;
    _T_451 <= _T_449;
    _T_453 <= _T_451;
    _T_455 <= _T_453;
    _T_457 <= _T_455;
    _T_459 <= _T_457;
    _T_461 <= _T_459;
    _T_463 <= _T_461;
    if (reset) begin
      value_1 <= 1'h0;
    end else begin
      if (io_out_valid) begin
        value_1 <= _T_470;
      end
    end
  end
endmodule
