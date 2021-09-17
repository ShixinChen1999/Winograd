
module Transfer( // @[:@198.2]
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
  wire  Conter_pause_clock; // @[transfer.scala 91:21:@214.4]
  wire  Conter_pause_reset; // @[transfer.scala 91:21:@214.4]
  wire  Conter_pause_io_valid; // @[transfer.scala 91:21:@214.4]
  wire [11:0] Conter_pause_io_goal_num; // @[transfer.scala 91:21:@214.4]
  wire  Conter_pause_io_pulse; // @[transfer.scala 91:21:@214.4]
  wire [11:0] Conter_pause_io_cnt; // @[transfer.scala 91:21:@214.4]
  wire  Conter_pause_io_out_valid; // @[transfer.scala 91:21:@214.4]
  wire [15:0] DualPortRAM_io_dataOut; // @[transfer.scala 143:39:@220.4]
  wire  DualPortRAM_io_output_valid; // @[transfer.scala 143:39:@220.4]
  wire [9:0] DualPortRAM_io_output_addr; // @[transfer.scala 143:39:@220.4]
  wire  DualPortRAM_io_input_valid; // @[transfer.scala 143:39:@220.4]
  wire [15:0] DualPortRAM_io_dataIn; // @[transfer.scala 143:39:@220.4]
  wire [9:0] DualPortRAM_io_in_addr; // @[transfer.scala 143:39:@220.4]
  wire  DualPortRAM_reset; // @[transfer.scala 143:39:@220.4]
  wire  DualPortRAM_clock; // @[transfer.scala 143:39:@220.4]
  wire [15:0] DualPortRAM_1_io_dataOut; // @[transfer.scala 143:39:@229.4]
  wire  DualPortRAM_1_io_output_valid; // @[transfer.scala 143:39:@229.4]
  wire [9:0] DualPortRAM_1_io_output_addr; // @[transfer.scala 143:39:@229.4]
  wire  DualPortRAM_1_io_input_valid; // @[transfer.scala 143:39:@229.4]
  wire [15:0] DualPortRAM_1_io_dataIn; // @[transfer.scala 143:39:@229.4]
  wire [9:0] DualPortRAM_1_io_in_addr; // @[transfer.scala 143:39:@229.4]
  wire  DualPortRAM_1_reset; // @[transfer.scala 143:39:@229.4]
  wire  DualPortRAM_1_clock; // @[transfer.scala 143:39:@229.4]
  wire [15:0] DualPortRAM_2_io_dataOut; // @[transfer.scala 143:39:@238.4]
  wire  DualPortRAM_2_io_output_valid; // @[transfer.scala 143:39:@238.4]
  wire [9:0] DualPortRAM_2_io_output_addr; // @[transfer.scala 143:39:@238.4]
  wire  DualPortRAM_2_io_input_valid; // @[transfer.scala 143:39:@238.4]
  wire [15:0] DualPortRAM_2_io_dataIn; // @[transfer.scala 143:39:@238.4]
  wire [9:0] DualPortRAM_2_io_in_addr; // @[transfer.scala 143:39:@238.4]
  wire  DualPortRAM_2_reset; // @[transfer.scala 143:39:@238.4]
  wire  DualPortRAM_2_clock; // @[transfer.scala 143:39:@238.4]
  wire [15:0] DualPortRAM_3_io_dataOut; // @[transfer.scala 143:39:@247.4]
  wire  DualPortRAM_3_io_output_valid; // @[transfer.scala 143:39:@247.4]
  wire [9:0] DualPortRAM_3_io_output_addr; // @[transfer.scala 143:39:@247.4]
  wire  DualPortRAM_3_io_input_valid; // @[transfer.scala 143:39:@247.4]
  wire [15:0] DualPortRAM_3_io_dataIn; // @[transfer.scala 143:39:@247.4]
  wire [9:0] DualPortRAM_3_io_in_addr; // @[transfer.scala 143:39:@247.4]
  wire  DualPortRAM_3_reset; // @[transfer.scala 143:39:@247.4]
  wire  DualPortRAM_3_clock; // @[transfer.scala 143:39:@247.4]
  wire [15:0] DualPortRAM_4_io_dataOut; // @[transfer.scala 143:39:@256.4]
  wire  DualPortRAM_4_io_output_valid; // @[transfer.scala 143:39:@256.4]
  wire [9:0] DualPortRAM_4_io_output_addr; // @[transfer.scala 143:39:@256.4]
  wire  DualPortRAM_4_io_input_valid; // @[transfer.scala 143:39:@256.4]
  wire [15:0] DualPortRAM_4_io_dataIn; // @[transfer.scala 143:39:@256.4]
  wire [9:0] DualPortRAM_4_io_in_addr; // @[transfer.scala 143:39:@256.4]
  wire  DualPortRAM_4_reset; // @[transfer.scala 143:39:@256.4]
  wire  DualPortRAM_4_clock; // @[transfer.scala 143:39:@256.4]
  wire [15:0] DualPortRAM_5_io_dataOut; // @[transfer.scala 143:39:@265.4]
  wire  DualPortRAM_5_io_output_valid; // @[transfer.scala 143:39:@265.4]
  wire [9:0] DualPortRAM_5_io_output_addr; // @[transfer.scala 143:39:@265.4]
  wire  DualPortRAM_5_io_input_valid; // @[transfer.scala 143:39:@265.4]
  wire [15:0] DualPortRAM_5_io_dataIn; // @[transfer.scala 143:39:@265.4]
  wire [9:0] DualPortRAM_5_io_in_addr; // @[transfer.scala 143:39:@265.4]
  wire  DualPortRAM_5_reset; // @[transfer.scala 143:39:@265.4]
  wire  DualPortRAM_5_clock; // @[transfer.scala 143:39:@265.4]
  wire  Conter_pause_1_clock; // @[transfer.scala 91:21:@765.4]
  wire  Conter_pause_1_reset; // @[transfer.scala 91:21:@765.4]
  wire  Conter_pause_1_io_valid; // @[transfer.scala 91:21:@765.4]
  wire [11:0] Conter_pause_1_io_goal_num; // @[transfer.scala 91:21:@765.4]
  wire  Conter_pause_1_io_pulse; // @[transfer.scala 91:21:@765.4]
  wire [11:0] Conter_pause_1_io_cnt; // @[transfer.scala 91:21:@765.4]
  wire  Conter_pause_1_io_out_valid; // @[transfer.scala 91:21:@765.4]
  wire  Conter_pause_2_clock; // @[transfer.scala 91:21:@771.4]
  wire  Conter_pause_2_reset; // @[transfer.scala 91:21:@771.4]
  wire  Conter_pause_2_io_valid; // @[transfer.scala 91:21:@771.4]
  wire [11:0] Conter_pause_2_io_goal_num; // @[transfer.scala 91:21:@771.4]
  wire  Conter_pause_2_io_pulse; // @[transfer.scala 91:21:@771.4]
  wire [11:0] Conter_pause_2_io_cnt; // @[transfer.scala 91:21:@771.4]
  wire  Conter_pause_2_io_out_valid; // @[transfer.scala 91:21:@771.4]
  reg [9:0] value; // @[Counter.scala 26:33:@203.4]
  reg [31:0] _RAND_0;
  wire  _T_38; // @[Counter.scala 34:24:@205.6]
  wire [10:0] _T_40; // @[Counter.scala 35:22:@206.6]
  wire [9:0] _T_41; // @[Counter.scala 35:22:@207.6]
  wire [9:0] _GEN_0; // @[Counter.scala 37:21:@209.6]
  wire [9:0] _GEN_1; // @[Counter.scala 63:17:@204.4]
  wire  _T_232; // @[transfer.scala 147:17:@324.6]
  wire  _T_245; // @[transfer.scala 155:23:@376.8]
  wire  _T_258; // @[transfer.scala 167:23:@428.10]
  wire  _T_271; // @[transfer.scala 176:23:@480.12]
  wire  _T_284; // @[transfer.scala 185:23:@532.14]
  wire  _T_297; // @[transfer.scala 194:23:@584.16]
  wire  _GEN_16; // @[transfer.scala 185:30:@533.14]
  wire  _GEN_27; // @[transfer.scala 176:31:@481.12]
  wire  _GEN_31; // @[transfer.scala 176:31:@481.12]
  wire  _GEN_42; // @[transfer.scala 167:30:@429.10]
  wire  _GEN_46; // @[transfer.scala 167:30:@429.10]
  wire  _GEN_50; // @[transfer.scala 167:30:@429.10]
  wire  _GEN_61; // @[transfer.scala 155:30:@377.8]
  wire  _GEN_65; // @[transfer.scala 155:30:@377.8]
  wire  _GEN_69; // @[transfer.scala 155:30:@377.8]
  wire  _GEN_73; // @[transfer.scala 155:30:@377.8]
  wire  _GEN_83; // @[transfer.scala 147:24:@325.6]
  wire  _GEN_87; // @[transfer.scala 147:24:@325.6]
  wire  _GEN_91; // @[transfer.scala 147:24:@325.6]
  wire  _GEN_95; // @[transfer.scala 147:24:@325.6]
  wire  _GEN_99; // @[transfer.scala 147:24:@325.6]
  reg [11:0] value_1; // @[Counter.scala 26:33:@736.4]
  reg [31:0] _RAND_1;
  wire  _T_336; // @[Counter.scala 34:24:@738.6]
  wire [12:0] _T_338; // @[Counter.scala 35:22:@739.6]
  wire [11:0] _T_339; // @[Counter.scala 35:22:@740.6]
  wire [11:0] _GEN_129; // @[Counter.scala 37:21:@742.6]
  wire [11:0] _GEN_130; // @[Counter.scala 63:17:@737.4]
  wire  cnt_inter_valid; // @[Counter.scala 64:20:@746.4]
  reg  out_valid; // @[transfer.scala 221:24:@747.4]
  reg [31:0] _RAND_2;
  wire  _GEN_131; // @[transfer.scala 223:24:@748.4]
  wire  _GEN_132; // @[transfer.scala 227:18:@751.4]
  reg  _T_346; // @[transfer.scala 231:24:@754.4]
  reg [31:0] _RAND_3;
  reg  value_2; // @[Counter.scala 26:33:@757.4]
  reg [31:0] _RAND_4;
  wire [1:0] _T_352; // @[Counter.scala 35:22:@760.6]
  wire  _T_353; // @[Counter.scala 35:22:@761.6]
  wire  _GEN_133; // @[Counter.scala 63:17:@758.4]
  wire  _T_366; // @[transfer.scala 242:17:@779.6]
  wire  _T_372; // @[transfer.scala 247:23:@815.8]
  wire  _T_378; // @[transfer.scala 252:23:@851.10]
  wire [11:0] _GEN_140; // @[transfer.scala 252:30:@852.10]
  wire  _GEN_175; // @[transfer.scala 247:30:@816.8]
  wire [11:0] _GEN_176; // @[transfer.scala 247:30:@816.8]
  wire  _GEN_188; // @[transfer.scala 247:30:@816.8]
  wire  _GEN_199; // @[transfer.scala 242:24:@780.6]
  wire [11:0] _GEN_200; // @[transfer.scala 242:24:@780.6]
  wire  _GEN_212; // @[transfer.scala 242:24:@780.6]
  wire  _GEN_225; // @[transfer.scala 242:24:@780.6]
  Conter_pause Conter_pause ( // @[transfer.scala 91:21:@214.4]
    .clock(Conter_pause_clock),
    .reset(Conter_pause_reset),
    .io_valid(Conter_pause_io_valid),
    .io_goal_num(Conter_pause_io_goal_num),
    .io_pulse(Conter_pause_io_pulse),
    .io_cnt(Conter_pause_io_cnt),
    .io_out_valid(Conter_pause_io_out_valid)
  );
  DualPortRAM DualPortRAM ( // @[transfer.scala 143:39:@220.4]
    .io_dataOut(DualPortRAM_io_dataOut),
    .io_output_valid(DualPortRAM_io_output_valid),
    .io_output_addr(DualPortRAM_io_output_addr),
    .io_input_valid(DualPortRAM_io_input_valid),
    .io_dataIn(DualPortRAM_io_dataIn),
    .io_in_addr(DualPortRAM_io_in_addr),
    .reset(DualPortRAM_reset),
    .clock(DualPortRAM_clock)
  );
  DualPortRAM DualPortRAM_1 ( // @[transfer.scala 143:39:@229.4]
    .io_dataOut(DualPortRAM_1_io_dataOut),
    .io_output_valid(DualPortRAM_1_io_output_valid),
    .io_output_addr(DualPortRAM_1_io_output_addr),
    .io_input_valid(DualPortRAM_1_io_input_valid),
    .io_dataIn(DualPortRAM_1_io_dataIn),
    .io_in_addr(DualPortRAM_1_io_in_addr),
    .reset(DualPortRAM_1_reset),
    .clock(DualPortRAM_1_clock)
  );
  DualPortRAM DualPortRAM_2 ( // @[transfer.scala 143:39:@238.4]
    .io_dataOut(DualPortRAM_2_io_dataOut),
    .io_output_valid(DualPortRAM_2_io_output_valid),
    .io_output_addr(DualPortRAM_2_io_output_addr),
    .io_input_valid(DualPortRAM_2_io_input_valid),
    .io_dataIn(DualPortRAM_2_io_dataIn),
    .io_in_addr(DualPortRAM_2_io_in_addr),
    .reset(DualPortRAM_2_reset),
    .clock(DualPortRAM_2_clock)
  );
  DualPortRAM DualPortRAM_3 ( // @[transfer.scala 143:39:@247.4]
    .io_dataOut(DualPortRAM_3_io_dataOut),
    .io_output_valid(DualPortRAM_3_io_output_valid),
    .io_output_addr(DualPortRAM_3_io_output_addr),
    .io_input_valid(DualPortRAM_3_io_input_valid),
    .io_dataIn(DualPortRAM_3_io_dataIn),
    .io_in_addr(DualPortRAM_3_io_in_addr),
    .reset(DualPortRAM_3_reset),
    .clock(DualPortRAM_3_clock)
  );
  DualPortRAM DualPortRAM_4 ( // @[transfer.scala 143:39:@256.4]
    .io_dataOut(DualPortRAM_4_io_dataOut),
    .io_output_valid(DualPortRAM_4_io_output_valid),
    .io_output_addr(DualPortRAM_4_io_output_addr),
    .io_input_valid(DualPortRAM_4_io_input_valid),
    .io_dataIn(DualPortRAM_4_io_dataIn),
    .io_in_addr(DualPortRAM_4_io_in_addr),
    .reset(DualPortRAM_4_reset),
    .clock(DualPortRAM_4_clock)
  );
  DualPortRAM DualPortRAM_5 ( // @[transfer.scala 143:39:@265.4]
    .io_dataOut(DualPortRAM_5_io_dataOut),
    .io_output_valid(DualPortRAM_5_io_output_valid),
    .io_output_addr(DualPortRAM_5_io_output_addr),
    .io_input_valid(DualPortRAM_5_io_input_valid),
    .io_dataIn(DualPortRAM_5_io_dataIn),
    .io_in_addr(DualPortRAM_5_io_in_addr),
    .reset(DualPortRAM_5_reset),
    .clock(DualPortRAM_5_clock)
  );
  Conter_pause Conter_pause_1 ( // @[transfer.scala 91:21:@765.4]
    .clock(Conter_pause_1_clock),
    .reset(Conter_pause_1_reset),
    .io_valid(Conter_pause_1_io_valid),
    .io_goal_num(Conter_pause_1_io_goal_num),
    .io_pulse(Conter_pause_1_io_pulse),
    .io_cnt(Conter_pause_1_io_cnt),
    .io_out_valid(Conter_pause_1_io_out_valid)
  );
  Conter_pause Conter_pause_2 ( // @[transfer.scala 91:21:@771.4]
    .clock(Conter_pause_2_clock),
    .reset(Conter_pause_2_reset),
    .io_valid(Conter_pause_2_io_valid),
    .io_goal_num(Conter_pause_2_io_goal_num),
    .io_pulse(Conter_pause_2_io_pulse),
    .io_cnt(Conter_pause_2_io_cnt),
    .io_out_valid(Conter_pause_2_io_out_valid)
  );
  assign _T_38 = value == 10'h281; // @[Counter.scala 34:24:@205.6]
  assign _T_40 = value + 10'h1; // @[Counter.scala 35:22:@206.6]
  assign _T_41 = _T_40[9:0]; // @[Counter.scala 35:22:@207.6]
  assign _GEN_0 = _T_38 ? 10'h0 : _T_41; // @[Counter.scala 37:21:@209.6]
  assign _GEN_1 = io_input_valid ? _GEN_0 : value; // @[Counter.scala 63:17:@204.4]
  assign _T_232 = Conter_pause_io_cnt == 12'h0; // @[transfer.scala 147:17:@324.6]
  assign _T_245 = Conter_pause_io_cnt == 12'h1; // @[transfer.scala 155:23:@376.8]
  assign _T_258 = Conter_pause_io_cnt == 12'h2; // @[transfer.scala 167:23:@428.10]
  assign _T_271 = Conter_pause_io_cnt == 12'h3; // @[transfer.scala 176:23:@480.12]
  assign _T_284 = Conter_pause_io_cnt == 12'h4; // @[transfer.scala 185:23:@532.14]
  assign _T_297 = Conter_pause_io_cnt == 12'h5; // @[transfer.scala 194:23:@584.16]
  assign _GEN_16 = _T_284 ? 1'h0 : _T_297; // @[transfer.scala 185:30:@533.14]
  assign _GEN_27 = _T_271 ? 1'h0 : _T_284; // @[transfer.scala 176:31:@481.12]
  assign _GEN_31 = _T_271 ? 1'h0 : _GEN_16; // @[transfer.scala 176:31:@481.12]
  assign _GEN_42 = _T_258 ? 1'h0 : _T_271; // @[transfer.scala 167:30:@429.10]
  assign _GEN_46 = _T_258 ? 1'h0 : _GEN_27; // @[transfer.scala 167:30:@429.10]
  assign _GEN_50 = _T_258 ? 1'h0 : _GEN_31; // @[transfer.scala 167:30:@429.10]
  assign _GEN_61 = _T_245 ? 1'h0 : _T_258; // @[transfer.scala 155:30:@377.8]
  assign _GEN_65 = _T_245 ? 1'h0 : _GEN_42; // @[transfer.scala 155:30:@377.8]
  assign _GEN_69 = _T_245 ? 1'h0 : _GEN_46; // @[transfer.scala 155:30:@377.8]
  assign _GEN_73 = _T_245 ? 1'h0 : _GEN_50; // @[transfer.scala 155:30:@377.8]
  assign _GEN_83 = _T_232 ? 1'h0 : _T_245; // @[transfer.scala 147:24:@325.6]
  assign _GEN_87 = _T_232 ? 1'h0 : _GEN_61; // @[transfer.scala 147:24:@325.6]
  assign _GEN_91 = _T_232 ? 1'h0 : _GEN_65; // @[transfer.scala 147:24:@325.6]
  assign _GEN_95 = _T_232 ? 1'h0 : _GEN_69; // @[transfer.scala 147:24:@325.6]
  assign _GEN_99 = _T_232 ? 1'h0 : _GEN_73; // @[transfer.scala 147:24:@325.6]
  assign _T_336 = value_1 == 12'ha07; // @[Counter.scala 34:24:@738.6]
  assign _T_338 = value_1 + 12'h1; // @[Counter.scala 35:22:@739.6]
  assign _T_339 = _T_338[11:0]; // @[Counter.scala 35:22:@740.6]
  assign _GEN_129 = _T_336 ? 12'h0 : _T_339; // @[Counter.scala 37:21:@742.6]
  assign _GEN_130 = io_input_valid ? _GEN_129 : value_1; // @[Counter.scala 63:17:@737.4]
  assign cnt_inter_valid = io_input_valid & _T_336; // @[Counter.scala 64:20:@746.4]
  assign _GEN_131 = cnt_inter_valid ? 1'h1 : out_valid; // @[transfer.scala 223:24:@748.4]
  assign _GEN_132 = out_valid ? 1'h1 : _GEN_131; // @[transfer.scala 227:18:@751.4]
  assign _T_352 = value_2 + 1'h1; // @[Counter.scala 35:22:@760.6]
  assign _T_353 = _T_352[0:0]; // @[Counter.scala 35:22:@761.6]
  assign _GEN_133 = out_valid ? _T_353 : value_2; // @[Counter.scala 63:17:@758.4]
  assign _T_366 = Conter_pause_2_io_cnt == 12'h0; // @[transfer.scala 242:17:@779.6]
  assign _T_372 = Conter_pause_2_io_cnt == 12'h1; // @[transfer.scala 247:23:@815.8]
  assign _T_378 = Conter_pause_2_io_cnt == 12'h2; // @[transfer.scala 252:23:@851.10]
  assign _GEN_140 = Conter_pause_1_io_cnt; // @[transfer.scala 252:30:@852.10]
  assign _GEN_175 = _T_372 ? 1'h1 : _T_378; // @[transfer.scala 247:30:@816.8]
  assign _GEN_176 = _T_372 ? Conter_pause_1_io_cnt : _GEN_140; // @[transfer.scala 247:30:@816.8]
  assign _GEN_188 = _T_372 ? 1'h0 : _T_378; // @[transfer.scala 247:30:@816.8]
  assign _GEN_199 = _T_366 ? 1'h1 : _GEN_188; // @[transfer.scala 242:24:@780.6]
  assign _GEN_200 = _T_366 ? Conter_pause_1_io_cnt : _GEN_140; // @[transfer.scala 242:24:@780.6]
  assign _GEN_212 = _T_366 ? 1'h1 : _T_372; // @[transfer.scala 242:24:@780.6]
  assign _GEN_225 = _T_366 ? 1'h0 : _GEN_175; // @[transfer.scala 242:24:@780.6]
  assign io_RAM_OUT_0 = DualPortRAM_io_dataOut;
                   assign io_RAM_OUT_1 = DualPortRAM_1_io_dataOut;
                   assign io_RAM_OUT_2 =  DualPortRAM_2_io_dataOut;
                   assign io_RAM_OUT_3 =  DualPortRAM_3_io_dataOut;
                   assign io_RAM_OUT_4 =  DualPortRAM_4_io_dataOut;
                   assign io_RAM_OUT_5 =  DualPortRAM_5_io_dataOut;

  assign io_out_valid = _T_346; // @[transfer.scala 231:15:@756.4]
  assign Conter_pause_clock = clock; // @[:@215.4]
  assign Conter_pause_reset = reset; // @[:@216.4]
  assign Conter_pause_io_valid = io_input_valid; // @[transfer.scala 92:20:@217.4]
  assign Conter_pause_io_goal_num = 12'h6; // @[transfer.scala 93:23:@218.4]
  assign Conter_pause_io_pulse = io_input_valid & _T_38; // @[transfer.scala 94:20:@219.4]
  assign DualPortRAM_io_output_valid = out_valid ? _GEN_199 : 1'h0; // @[transfer.scala 143:20:@276.4]
  assign DualPortRAM_io_output_addr = _GEN_200[9:0]; // @[transfer.scala 143:20:@277.4]
  assign DualPortRAM_io_input_valid = io_input_valid ? _T_232 : 1'h0; // @[transfer.scala 143:20:@278.4]
  assign DualPortRAM_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 143:20:@279.4]
  assign DualPortRAM_io_in_addr = value; // @[transfer.scala 143:20:@280.4]
  assign DualPortRAM_reset = reset; // @[transfer.scala 143:20:@281.4]
  assign DualPortRAM_clock = clock; // @[transfer.scala 143:20:@282.4]
  assign DualPortRAM_1_io_output_valid = out_valid ? _GEN_199 : 1'h0; // @[transfer.scala 143:20:@284.4]
  assign DualPortRAM_1_io_output_addr = _GEN_200[9:0]; // @[transfer.scala 143:20:@285.4]
  assign DualPortRAM_1_io_input_valid = io_input_valid ? _GEN_83 : 1'h0; // @[transfer.scala 143:20:@286.4]
  assign DualPortRAM_1_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 143:20:@287.4]
  assign DualPortRAM_1_io_in_addr = value; // @[transfer.scala 143:20:@288.4]
  assign DualPortRAM_1_reset = reset; // @[transfer.scala 143:20:@289.4]
  assign DualPortRAM_1_clock = clock; // @[transfer.scala 143:20:@290.4]
  assign DualPortRAM_2_io_output_valid = out_valid ? _GEN_212 : 1'h0; // @[transfer.scala 143:20:@292.4]
  assign DualPortRAM_2_io_output_addr = _GEN_200[9:0]; // @[transfer.scala 143:20:@293.4]
  assign DualPortRAM_2_io_input_valid = io_input_valid ? _GEN_87 : 1'h0; // @[transfer.scala 143:20:@294.4]
  assign DualPortRAM_2_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 143:20:@295.4]
  assign DualPortRAM_2_io_in_addr = value; // @[transfer.scala 143:20:@296.4]
  assign DualPortRAM_2_reset = reset; // @[transfer.scala 143:20:@297.4]
  assign DualPortRAM_2_clock = clock; // @[transfer.scala 143:20:@298.4]
  assign DualPortRAM_3_io_output_valid = out_valid ? _GEN_212 : 1'h0; // @[transfer.scala 143:20:@300.4]
  assign DualPortRAM_3_io_output_addr = _GEN_200[9:0]; // @[transfer.scala 143:20:@301.4]
  assign DualPortRAM_3_io_input_valid = io_input_valid ? _GEN_91 : 1'h0; // @[transfer.scala 143:20:@302.4]
  assign DualPortRAM_3_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 143:20:@303.4]
  assign DualPortRAM_3_io_in_addr = value; // @[transfer.scala 143:20:@304.4]
  assign DualPortRAM_3_reset = reset; // @[transfer.scala 143:20:@305.4]
  assign DualPortRAM_3_clock = clock; // @[transfer.scala 143:20:@306.4]
  assign DualPortRAM_4_io_output_valid = out_valid ? _GEN_225 : 1'h0; // @[transfer.scala 143:20:@308.4]
  assign DualPortRAM_4_io_output_addr = _GEN_176[9:0]; // @[transfer.scala 143:20:@309.4]
  assign DualPortRAM_4_io_input_valid = io_input_valid ? _GEN_95 : 1'h0; // @[transfer.scala 143:20:@310.4]
  assign DualPortRAM_4_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 143:20:@311.4]
  assign DualPortRAM_4_io_in_addr = value; // @[transfer.scala 143:20:@312.4]
  assign DualPortRAM_4_reset = reset; // @[transfer.scala 143:20:@313.4]
  assign DualPortRAM_4_clock = clock; // @[transfer.scala 143:20:@314.4]
  assign DualPortRAM_5_io_output_valid = out_valid ? _GEN_225 : 1'h0; // @[transfer.scala 143:20:@316.4]
  assign DualPortRAM_5_io_output_addr = _GEN_176[9:0]; // @[transfer.scala 143:20:@317.4]
  assign DualPortRAM_5_io_input_valid = io_input_valid ? _GEN_99 : 1'h0; // @[transfer.scala 143:20:@318.4]
  assign DualPortRAM_5_io_dataIn = {{8'd0}, io_dIn}; // @[transfer.scala 143:20:@319.4]
  assign DualPortRAM_5_io_in_addr = value; // @[transfer.scala 143:20:@320.4]
  assign DualPortRAM_5_reset = reset; // @[transfer.scala 143:20:@321.4]
  assign DualPortRAM_5_clock = clock; // @[transfer.scala 143:20:@322.4]
  assign Conter_pause_1_clock = clock; // @[:@766.4]
  assign Conter_pause_1_reset = reset; // @[:@767.4]
  assign Conter_pause_1_io_valid = out_valid; // @[transfer.scala 92:20:@768.4]
  assign Conter_pause_1_io_goal_num = 12'h282; // @[transfer.scala 93:23:@769.4]
  assign Conter_pause_1_io_pulse = out_valid & value_2; // @[transfer.scala 94:20:@770.4]
  assign Conter_pause_2_clock = clock; // @[:@772.4]
  assign Conter_pause_2_reset = reset; // @[:@773.4]
  assign Conter_pause_2_io_valid = out_valid; // @[transfer.scala 92:20:@774.4]
  assign Conter_pause_2_io_goal_num = 12'h3; // @[transfer.scala 93:23:@775.4]
  assign Conter_pause_2_io_pulse = Conter_pause_1_io_out_valid; // @[transfer.scala 94:20:@776.4]
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
  value = _RAND_0[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  value_1 = _RAND_1[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  out_valid = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  _T_346 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  value_2 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 10'h0;
    end else begin
      if (io_input_valid) begin
        if (_T_38) begin
          value <= 10'h0;
        end else begin
          value <= _T_41;
        end
      end
    end
    if (reset) begin
      value_1 <= 12'h0;
    end else begin
      if (io_input_valid) begin
        if (_T_336) begin
          value_1 <= 12'h0;
        end else begin
          value_1 <= _T_339;
        end
      end
    end
    if (reset) begin
      out_valid <= 1'h0;
    end else begin
      if (out_valid) begin
        out_valid <= 1'h1;
      end else begin
        if (cnt_inter_valid) begin
          out_valid <= 1'h1;
        end
      end
    end
    _T_346 <= out_valid;
    if (reset) begin
      value_2 <= 1'h0;
    end else begin
      if (out_valid) begin
        value_2 <= _T_353;
      end
    end
  end
endmodule
