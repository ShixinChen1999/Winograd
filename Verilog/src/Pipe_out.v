module Conter_pause( // @[:@55.2]
  input         clock, // @[:@56.4]
  input         reset, // @[:@57.4]
  input         io_valid, // @[:@58.4]
  input  [11:0] io_goal_num, // @[:@58.4]
  input         io_pulse, // @[:@58.4]
  output [11:0] io_cnt, // @[:@58.4]
  output        io_out_valid // @[:@58.4]
);
  reg [11:0] cnt_temp; // @[Pipeout.scala 56:23:@60.4]
  reg [31:0] _RAND_0;
  wire [12:0] _T_18; // @[Pipeout.scala 58:47:@62.6]
  wire [12:0] _T_19; // @[Pipeout.scala 58:47:@63.6]
  wire [11:0] _T_20; // @[Pipeout.scala 58:47:@64.6]
  wire  _T_21; // @[Pipeout.scala 58:30:@65.6]
  wire  _T_22; // @[Pipeout.scala 58:19:@66.6]
  wire [12:0] _T_24; // @[Pipeout.scala 59:27:@68.8]
  wire [11:0] _T_25; // @[Pipeout.scala 59:27:@69.8]
  wire  _T_31; // @[Pipeout.scala 61:36:@77.8]
  wire  _T_32; // @[Pipeout.scala 61:25:@78.8]
  wire [11:0] _GEN_0; // @[Pipeout.scala 61:62:@79.8]
  wire [11:0] _GEN_2; // @[Pipeout.scala 58:56:@67.6]
  wire  _GEN_3; // @[Pipeout.scala 58:56:@67.6]
  wire [11:0] _GEN_4; // @[Pipeout.scala 57:18:@61.4]
  assign _T_18 = io_goal_num - 12'h1; // @[Pipeout.scala 58:47:@62.6]
  assign _T_19 = $unsigned(_T_18); // @[Pipeout.scala 58:47:@63.6]
  assign _T_20 = _T_19[11:0]; // @[Pipeout.scala 58:47:@64.6]
  assign _T_21 = io_cnt != _T_20; // @[Pipeout.scala 58:30:@65.6]
  assign _T_22 = io_pulse & _T_21; // @[Pipeout.scala 58:19:@66.6]
  assign _T_24 = cnt_temp + 12'h1; // @[Pipeout.scala 59:27:@68.8]
  assign _T_25 = _T_24[11:0]; // @[Pipeout.scala 59:27:@69.8]
  assign _T_31 = io_cnt == _T_20; // @[Pipeout.scala 61:36:@77.8]
  assign _T_32 = io_pulse & _T_31; // @[Pipeout.scala 61:25:@78.8]
  assign _GEN_0 = _T_32 ? 12'h0 : cnt_temp; // @[Pipeout.scala 61:62:@79.8]
  assign _GEN_2 = _T_22 ? _T_25 : _GEN_0; // @[Pipeout.scala 58:56:@67.6]
  assign _GEN_3 = _T_22 ? 1'h0 : _T_32; // @[Pipeout.scala 58:56:@67.6]
  assign _GEN_4 = io_valid ? _GEN_2 : 12'h0; // @[Pipeout.scala 57:18:@61.4]
  assign io_cnt = cnt_temp; // @[Pipeout.scala 73:9:@92.4]
  assign io_out_valid = io_valid ? _GEN_3 : 1'h0; // @[Pipeout.scala 60:20:@71.8 Pipeout.scala 63:20:@81.10 Pipeout.scala 66:20:@85.10 Pipeout.scala 70:18:@90.6]
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
  cnt_temp = _RAND_0[11:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      cnt_temp <= 12'h0;
    end else begin
      if (io_valid) begin
        if (_T_22) begin
          cnt_temp <= _T_25;
        end else begin
          if (_T_32) begin
            cnt_temp <= 12'h0;
          end
        end
      end else begin
        cnt_temp <= 12'h0;
      end
    end
  end
endmodule
module Pipe_out( // @[:@250.2]
  input         clock, // @[:@251.4]
  input         reset, // @[:@252.4]
  input         io_in_valid, // @[:@253.4]
  input  [21:0] io_dIn_0, // @[:@253.4]
  input  [21:0] io_dIn_1, // @[:@253.4]
  output [21:0] io_dOut, // @[:@253.4]
  output        io_out_valid // @[:@253.4]
);
  wire [15:0] DualPortRAM_io_dataOut; // @[Pipeout.scala 129:39:@255.4]
  wire  DualPortRAM_io_output_valid; // @[Pipeout.scala 129:39:@255.4]
  wire [9:0] DualPortRAM_io_output_addr; // @[Pipeout.scala 129:39:@255.4]
  wire  DualPortRAM_io_input_valid; // @[Pipeout.scala 129:39:@255.4]
  wire [15:0] DualPortRAM_io_dataIn; // @[Pipeout.scala 129:39:@255.4]
  wire [9:0] DualPortRAM_io_in_addr; // @[Pipeout.scala 129:39:@255.4]
  wire  DualPortRAM_reset; // @[Pipeout.scala 129:39:@255.4]
  wire  DualPortRAM_clock; // @[Pipeout.scala 129:39:@255.4]
  wire [15:0] DualPortRAM_1_io_dataOut; // @[Pipeout.scala 129:39:@264.4]
  wire  DualPortRAM_1_io_output_valid; // @[Pipeout.scala 129:39:@264.4]
  wire [9:0] DualPortRAM_1_io_output_addr; // @[Pipeout.scala 129:39:@264.4]
  wire  DualPortRAM_1_io_input_valid; // @[Pipeout.scala 129:39:@264.4]
  wire [15:0] DualPortRAM_1_io_dataIn; // @[Pipeout.scala 129:39:@264.4]
  wire [9:0] DualPortRAM_1_io_in_addr; // @[Pipeout.scala 129:39:@264.4]
  wire  DualPortRAM_1_reset; // @[Pipeout.scala 129:39:@264.4]
  wire  DualPortRAM_1_clock; // @[Pipeout.scala 129:39:@264.4]
  wire [15:0] DualPortRAM_2_io_dataOut; // @[Pipeout.scala 129:39:@273.4]
  wire  DualPortRAM_2_io_output_valid; // @[Pipeout.scala 129:39:@273.4]
  wire [9:0] DualPortRAM_2_io_output_addr; // @[Pipeout.scala 129:39:@273.4]
  wire  DualPortRAM_2_io_input_valid; // @[Pipeout.scala 129:39:@273.4]
  wire [15:0] DualPortRAM_2_io_dataIn; // @[Pipeout.scala 129:39:@273.4]
  wire [9:0] DualPortRAM_2_io_in_addr; // @[Pipeout.scala 129:39:@273.4]
  wire  DualPortRAM_2_reset; // @[Pipeout.scala 129:39:@273.4]
  wire  DualPortRAM_2_clock; // @[Pipeout.scala 129:39:@273.4]
  wire [15:0] DualPortRAM_3_io_dataOut; // @[Pipeout.scala 129:39:@282.4]
  wire  DualPortRAM_3_io_output_valid; // @[Pipeout.scala 129:39:@282.4]
  wire [9:0] DualPortRAM_3_io_output_addr; // @[Pipeout.scala 129:39:@282.4]
  wire  DualPortRAM_3_io_input_valid; // @[Pipeout.scala 129:39:@282.4]
  wire [15:0] DualPortRAM_3_io_dataIn; // @[Pipeout.scala 129:39:@282.4]
  wire [9:0] DualPortRAM_3_io_in_addr; // @[Pipeout.scala 129:39:@282.4]
  wire  DualPortRAM_3_reset; // @[Pipeout.scala 129:39:@282.4]
  wire  DualPortRAM_3_clock; // @[Pipeout.scala 129:39:@282.4]
  wire  Conter_pause_clock; // @[Pipeout.scala 79:20:@361.4]
  wire  Conter_pause_reset; // @[Pipeout.scala 79:20:@361.4]
  wire  Conter_pause_io_valid; // @[Pipeout.scala 79:20:@361.4]
  wire [11:0] Conter_pause_io_goal_num; // @[Pipeout.scala 79:20:@361.4]
  wire  Conter_pause_io_pulse; // @[Pipeout.scala 79:20:@361.4]
  wire [11:0] Conter_pause_io_cnt; // @[Pipeout.scala 79:20:@361.4]
  wire  Conter_pause_io_out_valid; // @[Pipeout.scala 79:20:@361.4]
  wire  Conter_pause_1_clock; // @[Pipeout.scala 79:20:@367.4]
  wire  Conter_pause_1_reset; // @[Pipeout.scala 79:20:@367.4]
  wire  Conter_pause_1_io_valid; // @[Pipeout.scala 79:20:@367.4]
  wire [11:0] Conter_pause_1_io_goal_num; // @[Pipeout.scala 79:20:@367.4]
  wire  Conter_pause_1_io_pulse; // @[Pipeout.scala 79:20:@367.4]
  wire [11:0] Conter_pause_1_io_cnt; // @[Pipeout.scala 79:20:@367.4]
  wire  Conter_pause_1_io_out_valid; // @[Pipeout.scala 79:20:@367.4]
  wire  Conter_pause_2_clock; // @[Pipeout.scala 79:20:@384.4]
  wire  Conter_pause_2_reset; // @[Pipeout.scala 79:20:@384.4]
  wire  Conter_pause_2_io_valid; // @[Pipeout.scala 79:20:@384.4]
  wire [11:0] Conter_pause_2_io_goal_num; // @[Pipeout.scala 79:20:@384.4]
  wire  Conter_pause_2_io_pulse; // @[Pipeout.scala 79:20:@384.4]
  wire [11:0] Conter_pause_2_io_cnt; // @[Pipeout.scala 79:20:@384.4]
  wire  Conter_pause_2_io_out_valid; // @[Pipeout.scala 79:20:@384.4]
  wire  Conter_pause_3_clock; // @[Pipeout.scala 79:20:@390.4]
  wire  Conter_pause_3_reset; // @[Pipeout.scala 79:20:@390.4]
  wire  Conter_pause_3_io_valid; // @[Pipeout.scala 79:20:@390.4]
  wire [11:0] Conter_pause_3_io_goal_num; // @[Pipeout.scala 79:20:@390.4]
  wire  Conter_pause_3_io_pulse; // @[Pipeout.scala 79:20:@390.4]
  wire [11:0] Conter_pause_3_io_cnt; // @[Pipeout.scala 79:20:@390.4]
  wire  Conter_pause_3_io_out_valid; // @[Pipeout.scala 79:20:@390.4]
  wire  Conter_pause_4_clock; // @[Pipeout.scala 79:20:@396.4]
  wire  Conter_pause_4_reset; // @[Pipeout.scala 79:20:@396.4]
  wire  Conter_pause_4_io_valid; // @[Pipeout.scala 79:20:@396.4]
  wire [11:0] Conter_pause_4_io_goal_num; // @[Pipeout.scala 79:20:@396.4]
  wire  Conter_pause_4_io_pulse; // @[Pipeout.scala 79:20:@396.4]
  wire [11:0] Conter_pause_4_io_cnt; // @[Pipeout.scala 79:20:@396.4]
  wire  Conter_pause_4_io_out_valid; // @[Pipeout.scala 79:20:@396.4]
  reg [1:0] value; // @[Counter.scala 26:33:@324.4]
  reg [31:0] _RAND_0;
  wire [2:0] _T_167; // @[Counter.scala 35:22:@327.6]
  wire [1:0] _T_168; // @[Counter.scala 35:22:@328.6]
  wire [1:0] _GEN_0; // @[Counter.scala 63:17:@325.4]
  reg  data_valid; // @[Pipeout.scala 132:25:@332.4]
  reg [31:0] _RAND_1;
  wire  _T_172; // @[Pipeout.scala 133:13:@333.4]
  wire  _T_174; // @[Pipeout.scala 133:25:@334.4]
  wire  _T_175; // @[Pipeout.scala 133:19:@335.4]
  wire  _T_176; // @[Pipeout.scala 133:32:@336.4]
  reg [10:0] value_1; // @[Counter.scala 26:33:@343.4]
  reg [31:0] _RAND_2;
  wire  _T_182; // @[Counter.scala 34:24:@345.6]
  wire [11:0] _T_184; // @[Counter.scala 35:22:@346.6]
  wire [10:0] _T_185; // @[Counter.scala 35:22:@347.6]
  wire [10:0] _GEN_2; // @[Counter.scala 37:21:@349.6]
  wire [10:0] _GEN_3; // @[Counter.scala 63:17:@344.4]
  wire  cnt_inter_valid; // @[Counter.scala 64:20:@353.4]
  reg  start; // @[Pipeout.scala 140:20:@354.4]
  reg [31:0] _RAND_3;
  wire  _GEN_4; // @[Pipeout.scala 141:24:@355.4]
  wire  _GEN_5; // @[Pipeout.scala 144:14:@358.4]
  reg [9:0] value_2; // @[Counter.scala 26:33:@373.4]
  reg [31:0] _RAND_4;
  wire  _T_196; // @[Counter.scala 34:24:@375.6]
  wire [10:0] _T_198; // @[Counter.scala 35:22:@376.6]
  wire [9:0] _T_199; // @[Counter.scala 35:22:@377.6]
  wire [9:0] _GEN_6; // @[Counter.scala 37:21:@379.6]
  wire [9:0] _GEN_7; // @[Counter.scala 63:17:@374.4]
  wire  _T_205; // @[Pipeout.scala 167:17:@403.6]
  wire  _T_206; // @[Pipeout.scala 167:23:@404.6]
  reg [21:0] _T_209; // @[Pipeout.scala 168:37:@407.8]
  reg [31:0] _RAND_5;
  reg [21:0] _T_213; // @[Pipeout.scala 169:37:@418.8]
  reg [31:0] _RAND_6;
  wire  _T_220; // @[Pipeout.scala 172:23:@446.8]
  wire  _T_221; // @[Pipeout.scala 172:29:@447.8]
  reg [21:0] _T_228; // @[Pipeout.scala 175:37:@466.10]
  reg [31:0] _RAND_7;
  reg [21:0] _T_232; // @[Pipeout.scala 176:37:@477.10]
  reg [31:0] _RAND_8;
  wire [11:0] _GEN_12; // @[Pipeout.scala 172:42:@448.8]
  wire  _GEN_23; // @[Pipeout.scala 167:36:@405.6]
  wire  _T_251; // @[Pipeout.scala 203:28:@557.4]
  wire  _T_252; // @[Pipeout.scala 203:13:@558.4]
  wire  _T_254; // @[Pipeout.scala 204:17:@560.6]
  wire  _T_257; // @[Pipeout.scala 204:30:@562.6]
  wire  _GEN_40; // @[Pipeout.scala 204:57:@563.6]
  wire  _T_264; // @[Pipeout.scala 216:21:@575.6]
  wire  _T_268; // @[Pipeout.scala 218:27:@587.8]
  wire  _T_272; // @[Pipeout.scala 220:27:@599.10]
  wire  _T_276; // @[Pipeout.scala 222:27:@611.12]
  wire  _GEN_61; // @[Pipeout.scala 220:34:@600.10]
  wire  _GEN_75; // @[Pipeout.scala 218:34:@588.8]
  wire  _GEN_82; // @[Pipeout.scala 218:34:@588.8]
  wire  _GEN_96; // @[Pipeout.scala 216:28:@576.6]
  wire  _GEN_103; // @[Pipeout.scala 216:28:@576.6]
  wire  _GEN_110; // @[Pipeout.scala 216:28:@576.6]
  DualPortRAM DualPortRAM ( // @[Pipeout.scala 129:39:@255.4]
    .io_dataOut(DualPortRAM_io_dataOut),
    .io_output_valid(DualPortRAM_io_output_valid),
    .io_output_addr(DualPortRAM_io_output_addr),
    .io_input_valid(DualPortRAM_io_input_valid),
    .io_dataIn(DualPortRAM_io_dataIn),
    .io_in_addr(DualPortRAM_io_in_addr),
    .reset(DualPortRAM_reset),
    .clock(DualPortRAM_clock)
  );
  DualPortRAM DualPortRAM_1 ( // @[Pipeout.scala 129:39:@264.4]
    .io_dataOut(DualPortRAM_1_io_dataOut),
    .io_output_valid(DualPortRAM_1_io_output_valid),
    .io_output_addr(DualPortRAM_1_io_output_addr),
    .io_input_valid(DualPortRAM_1_io_input_valid),
    .io_dataIn(DualPortRAM_1_io_dataIn),
    .io_in_addr(DualPortRAM_1_io_in_addr),
    .reset(DualPortRAM_1_reset),
    .clock(DualPortRAM_1_clock)
  );
  DualPortRAM DualPortRAM_2 ( // @[Pipeout.scala 129:39:@273.4]
    .io_dataOut(DualPortRAM_2_io_dataOut),
    .io_output_valid(DualPortRAM_2_io_output_valid),
    .io_output_addr(DualPortRAM_2_io_output_addr),
    .io_input_valid(DualPortRAM_2_io_input_valid),
    .io_dataIn(DualPortRAM_2_io_dataIn),
    .io_in_addr(DualPortRAM_2_io_in_addr),
    .reset(DualPortRAM_2_reset),
    .clock(DualPortRAM_2_clock)
  );
  DualPortRAM DualPortRAM_3 ( // @[Pipeout.scala 129:39:@282.4]
    .io_dataOut(DualPortRAM_3_io_dataOut),
    .io_output_valid(DualPortRAM_3_io_output_valid),
    .io_output_addr(DualPortRAM_3_io_output_addr),
    .io_input_valid(DualPortRAM_3_io_input_valid),
    .io_dataIn(DualPortRAM_3_io_dataIn),
    .io_in_addr(DualPortRAM_3_io_in_addr),
    .reset(DualPortRAM_3_reset),
    .clock(DualPortRAM_3_clock)
  );
  Conter_pause Conter_pause ( // @[Pipeout.scala 79:20:@361.4]
    .clock(Conter_pause_clock),
    .reset(Conter_pause_reset),
    .io_valid(Conter_pause_io_valid),
    .io_goal_num(Conter_pause_io_goal_num),
    .io_pulse(Conter_pause_io_pulse),
    .io_cnt(Conter_pause_io_cnt),
    .io_out_valid(Conter_pause_io_out_valid)
  );
  Conter_pause Conter_pause_1 ( // @[Pipeout.scala 79:20:@367.4]
    .clock(Conter_pause_1_clock),
    .reset(Conter_pause_1_reset),
    .io_valid(Conter_pause_1_io_valid),
    .io_goal_num(Conter_pause_1_io_goal_num),
    .io_pulse(Conter_pause_1_io_pulse),
    .io_cnt(Conter_pause_1_io_cnt),
    .io_out_valid(Conter_pause_1_io_out_valid)
  );
  Conter_pause Conter_pause_2 ( // @[Pipeout.scala 79:20:@384.4]
    .clock(Conter_pause_2_clock),
    .reset(Conter_pause_2_reset),
    .io_valid(Conter_pause_2_io_valid),
    .io_goal_num(Conter_pause_2_io_goal_num),
    .io_pulse(Conter_pause_2_io_pulse),
    .io_cnt(Conter_pause_2_io_cnt),
    .io_out_valid(Conter_pause_2_io_out_valid)
  );
  Conter_pause Conter_pause_3 ( // @[Pipeout.scala 79:20:@390.4]
    .clock(Conter_pause_3_clock),
    .reset(Conter_pause_3_reset),
    .io_valid(Conter_pause_3_io_valid),
    .io_goal_num(Conter_pause_3_io_goal_num),
    .io_pulse(Conter_pause_3_io_pulse),
    .io_cnt(Conter_pause_3_io_cnt),
    .io_out_valid(Conter_pause_3_io_out_valid)
  );
  Conter_pause Conter_pause_4 ( // @[Pipeout.scala 79:20:@396.4]
    .clock(Conter_pause_4_clock),
    .reset(Conter_pause_4_reset),
    .io_valid(Conter_pause_4_io_valid),
    .io_goal_num(Conter_pause_4_io_goal_num),
    .io_pulse(Conter_pause_4_io_pulse),
    .io_cnt(Conter_pause_4_io_cnt),
    .io_out_valid(Conter_pause_4_io_out_valid)
  );
  assign _T_167 = value + 2'h1; // @[Counter.scala 35:22:@327.6]
  assign _T_168 = _T_167[1:0]; // @[Counter.scala 35:22:@328.6]
  assign _GEN_0 = io_in_valid ? _T_168 : value; // @[Counter.scala 63:17:@325.4]
  assign _T_172 = value == 2'h0; // @[Pipeout.scala 133:13:@333.4]
  assign _T_174 = value == 2'h1; // @[Pipeout.scala 133:25:@334.4]
  assign _T_175 = _T_172 | _T_174; // @[Pipeout.scala 133:19:@335.4]
  assign _T_176 = _T_175 & io_in_valid; // @[Pipeout.scala 133:32:@336.4]
  assign _T_182 = value_1 == 11'h503; // @[Counter.scala 34:24:@345.6]
  assign _T_184 = value_1 + 11'h1; // @[Counter.scala 35:22:@346.6]
  assign _T_185 = _T_184[10:0]; // @[Counter.scala 35:22:@347.6]
  assign _GEN_2 = _T_182 ? 11'h0 : _T_185; // @[Counter.scala 37:21:@349.6]
  assign _GEN_3 = io_in_valid ? _GEN_2 : value_1; // @[Counter.scala 63:17:@344.4]
  assign cnt_inter_valid = io_in_valid & _T_182; // @[Counter.scala 64:20:@353.4]
  assign _GEN_4 = cnt_inter_valid ? 1'h1 : start; // @[Pipeout.scala 141:24:@355.4]
  assign _GEN_5 = start ? 1'h1 : _GEN_4; // @[Pipeout.scala 144:14:@358.4]
  assign _T_196 = value_2 == 10'h281; // @[Counter.scala 34:24:@375.6]
  assign _T_198 = value_2 + 10'h1; // @[Counter.scala 35:22:@376.6]
  assign _T_199 = _T_198[9:0]; // @[Counter.scala 35:22:@377.6]
  assign _GEN_6 = _T_196 ? 10'h0 : _T_199; // @[Counter.scala 37:21:@379.6]
  assign _GEN_7 = start ? _GEN_6 : value_2; // @[Counter.scala 63:17:@374.4]
  assign _T_205 = Conter_pause_1_io_cnt == 12'h0; // @[Pipeout.scala 167:17:@403.6]
  assign _T_206 = _T_205 & data_valid; // @[Pipeout.scala 167:23:@404.6]
  assign _T_220 = Conter_pause_1_io_cnt == 12'h1; // @[Pipeout.scala 172:23:@446.8]
  assign _T_221 = _T_220 & data_valid; // @[Pipeout.scala 172:29:@447.8]
  assign _GEN_12 = Conter_pause_io_cnt; // @[Pipeout.scala 172:42:@448.8]
  assign _GEN_23 = _T_206 ? 1'h0 : _T_221; // @[Pipeout.scala 167:36:@405.6]
  assign _T_251 = Conter_pause_4_io_cnt == 12'h0; // @[Pipeout.scala 203:28:@557.4]
  assign _T_252 = start & _T_251; // @[Pipeout.scala 203:13:@558.4]
  assign _T_254 = value_2 == 10'h280; // @[Pipeout.scala 204:17:@560.6]
  assign _T_257 = _T_254 | _T_196; // @[Pipeout.scala 204:30:@562.6]
  assign _GEN_40 = _T_257 ? 1'h0 : 1'h1; // @[Pipeout.scala 204:57:@563.6]
  assign _T_264 = Conter_pause_2_io_cnt == 12'h0; // @[Pipeout.scala 216:21:@575.6]
  assign _T_268 = Conter_pause_2_io_cnt == 12'h1; // @[Pipeout.scala 218:27:@587.8]
  assign _T_272 = Conter_pause_2_io_cnt == 12'h2; // @[Pipeout.scala 220:27:@599.10]
  assign _T_276 = Conter_pause_2_io_cnt == 12'h3; // @[Pipeout.scala 222:27:@611.12]
  assign _GEN_61 = _T_272 ? 1'h0 : _T_276; // @[Pipeout.scala 220:34:@600.10]
  assign _GEN_75 = _T_268 ? 1'h0 : _T_272; // @[Pipeout.scala 218:34:@588.8]
  assign _GEN_82 = _T_268 ? 1'h0 : _GEN_61; // @[Pipeout.scala 218:34:@588.8]
  assign _GEN_96 = _T_264 ? 1'h0 : _T_268; // @[Pipeout.scala 216:28:@576.6]
  assign _GEN_103 = _T_264 ? 1'h0 : _GEN_75; // @[Pipeout.scala 216:28:@576.6]
  assign _GEN_110 = _T_264 ? 1'h0 : _GEN_82; // @[Pipeout.scala 216:28:@576.6]
    
  assign io_dOut =  _T_276 ? DualPortRAM_3_io_dataOut ://21'b0;
                                 (_T_272 ? DualPortRAM_2_io_dataOut :
                                 (_T_268? DualPortRAM_1_io_dataOut :
                                 (_T_264? DualPortRAM_io_dataOut:21'b0)));

  assign io_out_valid = _T_252 ? _GEN_40 : 1'h0; // @[Pipeout.scala 205:19:@564.8 Pipeout.scala 207:19:@567.8 Pipeout.scala 210:17:@571.6]
  assign DualPortRAM_io_output_valid = start ? _T_264 : 1'h0; // @[Pipeout.scala 129:20:@293.4]
  assign DualPortRAM_io_output_addr = value_2; // @[Pipeout.scala 129:20:@294.4]
  assign DualPortRAM_io_input_valid = io_in_valid ? _T_206 : 1'h0; // @[Pipeout.scala 129:20:@295.4]
  assign DualPortRAM_io_dataIn = _T_209[15:0]; // @[Pipeout.scala 129:20:@296.4]
  assign DualPortRAM_io_in_addr = _GEN_12[9:0]; // @[Pipeout.scala 129:20:@297.4]
  assign DualPortRAM_reset = reset; // @[Pipeout.scala 129:20:@298.4]
  assign DualPortRAM_clock = clock; // @[Pipeout.scala 129:20:@299.4]
  assign DualPortRAM_1_io_output_valid = start ? _GEN_96 : 1'h0; // @[Pipeout.scala 129:20:@301.4]
  assign DualPortRAM_1_io_output_addr = value_2; // @[Pipeout.scala 129:20:@302.4]
  assign DualPortRAM_1_io_input_valid = io_in_valid ? _T_206 : 1'h0; // @[Pipeout.scala 129:20:@303.4]
  assign DualPortRAM_1_io_dataIn = _T_213[15:0]; // @[Pipeout.scala 129:20:@304.4]
  assign DualPortRAM_1_io_in_addr = _GEN_12[9:0]; // @[Pipeout.scala 129:20:@305.4]
  assign DualPortRAM_1_reset = reset; // @[Pipeout.scala 129:20:@306.4]
  assign DualPortRAM_1_clock = clock; // @[Pipeout.scala 129:20:@307.4]
  assign DualPortRAM_2_io_output_valid = start ? _GEN_103 : 1'h0; // @[Pipeout.scala 129:20:@309.4]
  assign DualPortRAM_2_io_output_addr = value_2; // @[Pipeout.scala 129:20:@310.4]
  assign DualPortRAM_2_io_input_valid = io_in_valid ? _GEN_23 : 1'h0; // @[Pipeout.scala 129:20:@311.4]
  assign DualPortRAM_2_io_dataIn = _T_228[15:0]; // @[Pipeout.scala 129:20:@312.4]
  assign DualPortRAM_2_io_in_addr = _GEN_12[9:0]; // @[Pipeout.scala 129:20:@313.4]
  assign DualPortRAM_2_reset = reset; // @[Pipeout.scala 129:20:@314.4]
  assign DualPortRAM_2_clock = clock; // @[Pipeout.scala 129:20:@315.4]
  assign DualPortRAM_3_io_output_valid = start ? _GEN_110 : 1'h0; // @[Pipeout.scala 129:20:@317.4]
  assign DualPortRAM_3_io_output_addr = value_2; // @[Pipeout.scala 129:20:@318.4]
  assign DualPortRAM_3_io_input_valid = io_in_valid ? _GEN_23 : 1'h0; // @[Pipeout.scala 129:20:@319.4]
  assign DualPortRAM_3_io_dataIn = _T_232[15:0]; // @[Pipeout.scala 129:20:@320.4]
  assign DualPortRAM_3_io_in_addr = _GEN_12[9:0]; // @[Pipeout.scala 129:20:@321.4]
  assign DualPortRAM_3_reset = reset; // @[Pipeout.scala 129:20:@322.4]
  assign DualPortRAM_3_clock = clock; // @[Pipeout.scala 129:20:@323.4]
  assign Conter_pause_clock = clock; // @[:@362.4]
  assign Conter_pause_reset = reset; // @[:@363.4]
  assign Conter_pause_io_valid = io_in_valid; // @[Pipeout.scala 80:18:@364.4]
  assign Conter_pause_io_goal_num = 12'h282; // @[Pipeout.scala 81:21:@365.4]
  assign Conter_pause_io_pulse = data_valid; // @[Pipeout.scala 82:18:@366.4]
  assign Conter_pause_1_clock = clock; // @[:@368.4]
  assign Conter_pause_1_reset = reset; // @[:@369.4]
  assign Conter_pause_1_io_valid = io_in_valid; // @[Pipeout.scala 80:18:@370.4]
  assign Conter_pause_1_io_goal_num = 12'h2; // @[Pipeout.scala 81:21:@371.4]
  assign Conter_pause_1_io_pulse = Conter_pause_io_out_valid; // @[Pipeout.scala 82:18:@372.4]
  assign Conter_pause_2_clock = clock; // @[:@385.4]
  assign Conter_pause_2_reset = reset; // @[:@386.4]
  assign Conter_pause_2_io_valid = start; // @[Pipeout.scala 80:18:@387.4]
  assign Conter_pause_2_io_goal_num = 12'h4; // @[Pipeout.scala 81:21:@388.4]
  assign Conter_pause_2_io_pulse = start & _T_196; // @[Pipeout.scala 82:18:@389.4]
  assign Conter_pause_3_clock = clock; // @[:@391.4]
  assign Conter_pause_3_reset = reset; // @[:@392.4]
  assign Conter_pause_3_io_valid = start; // @[Pipeout.scala 80:18:@393.4]
  assign Conter_pause_3_io_goal_num = 12'h168; // @[Pipeout.scala 81:21:@394.4]
  assign Conter_pause_3_io_pulse = start & _T_196; // @[Pipeout.scala 82:18:@395.4]
  assign Conter_pause_4_clock = clock; // @[:@397.4]
  assign Conter_pause_4_reset = reset; // @[:@398.4]
  assign Conter_pause_4_io_valid = start; // @[Pipeout.scala 80:18:@399.4]
  assign Conter_pause_4_io_goal_num = 12'h2; // @[Pipeout.scala 81:21:@400.4]
  assign Conter_pause_4_io_pulse = Conter_pause_3_io_out_valid; // @[Pipeout.scala 82:18:@401.4]
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
  value = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  data_valid = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  value_1 = _RAND_2[10:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  start = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  value_2 = _RAND_4[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  _T_209 = _RAND_5[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  _T_213 = _RAND_6[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  _T_228 = _RAND_7[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  _T_232 = _RAND_8[21:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 2'h0;
    end else begin
      if (io_in_valid) begin
        value <= _T_168;
      end
    end
    if (reset) begin
      data_valid <= 1'h0;
    end else begin
      data_valid <= _T_176;
    end
    if (reset) begin
      value_1 <= 11'h0;
    end else begin
      if (io_in_valid) begin
        if (_T_182) begin
          value_1 <= 11'h0;
        end else begin
          value_1 <= _T_185;
        end
      end
    end
    if (reset) begin
      start <= 1'h0;
    end else begin
      if (start) begin
        start <= 1'h1;
      end else begin
        if (cnt_inter_valid) begin
          start <= 1'h1;
        end
      end
    end
    if (reset) begin
      value_2 <= 10'h0;
    end else begin
      if (start) begin
        if (_T_196) begin
          value_2 <= 10'h0;
        end else begin
          value_2 <= _T_199;
        end
      end
    end
    _T_209 <= $unsigned(io_dIn_0);
    _T_213 <= $unsigned(io_dIn_1);
    _T_228 <= $unsigned(io_dIn_0);
    _T_232 <= $unsigned(io_dIn_1);
  end
endmodule
