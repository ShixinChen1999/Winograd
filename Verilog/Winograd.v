module BT( // @[:@39.2]
  input        clock, // @[:@40.4]
  input  [7:0] io_dIn1, // @[:@42.4]
  input  [7:0] io_dIn2, // @[:@42.4]
  input  [7:0] io_dIn3, // @[:@42.4]
  input  [7:0] io_dIn4, // @[:@42.4]
  output [8:0] io_dOut1, // @[:@42.4]
  output [8:0] io_dOut2, // @[:@42.4]
  output [8:0] io_dOut3, // @[:@42.4]
  output [8:0] io_dOut4 // @[:@42.4]
);
  wire  Add_8in_9out_CLK; // @[Winograd.scala 156:22:@47.4]
  wire [8:0] Add_8in_9out_S; // @[Winograd.scala 156:22:@47.4]
  wire [7:0] Add_8in_9out_B; // @[Winograd.scala 156:22:@47.4]
  wire [7:0] Add_8in_9out_A; // @[Winograd.scala 156:22:@47.4]
  wire  Add_8in_9out_1_CLK; // @[Winograd.scala 156:22:@56.4]
  wire [8:0] Add_8in_9out_1_S; // @[Winograd.scala 156:22:@56.4]
  wire [7:0] Add_8in_9out_1_B; // @[Winograd.scala 156:22:@56.4]
  wire [7:0] Add_8in_9out_1_A; // @[Winograd.scala 156:22:@56.4]
  wire  Add_8in_9out_2_CLK; // @[Winograd.scala 156:22:@68.4]
  wire [8:0] Add_8in_9out_2_S; // @[Winograd.scala 156:22:@68.4]
  wire [7:0] Add_8in_9out_2_B; // @[Winograd.scala 156:22:@68.4]
  wire [7:0] Add_8in_9out_2_A; // @[Winograd.scala 156:22:@68.4]
  wire  Add_8in_9out_3_CLK; // @[Winograd.scala 156:22:@80.4]
  wire [8:0] Add_8in_9out_3_S; // @[Winograd.scala 156:22:@80.4]
  wire [7:0] Add_8in_9out_3_B; // @[Winograd.scala 156:22:@80.4]
  wire [7:0] Add_8in_9out_3_A; // @[Winograd.scala 156:22:@80.4]
  wire [8:0] _T_22; // @[Winograd.scala 181:34:@44.4]
  wire [7:0] _T_23; // @[Winograd.scala 181:34:@45.4]
  wire [8:0] _T_26; // @[Winograd.scala 183:26:@65.4]
  wire [7:0] _T_27; // @[Winograd.scala 183:26:@66.4]
  wire [8:0] _T_30; // @[Winograd.scala 184:34:@77.4]
  wire [7:0] _T_31; // @[Winograd.scala 184:34:@78.4]
  Add_8in_9out Add_8in_9out ( // @[Winograd.scala 156:22:@47.4]
    .CLK(Add_8in_9out_CLK),
    .S(Add_8in_9out_S),
    .B(Add_8in_9out_B),
    .A(Add_8in_9out_A)
  );
  Add_8in_9out Add_8in_9out_1 ( // @[Winograd.scala 156:22:@56.4]
    .CLK(Add_8in_9out_1_CLK),
    .S(Add_8in_9out_1_S),
    .B(Add_8in_9out_1_B),
    .A(Add_8in_9out_1_A)
  );
  Add_8in_9out Add_8in_9out_2 ( // @[Winograd.scala 156:22:@68.4]
    .CLK(Add_8in_9out_2_CLK),
    .S(Add_8in_9out_2_S),
    .B(Add_8in_9out_2_B),
    .A(Add_8in_9out_2_A)
  );
  Add_8in_9out Add_8in_9out_3 ( // @[Winograd.scala 156:22:@80.4]
    .CLK(Add_8in_9out_3_CLK),
    .S(Add_8in_9out_3_S),
    .B(Add_8in_9out_3_B),
    .A(Add_8in_9out_3_A)
  );
  assign _T_22 = $signed(8'sh0) - $signed(io_dIn3); // @[Winograd.scala 181:34:@44.4]
  assign _T_23 = _T_22[7:0]; // @[Winograd.scala 181:34:@45.4]
  assign _T_26 = $signed(8'sh0) - $signed(io_dIn2); // @[Winograd.scala 183:26:@65.4]
  assign _T_27 = _T_26[7:0]; // @[Winograd.scala 183:26:@66.4]
  assign _T_30 = $signed(8'sh0) - $signed(io_dIn4); // @[Winograd.scala 184:34:@77.4]
  assign _T_31 = _T_30[7:0]; // @[Winograd.scala 184:34:@78.4]
  assign io_dOut1 = Add_8in_9out_S; // @[Winograd.scala 181:11:@55.4]
  assign io_dOut2 = Add_8in_9out_1_S; // @[Winograd.scala 182:11:@64.4]
  assign io_dOut3 = Add_8in_9out_2_S; // @[Winograd.scala 183:11:@76.4]
  assign io_dOut4 = Add_8in_9out_3_S; // @[Winograd.scala 184:11:@88.4]
  assign Add_8in_9out_CLK = clock; // @[Winograd.scala 159:16:@54.4]
  assign Add_8in_9out_B = $signed(_T_23); // @[Winograd.scala 158:15:@53.4]
  assign Add_8in_9out_A = io_dIn1; // @[Winograd.scala 157:15:@52.4]
  assign Add_8in_9out_1_CLK = clock; // @[Winograd.scala 159:16:@63.4]
  assign Add_8in_9out_1_B = io_dIn3; // @[Winograd.scala 158:15:@62.4]
  assign Add_8in_9out_1_A = io_dIn2; // @[Winograd.scala 157:15:@61.4]
  assign Add_8in_9out_2_CLK = clock; // @[Winograd.scala 159:16:@75.4]
  assign Add_8in_9out_2_B = io_dIn3; // @[Winograd.scala 158:15:@74.4]
  assign Add_8in_9out_2_A = $signed(_T_27); // @[Winograd.scala 157:15:@73.4]
  assign Add_8in_9out_3_CLK = clock; // @[Winograd.scala 159:16:@87.4]
  assign Add_8in_9out_3_B = $signed(_T_31); // @[Winograd.scala 158:15:@86.4]
  assign Add_8in_9out_3_A = io_dIn2; // @[Winograd.scala 157:15:@85.4]
endmodule
module BT_module( // @[:@90.2]
  input        clock, // @[:@91.4]
  input        reset, // @[:@92.4]
  input        io_mac_in_valid, // @[:@93.4]
  input  [7:0] io_dIn_0, // @[:@93.4]
  input  [7:0] io_dIn_1, // @[:@93.4]
  input  [7:0] io_dIn_2, // @[:@93.4]
  input  [7:0] io_dIn_3, // @[:@93.4]
  output [8:0] io_dOut_0, // @[:@93.4]
  output [8:0] io_dOut_1, // @[:@93.4]
  output [8:0] io_dOut_2, // @[:@93.4]
  output [8:0] io_dOut_3, // @[:@93.4]
  output       io_out_valid // @[:@93.4]
);
  wire  m_BT_clock; // @[Winograd.scala 198:18:@95.4]
  wire [7:0] m_BT_io_dIn1; // @[Winograd.scala 198:18:@95.4]
  wire [7:0] m_BT_io_dIn2; // @[Winograd.scala 198:18:@95.4]
  wire [7:0] m_BT_io_dIn3; // @[Winograd.scala 198:18:@95.4]
  wire [7:0] m_BT_io_dIn4; // @[Winograd.scala 198:18:@95.4]
  wire [8:0] m_BT_io_dOut1; // @[Winograd.scala 198:18:@95.4]
  wire [8:0] m_BT_io_dOut2; // @[Winograd.scala 198:18:@95.4]
  wire [8:0] m_BT_io_dOut3; // @[Winograd.scala 198:18:@95.4]
  wire [8:0] m_BT_io_dOut4; // @[Winograd.scala 198:18:@95.4]
  reg [1:0] value; // @[Counter.scala 26:33:@186.4]
  reg [31:0] _RAND_0;
  wire  _T_180; // @[Counter.scala 34:24:@188.6]
  wire [2:0] _T_182; // @[Counter.scala 35:22:@189.6]
  wire [1:0] _T_183; // @[Counter.scala 35:22:@190.6]
  wire [1:0] _GEN_0; // @[Counter.scala 63:17:@187.4]
  reg [8:0] out2_0; // @[Reg.scala 11:16:@195.4]
  reg [31:0] _RAND_1;
  reg [8:0] _T_189; // @[Reg.scala 11:16:@200.4]
  reg [31:0] _RAND_2;
  reg [8:0] out3_0; // @[Reg.scala 11:16:@204.4]
  reg [31:0] _RAND_3;
  reg [8:0] _T_194; // @[Reg.scala 11:16:@209.4]
  reg [31:0] _RAND_4;
  reg [8:0] _T_196; // @[Reg.scala 11:16:@213.4]
  reg [31:0] _RAND_5;
  reg [8:0] out4_0; // @[Reg.scala 11:16:@217.4]
  reg [31:0] _RAND_6;
  reg [8:0] out1_1; // @[Winograd.scala 221:21:@222.4]
  reg [31:0] _RAND_7;
  reg [8:0] out2_1; // @[Winograd.scala 222:21:@225.4]
  reg [31:0] _RAND_8;
  reg [8:0] out3_1; // @[Winograd.scala 223:21:@228.4]
  reg [31:0] _RAND_9;
  reg [8:0] out4_1; // @[Winograd.scala 224:21:@231.4]
  reg [31:0] _RAND_10;
  reg [8:0] out1_2; // @[Winograd.scala 221:21:@234.4]
  reg [31:0] _RAND_11;
  reg [8:0] out2_2; // @[Winograd.scala 222:21:@237.4]
  reg [31:0] _RAND_12;
  reg [8:0] out3_2; // @[Winograd.scala 223:21:@240.4]
  reg [31:0] _RAND_13;
  reg [8:0] out4_2; // @[Winograd.scala 224:21:@243.4]
  reg [31:0] _RAND_14;
  reg [8:0] out1_3; // @[Winograd.scala 221:21:@246.4]
  reg [31:0] _RAND_15;
  reg [8:0] out2_3; // @[Winograd.scala 222:21:@249.4]
  reg [31:0] _RAND_16;
  reg [8:0] out3_3; // @[Winograd.scala 223:21:@252.4]
  reg [31:0] _RAND_17;
  reg [8:0] out4_3; // @[Winograd.scala 224:21:@255.4]
  reg [31:0] _RAND_18;
  wire  _T_224; // @[Winograd.scala 227:11:@258.4]
  wire  _T_226; // @[Winograd.scala 232:17:@266.6]
  wire  _T_228; // @[Winograd.scala 237:17:@274.8]
  wire [8:0] _GEN_7; // @[Winograd.scala 242:24:@283.10]
  wire [8:0] _GEN_8; // @[Winograd.scala 242:24:@283.10]
  wire [8:0] _GEN_9; // @[Winograd.scala 242:24:@283.10]
  wire [8:0] _GEN_10; // @[Winograd.scala 242:24:@283.10]
  wire [8:0] _GEN_11; // @[Winograd.scala 237:24:@275.8]
  wire [8:0] _GEN_12; // @[Winograd.scala 237:24:@275.8]
  wire [8:0] _GEN_13; // @[Winograd.scala 237:24:@275.8]
  wire [8:0] _GEN_14; // @[Winograd.scala 237:24:@275.8]
  wire [8:0] _GEN_15; // @[Winograd.scala 232:25:@267.6]
  wire [8:0] _GEN_16; // @[Winograd.scala 232:25:@267.6]
  wire [8:0] _GEN_17; // @[Winograd.scala 232:25:@267.6]
  wire [8:0] _GEN_18; // @[Winograd.scala 232:25:@267.6]
  wire [8:0] out1_0; // @[Winograd.scala 205:19:@118.4 Winograd.scala 205:19:@119.4 Winograd.scala 216:10:@194.4]
  reg  _T_237; // @[Reg.scala 11:16:@295.4]
  reg [31:0] _RAND_19;
  reg  _T_239; // @[Reg.scala 11:16:@299.4]
  reg [31:0] _RAND_20;
  reg  _T_241; // @[Reg.scala 11:16:@303.4]
  reg [31:0] _RAND_21;
  reg  _T_243; // @[Reg.scala 11:16:@307.4]
  reg [31:0] _RAND_22;
  BT m_BT ( // @[Winograd.scala 198:18:@95.4]
    .clock(m_BT_clock),
    .io_dIn1(m_BT_io_dIn1),
    .io_dIn2(m_BT_io_dIn2),
    .io_dIn3(m_BT_io_dIn3),
    .io_dIn4(m_BT_io_dIn4),
    .io_dOut1(m_BT_io_dOut1),
    .io_dOut2(m_BT_io_dOut2),
    .io_dOut3(m_BT_io_dOut3),
    .io_dOut4(m_BT_io_dOut4)
  );
  assign _T_180 = value == 2'h3; // @[Counter.scala 34:24:@188.6]
  assign _T_182 = value + 2'h1; // @[Counter.scala 35:22:@189.6]
  assign _T_183 = _T_182[1:0]; // @[Counter.scala 35:22:@190.6]
  assign _GEN_0 = io_mac_in_valid ? _T_183 : value; // @[Counter.scala 63:17:@187.4]
  assign _T_224 = value == 2'h0; // @[Winograd.scala 227:11:@258.4]
  assign _T_226 = value == 2'h1; // @[Winograd.scala 232:17:@266.6]
  assign _T_228 = value == 2'h2; // @[Winograd.scala 237:17:@274.8]
  assign _GEN_7 = _T_180 ? $signed(out4_0) : $signed(9'sh0); // @[Winograd.scala 242:24:@283.10]
  assign _GEN_8 = _T_180 ? $signed(out4_1) : $signed(9'sh0); // @[Winograd.scala 242:24:@283.10]
  assign _GEN_9 = _T_180 ? $signed(out4_2) : $signed(9'sh0); // @[Winograd.scala 242:24:@283.10]
  assign _GEN_10 = _T_180 ? $signed(out4_3) : $signed(9'sh0); // @[Winograd.scala 242:24:@283.10]
  assign _GEN_11 = _T_228 ? $signed(out3_0) : $signed(_GEN_7); // @[Winograd.scala 237:24:@275.8]
  assign _GEN_12 = _T_228 ? $signed(out3_1) : $signed(_GEN_8); // @[Winograd.scala 237:24:@275.8]
  assign _GEN_13 = _T_228 ? $signed(out3_2) : $signed(_GEN_9); // @[Winograd.scala 237:24:@275.8]
  assign _GEN_14 = _T_228 ? $signed(out3_3) : $signed(_GEN_10); // @[Winograd.scala 237:24:@275.8]
  assign _GEN_15 = _T_226 ? $signed(out2_0) : $signed(_GEN_11); // @[Winograd.scala 232:25:@267.6]
  assign _GEN_16 = _T_226 ? $signed(out2_1) : $signed(_GEN_12); // @[Winograd.scala 232:25:@267.6]
  assign _GEN_17 = _T_226 ? $signed(out2_2) : $signed(_GEN_13); // @[Winograd.scala 232:25:@267.6]
  assign _GEN_18 = _T_226 ? $signed(out2_3) : $signed(_GEN_14); // @[Winograd.scala 232:25:@267.6]
  assign out1_0 = m_BT_io_dOut1; // @[Winograd.scala 205:19:@118.4 Winograd.scala 205:19:@119.4 Winograd.scala 216:10:@194.4]
  assign io_dOut_0 = _T_224 ? $signed(out1_0) : $signed(_GEN_15); // @[Winograd.scala 228:16:@260.6 Winograd.scala 233:16:@268.8 Winograd.scala 238:16:@276.10 Winograd.scala 243:16:@284.12 Winograd.scala 248:16:@290.12]
  assign io_dOut_1 = _T_224 ? $signed(out1_1) : $signed(_GEN_16); // @[Winograd.scala 229:16:@261.6 Winograd.scala 234:16:@269.8 Winograd.scala 239:16:@277.10 Winograd.scala 244:16:@285.12 Winograd.scala 249:15:@291.12]
  assign io_dOut_2 = _T_224 ? $signed(out1_2) : $signed(_GEN_17); // @[Winograd.scala 230:16:@262.6 Winograd.scala 235:16:@270.8 Winograd.scala 240:16:@278.10 Winograd.scala 245:16:@286.12 Winograd.scala 250:16:@292.12]
  assign io_dOut_3 = _T_224 ? $signed(out1_3) : $signed(_GEN_18); // @[Winograd.scala 231:16:@263.6 Winograd.scala 236:16:@271.8 Winograd.scala 241:16:@279.10 Winograd.scala 246:16:@287.12 Winograd.scala 251:16:@293.12]
  assign io_out_valid = _T_243; // @[Winograd.scala 253:15:@311.4]
  assign m_BT_clock = clock; // @[:@96.4]
  assign m_BT_io_dIn1 = io_dIn_0; // @[Winograd.scala 200:15:@98.4]
  assign m_BT_io_dIn2 = io_dIn_1; // @[Winograd.scala 201:15:@99.4]
  assign m_BT_io_dIn3 = io_dIn_2; // @[Winograd.scala 202:15:@100.4]
  assign m_BT_io_dIn4 = io_dIn_3; // @[Winograd.scala 203:15:@101.4]
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
  out2_0 = _RAND_1[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_189 = _RAND_2[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  out3_0 = _RAND_3[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  _T_194 = _RAND_4[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  _T_196 = _RAND_5[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  out4_0 = _RAND_6[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  out1_1 = _RAND_7[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  out2_1 = _RAND_8[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  out3_1 = _RAND_9[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  out4_1 = _RAND_10[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  out1_2 = _RAND_11[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  out2_2 = _RAND_12[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  out3_2 = _RAND_13[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  out4_2 = _RAND_14[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  out1_3 = _RAND_15[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  out2_3 = _RAND_16[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  out3_3 = _RAND_17[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  out4_3 = _RAND_18[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  _T_237 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  _T_239 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  _T_241 = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  _T_243 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 2'h0;
    end else begin
      if (io_mac_in_valid) begin
        value <= _T_183;
      end
    end
    out2_0 <= m_BT_io_dOut2;
    _T_189 <= m_BT_io_dOut3;
    out3_0 <= _T_189;
    _T_194 <= m_BT_io_dOut4;
    _T_196 <= _T_194;
    out4_0 <= _T_196;
    out1_1 <= m_BT_io_dOut1;
    out2_1 <= out2_0;
    out3_1 <= out3_0;
    out4_1 <= out4_0;
    out1_2 <= out1_1;
    out2_2 <= out2_1;
    out3_2 <= out3_1;
    out4_2 <= out4_1;
    out1_3 <= out1_2;
    out2_3 <= out2_2;
    out3_3 <= out3_2;
    out4_3 <= out4_2;
    _T_237 <= io_mac_in_valid;
    _T_239 <= _T_237;
    _T_241 <= _T_239;
    _T_243 <= _T_241;
  end
endmodule
module B( // @[:@349.2]
  input        clock, // @[:@350.4]
  input  [8:0] io_dIn_0, // @[:@352.4]
  input  [8:0] io_dIn_1, // @[:@352.4]
  input  [8:0] io_dIn_2, // @[:@352.4]
  input  [8:0] io_dIn_3, // @[:@352.4]
  output [9:0] io_dOut_0, // @[:@352.4]
  output [9:0] io_dOut_1, // @[:@352.4]
  output [9:0] io_dOut_2, // @[:@352.4]
  output [9:0] io_dOut_3 // @[:@352.4]
);
  wire  Add_9in_10out_CLK; // @[Winograd.scala 22:22:@357.4]
  wire [9:0] Add_9in_10out_S; // @[Winograd.scala 22:22:@357.4]
  wire [8:0] Add_9in_10out_B; // @[Winograd.scala 22:22:@357.4]
  wire [8:0] Add_9in_10out_A; // @[Winograd.scala 22:22:@357.4]
  wire  Add_9in_10out_1_CLK; // @[Winograd.scala 22:22:@366.4]
  wire [9:0] Add_9in_10out_1_S; // @[Winograd.scala 22:22:@366.4]
  wire [8:0] Add_9in_10out_1_B; // @[Winograd.scala 22:22:@366.4]
  wire [8:0] Add_9in_10out_1_A; // @[Winograd.scala 22:22:@366.4]
  wire  Add_9in_10out_2_CLK; // @[Winograd.scala 22:22:@378.4]
  wire [9:0] Add_9in_10out_2_S; // @[Winograd.scala 22:22:@378.4]
  wire [8:0] Add_9in_10out_2_B; // @[Winograd.scala 22:22:@378.4]
  wire [8:0] Add_9in_10out_2_A; // @[Winograd.scala 22:22:@378.4]
  wire  Add_9in_10out_3_CLK; // @[Winograd.scala 22:22:@390.4]
  wire [9:0] Add_9in_10out_3_S; // @[Winograd.scala 22:22:@390.4]
  wire [8:0] Add_9in_10out_3_B; // @[Winograd.scala 22:22:@390.4]
  wire [8:0] Add_9in_10out_3_A; // @[Winograd.scala 22:22:@390.4]
  wire [9:0] _T_42; // @[Winograd.scala 38:39:@354.4]
  wire [8:0] _T_43; // @[Winograd.scala 38:39:@355.4]
  wire [9:0] _T_46; // @[Winograd.scala 40:39:@375.4]
  wire [8:0] _T_47; // @[Winograd.scala 40:39:@376.4]
  wire [9:0] _T_50; // @[Winograd.scala 41:39:@387.4]
  wire [8:0] _T_51; // @[Winograd.scala 41:39:@388.4]
  Add_9in_10out Add_9in_10out ( // @[Winograd.scala 22:22:@357.4]
    .CLK(Add_9in_10out_CLK),
    .S(Add_9in_10out_S),
    .B(Add_9in_10out_B),
    .A(Add_9in_10out_A)
  );
  Add_9in_10out Add_9in_10out_1 ( // @[Winograd.scala 22:22:@366.4]
    .CLK(Add_9in_10out_1_CLK),
    .S(Add_9in_10out_1_S),
    .B(Add_9in_10out_1_B),
    .A(Add_9in_10out_1_A)
  );
  Add_9in_10out Add_9in_10out_2 ( // @[Winograd.scala 22:22:@378.4]
    .CLK(Add_9in_10out_2_CLK),
    .S(Add_9in_10out_2_S),
    .B(Add_9in_10out_2_B),
    .A(Add_9in_10out_2_A)
  );
  Add_9in_10out Add_9in_10out_3 ( // @[Winograd.scala 22:22:@390.4]
    .CLK(Add_9in_10out_3_CLK),
    .S(Add_9in_10out_3_S),
    .B(Add_9in_10out_3_B),
    .A(Add_9in_10out_3_A)
  );
  assign _T_42 = $signed(9'sh0) - $signed(io_dIn_1); // @[Winograd.scala 38:39:@354.4]
  assign _T_43 = _T_42[8:0]; // @[Winograd.scala 38:39:@355.4]
  assign _T_46 = $signed(9'sh0) - $signed(io_dIn_2); // @[Winograd.scala 40:39:@375.4]
  assign _T_47 = _T_46[8:0]; // @[Winograd.scala 40:39:@376.4]
  assign _T_50 = $signed(9'sh0) - $signed(io_dIn_0); // @[Winograd.scala 41:39:@387.4]
  assign _T_51 = _T_50[8:0]; // @[Winograd.scala 41:39:@388.4]
  assign io_dOut_0 = Add_9in_10out_S; // @[Winograd.scala 38:13:@365.4]
  assign io_dOut_1 = Add_9in_10out_1_S; // @[Winograd.scala 39:13:@374.4]
  assign io_dOut_2 = Add_9in_10out_2_S; // @[Winograd.scala 40:13:@386.4]
  assign io_dOut_3 = Add_9in_10out_3_S; // @[Winograd.scala 41:13:@398.4]
  assign Add_9in_10out_CLK = clock; // @[Winograd.scala 25:16:@364.4]
  assign Add_9in_10out_B = $signed(_T_43); // @[Winograd.scala 24:15:@363.4]
  assign Add_9in_10out_A = io_dIn_3; // @[Winograd.scala 23:15:@362.4]
  assign Add_9in_10out_1_CLK = clock; // @[Winograd.scala 25:16:@373.4]
  assign Add_9in_10out_1_B = io_dIn_1; // @[Winograd.scala 24:15:@372.4]
  assign Add_9in_10out_1_A = io_dIn_2; // @[Winograd.scala 23:15:@371.4]
  assign Add_9in_10out_2_CLK = clock; // @[Winograd.scala 25:16:@385.4]
  assign Add_9in_10out_2_B = $signed(_T_47); // @[Winograd.scala 24:15:@384.4]
  assign Add_9in_10out_2_A = io_dIn_1; // @[Winograd.scala 23:15:@383.4]
  assign Add_9in_10out_3_CLK = clock; // @[Winograd.scala 25:16:@397.4]
  assign Add_9in_10out_3_B = $signed(_T_51); // @[Winograd.scala 24:15:@396.4]
  assign Add_9in_10out_3_A = io_dIn_2; // @[Winograd.scala 23:15:@395.4]
endmodule
module B_module( // @[:@400.2]
  input        clock, // @[:@401.4]
  input        reset, // @[:@402.4]
  input        io_mac_in_valid, // @[:@403.4]
  input  [8:0] io_dIn_0, // @[:@403.4]
  input  [8:0] io_dIn_1, // @[:@403.4]
  input  [8:0] io_dIn_2, // @[:@403.4]
  input  [8:0] io_dIn_3, // @[:@403.4]
  output [9:0] io_dOut_0, // @[:@403.4]
  output [9:0] io_dOut_1, // @[:@403.4]
  output [9:0] io_dOut_2, // @[:@403.4]
  output [9:0] io_dOut_3, // @[:@403.4]
  output       io_out_valid // @[:@403.4]
);
  wire  m_B_clock; // @[Winograd.scala 55:17:@405.4]
  wire [8:0] m_B_io_dIn_0; // @[Winograd.scala 55:17:@405.4]
  wire [8:0] m_B_io_dIn_1; // @[Winograd.scala 55:17:@405.4]
  wire [8:0] m_B_io_dIn_2; // @[Winograd.scala 55:17:@405.4]
  wire [8:0] m_B_io_dIn_3; // @[Winograd.scala 55:17:@405.4]
  wire [9:0] m_B_io_dOut_0; // @[Winograd.scala 55:17:@405.4]
  wire [9:0] m_B_io_dOut_1; // @[Winograd.scala 55:17:@405.4]
  wire [9:0] m_B_io_dOut_2; // @[Winograd.scala 55:17:@405.4]
  wire [9:0] m_B_io_dOut_3; // @[Winograd.scala 55:17:@405.4]
  reg [1:0] value; // @[Counter.scala 26:33:@496.4]
  reg [31:0] _RAND_0;
  wire  _T_180; // @[Counter.scala 34:24:@498.6]
  wire [2:0] _T_182; // @[Counter.scala 35:22:@499.6]
  wire [1:0] _T_183; // @[Counter.scala 35:22:@500.6]
  wire [1:0] _GEN_0; // @[Counter.scala 63:17:@497.4]
  reg [9:0] out2_0; // @[Reg.scala 11:16:@505.4]
  reg [31:0] _RAND_1;
  reg [9:0] _T_189; // @[Reg.scala 11:16:@510.4]
  reg [31:0] _RAND_2;
  reg [9:0] out3_0; // @[Reg.scala 11:16:@514.4]
  reg [31:0] _RAND_3;
  reg [9:0] _T_194; // @[Reg.scala 11:16:@519.4]
  reg [31:0] _RAND_4;
  reg [9:0] _T_196; // @[Reg.scala 11:16:@523.4]
  reg [31:0] _RAND_5;
  reg [9:0] out4_0; // @[Reg.scala 11:16:@527.4]
  reg [31:0] _RAND_6;
  reg [9:0] out1_1; // @[Winograd.scala 96:21:@532.4]
  reg [31:0] _RAND_7;
  reg [9:0] out2_1; // @[Winograd.scala 97:21:@535.4]
  reg [31:0] _RAND_8;
  reg [9:0] out3_1; // @[Winograd.scala 98:21:@538.4]
  reg [31:0] _RAND_9;
  reg [9:0] out4_1; // @[Winograd.scala 99:21:@541.4]
  reg [31:0] _RAND_10;
  reg [9:0] out1_2; // @[Winograd.scala 96:21:@544.4]
  reg [31:0] _RAND_11;
  reg [9:0] out2_2; // @[Winograd.scala 97:21:@547.4]
  reg [31:0] _RAND_12;
  reg [9:0] out3_2; // @[Winograd.scala 98:21:@550.4]
  reg [31:0] _RAND_13;
  reg [9:0] out4_2; // @[Winograd.scala 99:21:@553.4]
  reg [31:0] _RAND_14;
  reg [9:0] out1_3; // @[Winograd.scala 96:21:@556.4]
  reg [31:0] _RAND_15;
  reg [9:0] out2_3; // @[Winograd.scala 97:21:@559.4]
  reg [31:0] _RAND_16;
  reg [9:0] out3_3; // @[Winograd.scala 98:21:@562.4]
  reg [31:0] _RAND_17;
  reg [9:0] out4_3; // @[Winograd.scala 99:21:@565.4]
  reg [31:0] _RAND_18;
  wire  _T_224; // @[Winograd.scala 102:11:@568.4]
  wire  _T_226; // @[Winograd.scala 107:17:@576.6]
  wire  _T_228; // @[Winograd.scala 113:17:@584.8]
  wire [9:0] _GEN_7; // @[Winograd.scala 118:24:@593.10]
  wire [9:0] _GEN_8; // @[Winograd.scala 118:24:@593.10]
  wire [9:0] _GEN_9; // @[Winograd.scala 118:24:@593.10]
  wire [9:0] _GEN_10; // @[Winograd.scala 118:24:@593.10]
  wire [9:0] _GEN_11; // @[Winograd.scala 113:24:@585.8]
  wire [9:0] _GEN_12; // @[Winograd.scala 113:24:@585.8]
  wire [9:0] _GEN_13; // @[Winograd.scala 113:24:@585.8]
  wire [9:0] _GEN_14; // @[Winograd.scala 113:24:@585.8]
  wire [9:0] _GEN_15; // @[Winograd.scala 107:25:@577.6]
  wire [9:0] _GEN_16; // @[Winograd.scala 107:25:@577.6]
  wire [9:0] _GEN_17; // @[Winograd.scala 107:25:@577.6]
  wire [9:0] _GEN_18; // @[Winograd.scala 107:25:@577.6]
  wire [9:0] out1_0; // @[Winograd.scala 65:19:@428.4 Winograd.scala 65:19:@429.4 Winograd.scala 90:10:@504.4]
  reg  _T_237; // @[Reg.scala 11:16:@605.4]
  reg [31:0] _RAND_19;
  reg  _T_239; // @[Reg.scala 11:16:@609.4]
  reg [31:0] _RAND_20;
  reg  _T_241; // @[Reg.scala 11:16:@613.4]
  reg [31:0] _RAND_21;
  reg  _T_243; // @[Reg.scala 11:16:@617.4]
  reg [31:0] _RAND_22;
  B m_B ( // @[Winograd.scala 55:17:@405.4]
    .clock(m_B_clock),
    .io_dIn_0(m_B_io_dIn_0),
    .io_dIn_1(m_B_io_dIn_1),
    .io_dIn_2(m_B_io_dIn_2),
    .io_dIn_3(m_B_io_dIn_3),
    .io_dOut_0(m_B_io_dOut_0),
    .io_dOut_1(m_B_io_dOut_1),
    .io_dOut_2(m_B_io_dOut_2),
    .io_dOut_3(m_B_io_dOut_3)
  );
  assign _T_180 = value == 2'h3; // @[Counter.scala 34:24:@498.6]
  assign _T_182 = value + 2'h1; // @[Counter.scala 35:22:@499.6]
  assign _T_183 = _T_182[1:0]; // @[Counter.scala 35:22:@500.6]
  assign _GEN_0 = io_mac_in_valid ? _T_183 : value; // @[Counter.scala 63:17:@497.4]
  assign _T_224 = value == 2'h0; // @[Winograd.scala 102:11:@568.4]
  assign _T_226 = value == 2'h1; // @[Winograd.scala 107:17:@576.6]
  assign _T_228 = value == 2'h2; // @[Winograd.scala 113:17:@584.8]
  assign _GEN_7 = _T_180 ? $signed(out4_0) : $signed(10'sh0); // @[Winograd.scala 118:24:@593.10]
  assign _GEN_8 = _T_180 ? $signed(out4_1) : $signed(10'sh0); // @[Winograd.scala 118:24:@593.10]
  assign _GEN_9 = _T_180 ? $signed(out4_2) : $signed(10'sh0); // @[Winograd.scala 118:24:@593.10]
  assign _GEN_10 = _T_180 ? $signed(out4_3) : $signed(10'sh0); // @[Winograd.scala 118:24:@593.10]
  assign _GEN_11 = _T_228 ? $signed(out3_0) : $signed(_GEN_7); // @[Winograd.scala 113:24:@585.8]
  assign _GEN_12 = _T_228 ? $signed(out3_1) : $signed(_GEN_8); // @[Winograd.scala 113:24:@585.8]
  assign _GEN_13 = _T_228 ? $signed(out3_2) : $signed(_GEN_9); // @[Winograd.scala 113:24:@585.8]
  assign _GEN_14 = _T_228 ? $signed(out3_3) : $signed(_GEN_10); // @[Winograd.scala 113:24:@585.8]
  assign _GEN_15 = _T_226 ? $signed(out2_0) : $signed(_GEN_11); // @[Winograd.scala 107:25:@577.6]
  assign _GEN_16 = _T_226 ? $signed(out2_1) : $signed(_GEN_12); // @[Winograd.scala 107:25:@577.6]
  assign _GEN_17 = _T_226 ? $signed(out2_2) : $signed(_GEN_13); // @[Winograd.scala 107:25:@577.6]
  assign _GEN_18 = _T_226 ? $signed(out2_3) : $signed(_GEN_14); // @[Winograd.scala 107:25:@577.6]
  assign out1_0 = m_B_io_dOut_0; // @[Winograd.scala 65:19:@428.4 Winograd.scala 65:19:@429.4 Winograd.scala 90:10:@504.4]
  assign io_dOut_0 = _T_224 ? $signed(out1_0) : $signed(_GEN_15); // @[Winograd.scala 103:16:@570.6 Winograd.scala 108:16:@578.8 Winograd.scala 114:16:@586.10 Winograd.scala 119:16:@594.12 Winograd.scala 124:16:@600.12]
  assign io_dOut_1 = _T_224 ? $signed(out1_1) : $signed(_GEN_16); // @[Winograd.scala 104:16:@571.6 Winograd.scala 109:16:@579.8 Winograd.scala 115:16:@587.10 Winograd.scala 120:16:@595.12 Winograd.scala 125:15:@601.12]
  assign io_dOut_2 = _T_224 ? $signed(out1_2) : $signed(_GEN_17); // @[Winograd.scala 105:16:@572.6 Winograd.scala 110:16:@580.8 Winograd.scala 116:16:@588.10 Winograd.scala 121:16:@596.12 Winograd.scala 126:15:@602.12]
  assign io_dOut_3 = _T_224 ? $signed(out1_3) : $signed(_GEN_18); // @[Winograd.scala 106:16:@573.6 Winograd.scala 111:16:@581.8 Winograd.scala 117:16:@589.10 Winograd.scala 122:16:@597.12 Winograd.scala 127:15:@603.12]
  assign io_out_valid = _T_243; // @[Winograd.scala 129:15:@621.4]
  assign m_B_clock = clock; // @[:@406.4]
  assign m_B_io_dIn_0 = io_dIn_0; // @[Winograd.scala 57:16:@408.4]
  assign m_B_io_dIn_1 = io_dIn_1; // @[Winograd.scala 58:16:@409.4]
  assign m_B_io_dIn_2 = io_dIn_2; // @[Winograd.scala 59:16:@410.4]
  assign m_B_io_dIn_3 = io_dIn_3; // @[Winograd.scala 60:16:@411.4]
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
  out2_0 = _RAND_1[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_189 = _RAND_2[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  out3_0 = _RAND_3[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  _T_194 = _RAND_4[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  _T_196 = _RAND_5[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  out4_0 = _RAND_6[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  out1_1 = _RAND_7[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  out2_1 = _RAND_8[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  out3_1 = _RAND_9[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  out4_1 = _RAND_10[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  out1_2 = _RAND_11[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  out2_2 = _RAND_12[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  out3_2 = _RAND_13[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  out4_2 = _RAND_14[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  out1_3 = _RAND_15[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  out2_3 = _RAND_16[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  out3_3 = _RAND_17[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  out4_3 = _RAND_18[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  _T_237 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  _T_239 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  _T_241 = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  _T_243 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 2'h0;
    end else begin
      if (io_mac_in_valid) begin
        value <= _T_183;
      end
    end
    out2_0 <= m_B_io_dOut_1;
    _T_189 <= m_B_io_dOut_2;
    out3_0 <= _T_189;
    _T_194 <= m_B_io_dOut_3;
    _T_196 <= _T_194;
    out4_0 <= _T_196;
    out1_1 <= m_B_io_dOut_0;
    out2_1 <= out2_0;
    out3_1 <= out3_0;
    out4_1 <= out4_0;
    out1_2 <= out1_1;
    out2_2 <= out2_1;
    out3_2 <= out3_1;
    out4_2 <= out4_1;
    out1_3 <= out1_2;
    out2_3 <= out2_2;
    out3_3 <= out3_2;
    out4_3 <= out4_2;
    _T_237 <= io_mac_in_valid;
    _T_239 <= _T_237;
    _T_241 <= _T_239;
    _T_243 <= _T_241;
  end
endmodule
module MUL( // @[:@659.2]
  input         clock, // @[:@660.4]
  input  [9:0]  io_dIn_B_0, // @[:@662.4]
  input  [9:0]  io_dIn_B_1, // @[:@662.4]
  input  [9:0]  io_dIn_B_2, // @[:@662.4]
  input  [9:0]  io_dIn_B_3, // @[:@662.4]
  input  [9:0]  io_dIn_G_0, // @[:@662.4]
  input  [9:0]  io_dIn_G_1, // @[:@662.4]
  input  [9:0]  io_dIn_G_2, // @[:@662.4]
  input  [9:0]  io_dIn_G_3, // @[:@662.4]
  output [19:0] io_dOut_0, // @[:@662.4]
  output [19:0] io_dOut_1, // @[:@662.4]
  output [19:0] io_dOut_2, // @[:@662.4]
  output [19:0] io_dOut_3 // @[:@662.4]
);
  wire  Mul_8in_16out_CLK; // @[Winograd.scala 282:22:@664.4]
  wire [19:0] Mul_8in_16out_P; // @[Winograd.scala 282:22:@664.4]
  wire [9:0] Mul_8in_16out_B; // @[Winograd.scala 282:22:@664.4]
  wire [9:0] Mul_8in_16out_A; // @[Winograd.scala 282:22:@664.4]
  wire  Mul_8in_16out_1_CLK; // @[Winograd.scala 282:22:@673.4]
  wire [19:0] Mul_8in_16out_1_P; // @[Winograd.scala 282:22:@673.4]
  wire [9:0] Mul_8in_16out_1_B; // @[Winograd.scala 282:22:@673.4]
  wire [9:0] Mul_8in_16out_1_A; // @[Winograd.scala 282:22:@673.4]
  wire  Mul_8in_16out_2_CLK; // @[Winograd.scala 282:22:@682.4]
  wire [19:0] Mul_8in_16out_2_P; // @[Winograd.scala 282:22:@682.4]
  wire [9:0] Mul_8in_16out_2_B; // @[Winograd.scala 282:22:@682.4]
  wire [9:0] Mul_8in_16out_2_A; // @[Winograd.scala 282:22:@682.4]
  wire  Mul_8in_16out_3_CLK; // @[Winograd.scala 282:22:@691.4]
  wire [19:0] Mul_8in_16out_3_P; // @[Winograd.scala 282:22:@691.4]
  wire [9:0] Mul_8in_16out_3_B; // @[Winograd.scala 282:22:@691.4]
  wire [9:0] Mul_8in_16out_3_A; // @[Winograd.scala 282:22:@691.4]
  Mul_8in_16out Mul_8in_16out ( // @[Winograd.scala 282:22:@664.4]
    .CLK(Mul_8in_16out_CLK),
    .P(Mul_8in_16out_P),
    .B(Mul_8in_16out_B),
    .A(Mul_8in_16out_A)
  );
  Mul_8in_16out Mul_8in_16out_1 ( // @[Winograd.scala 282:22:@673.4]
    .CLK(Mul_8in_16out_1_CLK),
    .P(Mul_8in_16out_1_P),
    .B(Mul_8in_16out_1_B),
    .A(Mul_8in_16out_1_A)
  );
  Mul_8in_16out Mul_8in_16out_2 ( // @[Winograd.scala 282:22:@682.4]
    .CLK(Mul_8in_16out_2_CLK),
    .P(Mul_8in_16out_2_P),
    .B(Mul_8in_16out_2_B),
    .A(Mul_8in_16out_2_A)
  );
  Mul_8in_16out Mul_8in_16out_3 ( // @[Winograd.scala 282:22:@691.4]
    .CLK(Mul_8in_16out_3_CLK),
    .P(Mul_8in_16out_3_P),
    .B(Mul_8in_16out_3_B),
    .A(Mul_8in_16out_3_A)
  );
  assign io_dOut_0 = Mul_8in_16out_P; // @[Winograd.scala 306:15:@672.4]
  assign io_dOut_1 = Mul_8in_16out_1_P; // @[Winograd.scala 306:15:@681.4]
  assign io_dOut_2 = Mul_8in_16out_2_P; // @[Winograd.scala 306:15:@690.4]
  assign io_dOut_3 = Mul_8in_16out_3_P; // @[Winograd.scala 306:15:@699.4]
  assign Mul_8in_16out_CLK = clock; // @[Winograd.scala 285:16:@671.4]
  assign Mul_8in_16out_B = io_dIn_G_0; // @[Winograd.scala 284:15:@670.4]
  assign Mul_8in_16out_A = io_dIn_B_0; // @[Winograd.scala 283:15:@669.4]
  assign Mul_8in_16out_1_CLK = clock; // @[Winograd.scala 285:16:@680.4]
  assign Mul_8in_16out_1_B = io_dIn_G_1; // @[Winograd.scala 284:15:@679.4]
  assign Mul_8in_16out_1_A = io_dIn_B_1; // @[Winograd.scala 283:15:@678.4]
  assign Mul_8in_16out_2_CLK = clock; // @[Winograd.scala 285:16:@689.4]
  assign Mul_8in_16out_2_B = io_dIn_G_2; // @[Winograd.scala 284:15:@688.4]
  assign Mul_8in_16out_2_A = io_dIn_B_2; // @[Winograd.scala 283:15:@687.4]
  assign Mul_8in_16out_3_CLK = clock; // @[Winograd.scala 285:16:@698.4]
  assign Mul_8in_16out_3_B = io_dIn_G_3; // @[Winograd.scala 284:15:@697.4]
  assign Mul_8in_16out_3_A = io_dIn_B_3; // @[Winograd.scala 283:15:@696.4]
endmodule
module MUL_module( // @[:@701.2]
  input         clock, // @[:@702.4]
  input         io_mac_in_valid, // @[:@704.4]
  input  [9:0]  io_dIn_B_0, // @[:@704.4]
  input  [9:0]  io_dIn_B_1, // @[:@704.4]
  input  [9:0]  io_dIn_B_2, // @[:@704.4]
  input  [9:0]  io_dIn_B_3, // @[:@704.4]
  input  [9:0]  io_dIn_G_0, // @[:@704.4]
  input  [9:0]  io_dIn_G_1, // @[:@704.4]
  input  [9:0]  io_dIn_G_2, // @[:@704.4]
  input  [9:0]  io_dIn_G_3, // @[:@704.4]
  output [19:0] io_dOut_0, // @[:@704.4]
  output [19:0] io_dOut_1, // @[:@704.4]
  output [19:0] io_dOut_2, // @[:@704.4]
  output [19:0] io_dOut_3, // @[:@704.4]
  output        io_out_valid // @[:@704.4]
);
  wire  m_MUL_clock; // @[Winograd.scala 320:19:@706.4]
  wire [9:0] m_MUL_io_dIn_B_0; // @[Winograd.scala 320:19:@706.4]
  wire [9:0] m_MUL_io_dIn_B_1; // @[Winograd.scala 320:19:@706.4]
  wire [9:0] m_MUL_io_dIn_B_2; // @[Winograd.scala 320:19:@706.4]
  wire [9:0] m_MUL_io_dIn_B_3; // @[Winograd.scala 320:19:@706.4]
  wire [9:0] m_MUL_io_dIn_G_0; // @[Winograd.scala 320:19:@706.4]
  wire [9:0] m_MUL_io_dIn_G_1; // @[Winograd.scala 320:19:@706.4]
  wire [9:0] m_MUL_io_dIn_G_2; // @[Winograd.scala 320:19:@706.4]
  wire [9:0] m_MUL_io_dIn_G_3; // @[Winograd.scala 320:19:@706.4]
  wire [19:0] m_MUL_io_dOut_0; // @[Winograd.scala 320:19:@706.4]
  wire [19:0] m_MUL_io_dOut_1; // @[Winograd.scala 320:19:@706.4]
  wire [19:0] m_MUL_io_dOut_2; // @[Winograd.scala 320:19:@706.4]
  wire [19:0] m_MUL_io_dOut_3; // @[Winograd.scala 320:19:@706.4]
  reg [19:0] _T_65; // @[Reg.scala 11:16:@711.4]
  reg [31:0] _RAND_0;
  reg [19:0] _T_67; // @[Reg.scala 11:16:@715.4]
  reg [31:0] _RAND_1;
  reg [19:0] _T_69; // @[Reg.scala 11:16:@719.4]
  reg [31:0] _RAND_2;
  reg [19:0] _T_72; // @[Reg.scala 11:16:@726.4]
  reg [31:0] _RAND_3;
  reg [19:0] _T_74; // @[Reg.scala 11:16:@730.4]
  reg [31:0] _RAND_4;
  reg [19:0] _T_76; // @[Reg.scala 11:16:@734.4]
  reg [31:0] _RAND_5;
  reg [19:0] _T_79; // @[Reg.scala 11:16:@741.4]
  reg [31:0] _RAND_6;
  reg [19:0] _T_81; // @[Reg.scala 11:16:@745.4]
  reg [31:0] _RAND_7;
  reg [19:0] _T_83; // @[Reg.scala 11:16:@749.4]
  reg [31:0] _RAND_8;
  reg [19:0] _T_86; // @[Reg.scala 11:16:@756.4]
  reg [31:0] _RAND_9;
  reg [19:0] _T_88; // @[Reg.scala 11:16:@760.4]
  reg [31:0] _RAND_10;
  reg [19:0] _T_90; // @[Reg.scala 11:16:@764.4]
  reg [31:0] _RAND_11;
  reg  _T_93; // @[Reg.scala 11:16:@769.4]
  reg [31:0] _RAND_12;
  reg  _T_95; // @[Reg.scala 11:16:@773.4]
  reg [31:0] _RAND_13;
  reg  _T_97; // @[Reg.scala 11:16:@777.4]
  reg [31:0] _RAND_14;
  reg  _T_99; // @[Reg.scala 11:16:@781.4]
  reg [31:0] _RAND_15;
  MUL m_MUL ( // @[Winograd.scala 320:19:@706.4]
    .clock(m_MUL_clock),
    .io_dIn_B_0(m_MUL_io_dIn_B_0),
    .io_dIn_B_1(m_MUL_io_dIn_B_1),
    .io_dIn_B_2(m_MUL_io_dIn_B_2),
    .io_dIn_B_3(m_MUL_io_dIn_B_3),
    .io_dIn_G_0(m_MUL_io_dIn_G_0),
    .io_dIn_G_1(m_MUL_io_dIn_G_1),
    .io_dIn_G_2(m_MUL_io_dIn_G_2),
    .io_dIn_G_3(m_MUL_io_dIn_G_3),
    .io_dOut_0(m_MUL_io_dOut_0),
    .io_dOut_1(m_MUL_io_dOut_1),
    .io_dOut_2(m_MUL_io_dOut_2),
    .io_dOut_3(m_MUL_io_dOut_3)
  );
  assign io_dOut_0 = _T_69; // @[Winograd.scala 326:15:@723.4]
  assign io_dOut_1 = _T_76; // @[Winograd.scala 326:15:@738.4]
  assign io_dOut_2 = _T_83; // @[Winograd.scala 326:15:@753.4]
  assign io_dOut_3 = _T_90; // @[Winograd.scala 326:15:@768.4]
  assign io_out_valid = _T_99; // @[Winograd.scala 386:15:@785.4]
  assign m_MUL_clock = clock; // @[:@707.4]
  assign m_MUL_io_dIn_B_0 = io_dIn_B_0; // @[Winograd.scala 325:22:@710.4]
  assign m_MUL_io_dIn_B_1 = io_dIn_B_1; // @[Winograd.scala 325:22:@725.4]
  assign m_MUL_io_dIn_B_2 = io_dIn_B_2; // @[Winograd.scala 325:22:@740.4]
  assign m_MUL_io_dIn_B_3 = io_dIn_B_3; // @[Winograd.scala 325:22:@755.4]
  assign m_MUL_io_dIn_G_0 = io_dIn_G_0; // @[Winograd.scala 324:22:@709.4]
  assign m_MUL_io_dIn_G_1 = io_dIn_G_1; // @[Winograd.scala 324:22:@724.4]
  assign m_MUL_io_dIn_G_2 = io_dIn_G_2; // @[Winograd.scala 324:22:@739.4]
  assign m_MUL_io_dIn_G_3 = io_dIn_G_3; // @[Winograd.scala 324:22:@754.4]
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
  _T_65 = _RAND_0[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  _T_67 = _RAND_1[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_69 = _RAND_2[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  _T_72 = _RAND_3[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  _T_74 = _RAND_4[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  _T_76 = _RAND_5[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  _T_79 = _RAND_6[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  _T_81 = _RAND_7[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  _T_83 = _RAND_8[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  _T_86 = _RAND_9[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  _T_88 = _RAND_10[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  _T_90 = _RAND_11[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  _T_93 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  _T_95 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  _T_97 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  _T_99 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    _T_65 <= m_MUL_io_dOut_0;
    _T_67 <= _T_65;
    _T_69 <= _T_67;
    _T_72 <= m_MUL_io_dOut_1;
    _T_74 <= _T_72;
    _T_76 <= _T_74;
    _T_79 <= m_MUL_io_dOut_2;
    _T_81 <= _T_79;
    _T_83 <= _T_81;
    _T_86 <= m_MUL_io_dOut_3;
    _T_88 <= _T_86;
    _T_90 <= _T_88;
    _T_93 <= io_mac_in_valid;
    _T_95 <= _T_93;
    _T_97 <= _T_95;
    _T_99 <= _T_97;
  end
endmodule
module AT( // @[:@823.2]
  input         clock, // @[:@824.4]
  input  [19:0] io_dIn_0, // @[:@826.4]
  input  [19:0] io_dIn_1, // @[:@826.4]
  input  [19:0] io_dIn_2, // @[:@826.4]
  input  [19:0] io_dIn_3, // @[:@826.4]
  output [21:0] io_dOut_0, // @[:@826.4]
  output [21:0] io_dOut_1 // @[:@826.4]
);
  wire  Add_20in_21out_CLK; // @[Winograd.scala 418:22:@828.4]
  wire [20:0] Add_20in_21out_S; // @[Winograd.scala 418:22:@828.4]
  wire [19:0] Add_20in_21out_B; // @[Winograd.scala 418:22:@828.4]
  wire [19:0] Add_20in_21out_A; // @[Winograd.scala 418:22:@828.4]
  wire  Add_20in_21out_1_CLK; // @[Winograd.scala 418:22:@840.4]
  wire [20:0] Add_20in_21out_1_S; // @[Winograd.scala 418:22:@840.4]
  wire [19:0] Add_20in_21out_1_B; // @[Winograd.scala 418:22:@840.4]
  wire [19:0] Add_20in_21out_1_A; // @[Winograd.scala 418:22:@840.4]
  wire  Add_20in_21out_2_CLK; // @[Winograd.scala 418:22:@852.4]
  wire [20:0] Add_20in_21out_2_S; // @[Winograd.scala 418:22:@852.4]
  wire [19:0] Add_20in_21out_2_B; // @[Winograd.scala 418:22:@852.4]
  wire [19:0] Add_20in_21out_2_A; // @[Winograd.scala 418:22:@852.4]
  wire  Add_20in_21out_3_CLK; // @[Winograd.scala 418:22:@867.4]
  wire [20:0] Add_20in_21out_3_S; // @[Winograd.scala 418:22:@867.4]
  wire [19:0] Add_20in_21out_3_B; // @[Winograd.scala 418:22:@867.4]
  wire [19:0] Add_20in_21out_3_A; // @[Winograd.scala 418:22:@867.4]
  reg [19:0] _T_39; // @[Reg.scala 11:16:@836.4]
  reg [31:0] _RAND_0;
  wire [20:0] _T_41; // @[Winograd.scala 442:55:@849.4]
  wire [19:0] _T_42; // @[Winograd.scala 442:55:@850.4]
  reg [19:0] _T_46; // @[Reg.scala 11:16:@860.4]
  reg [31:0] _RAND_1;
  wire [20:0] _T_48; // @[Winograd.scala 442:67:@864.4]
  wire [19:0] _T_49; // @[Winograd.scala 442:67:@865.4]
  wire [19:0] _GEN_2; // @[Winograd.scala 419:15:@845.4]
  wire [19:0] _GEN_3; // @[Winograd.scala 419:15:@872.4]
  Add_20in_21out Add_20in_21out ( // @[Winograd.scala 418:22:@828.4]
    .CLK(Add_20in_21out_CLK),
    .S(Add_20in_21out_S),
    .B(Add_20in_21out_B),
    .A(Add_20in_21out_A)
  );
  Add_20in_21out Add_20in_21out_1 ( // @[Winograd.scala 418:22:@840.4]
    .CLK(Add_20in_21out_1_CLK),
    .S(Add_20in_21out_1_S),
    .B(Add_20in_21out_1_B),
    .A(Add_20in_21out_1_A)
  );
  Add_20in_21out Add_20in_21out_2 ( // @[Winograd.scala 418:22:@852.4]
    .CLK(Add_20in_21out_2_CLK),
    .S(Add_20in_21out_2_S),
    .B(Add_20in_21out_2_B),
    .A(Add_20in_21out_2_A)
  );
  Add_20in_21out Add_20in_21out_3 ( // @[Winograd.scala 418:22:@867.4]
    .CLK(Add_20in_21out_3_CLK),
    .S(Add_20in_21out_3_S),
    .B(Add_20in_21out_3_B),
    .A(Add_20in_21out_3_A)
  );
  assign _T_41 = $signed(20'sh0) - $signed(io_dIn_1); // @[Winograd.scala 442:55:@849.4]
  assign _T_42 = _T_41[19:0]; // @[Winograd.scala 442:55:@850.4]
  assign _T_48 = $signed(20'sh0) - $signed(_T_46); // @[Winograd.scala 442:67:@864.4]
  assign _T_49 = _T_48[19:0]; // @[Winograd.scala 442:67:@865.4]
  assign io_dOut_0 = {{1{Add_20in_21out_1_S[20]}},Add_20in_21out_1_S}; // @[Winograd.scala 441:13:@848.4]
  assign io_dOut_1 = {{1{Add_20in_21out_3_S[20]}},Add_20in_21out_3_S}; // @[Winograd.scala 442:13:@875.4]
  assign Add_20in_21out_CLK = clock; // @[Winograd.scala 421:16:@835.4]
  assign Add_20in_21out_B = io_dIn_2; // @[Winograd.scala 420:15:@834.4]
  assign Add_20in_21out_A = io_dIn_1; // @[Winograd.scala 419:15:@833.4]
  assign Add_20in_21out_1_CLK = clock; // @[Winograd.scala 421:16:@847.4]
  assign Add_20in_21out_1_B = _T_39; // @[Winograd.scala 420:15:@846.4]
  assign _GEN_2 = Add_20in_21out_S[19:0]; // @[Winograd.scala 419:15:@845.4]
  assign Add_20in_21out_1_A = $signed(_GEN_2); // @[Winograd.scala 419:15:@845.4]
  assign Add_20in_21out_2_CLK = clock; // @[Winograd.scala 421:16:@859.4]
  assign Add_20in_21out_2_B = $signed(_T_42); // @[Winograd.scala 420:15:@858.4]
  assign Add_20in_21out_2_A = io_dIn_2; // @[Winograd.scala 419:15:@857.4]
  assign Add_20in_21out_3_CLK = clock; // @[Winograd.scala 421:16:@874.4]
  assign Add_20in_21out_3_B = $signed(_T_49); // @[Winograd.scala 420:15:@873.4]
  assign _GEN_3 = Add_20in_21out_2_S[19:0]; // @[Winograd.scala 419:15:@872.4]
  assign Add_20in_21out_3_A = $signed(_GEN_3); // @[Winograd.scala 419:15:@872.4]
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
  _T_39 = _RAND_0[19:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  _T_46 = _RAND_1[19:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    _T_39 <= io_dIn_3;
    _T_46 <= io_dIn_0;
  end
endmodule
module AT_module( // @[:@877.2]
  input         clock, // @[:@878.4]
  input         reset, // @[:@879.4]
  input         io_mac_in_valid, // @[:@880.4]
  input  [19:0] io_dIn_0, // @[:@880.4]
  input  [19:0] io_dIn_1, // @[:@880.4]
  input  [19:0] io_dIn_2, // @[:@880.4]
  input  [19:0] io_dIn_3, // @[:@880.4]
  output [21:0] io_dOut_0, // @[:@880.4]
  output [21:0] io_dOut_1, // @[:@880.4]
  output [21:0] io_dOut_2, // @[:@880.4]
  output [21:0] io_dOut_3, // @[:@880.4]
  output        io_out_valid // @[:@880.4]
);
  wire  m_AT_clock; // @[Winograd.scala 454:18:@882.4]
  wire [19:0] m_AT_io_dIn_0; // @[Winograd.scala 454:18:@882.4]
  wire [19:0] m_AT_io_dIn_1; // @[Winograd.scala 454:18:@882.4]
  wire [19:0] m_AT_io_dIn_2; // @[Winograd.scala 454:18:@882.4]
  wire [19:0] m_AT_io_dIn_3; // @[Winograd.scala 454:18:@882.4]
  wire [21:0] m_AT_io_dOut_0; // @[Winograd.scala 454:18:@882.4]
  wire [21:0] m_AT_io_dOut_1; // @[Winograd.scala 454:18:@882.4]
  reg  _T_150; // @[Reg.scala 11:16:@954.4]
  reg [31:0] _RAND_0;
  reg  _T_152; // @[Reg.scala 11:16:@958.4]
  reg [31:0] _RAND_1;
  reg  _T_154; // @[Reg.scala 11:16:@962.4]
  reg [31:0] _RAND_2;
  reg  _T_156; // @[Reg.scala 11:16:@966.4]
  reg [31:0] _RAND_3;
  reg [1:0] value; // @[Counter.scala 26:33:@970.4]
  reg [31:0] _RAND_4;
  wire [2:0] _T_162; // @[Counter.scala 35:22:@973.6]
  wire [1:0] _T_163; // @[Counter.scala 35:22:@974.6]
  wire [1:0] _GEN_4; // @[Counter.scala 63:17:@971.4]
  reg [21:0] out2_0; // @[Reg.scala 11:16:@979.4]
  reg [31:0] _RAND_5;
  reg [21:0] out1_1; // @[Winograd.scala 485:21:@984.4]
  reg [31:0] _RAND_6;
  reg [21:0] out2_1; // @[Winograd.scala 486:21:@987.4]
  reg [31:0] _RAND_7;
  reg [21:0] out1_2; // @[Winograd.scala 485:21:@990.4]
  reg [31:0] _RAND_8;
  reg [21:0] out2_2; // @[Winograd.scala 486:21:@993.4]
  reg [31:0] _RAND_9;
  reg [21:0] out1_3; // @[Winograd.scala 485:21:@996.4]
  reg [31:0] _RAND_10;
  reg [21:0] out2_3; // @[Winograd.scala 486:21:@999.4]
  reg [31:0] _RAND_11;
  wire  _T_180; // @[Winograd.scala 489:14:@1002.4]
  wire  _T_182; // @[Winograd.scala 494:20:@1010.6]
  wire [21:0] _GEN_6; // @[Winograd.scala 494:28:@1011.6]
  wire [21:0] _GEN_7; // @[Winograd.scala 494:28:@1011.6]
  wire [21:0] _GEN_8; // @[Winograd.scala 494:28:@1011.6]
  wire [21:0] _GEN_9; // @[Winograd.scala 494:28:@1011.6]
  wire [21:0] out1_0; // @[Winograd.scala 469:19:@907.4 Winograd.scala 469:19:@908.4 Winograd.scala 482:10:@978.4]
  reg [21:0] _T_189; // @[Reg.scala 11:16:@1023.4]
  reg [31:0] _RAND_12;
  reg [21:0] _T_191; // @[Reg.scala 11:16:@1027.4]
  reg [31:0] _RAND_13;
  reg [21:0] _T_193; // @[Reg.scala 11:16:@1031.4]
  reg [31:0] _RAND_14;
  reg [21:0] _T_196; // @[Reg.scala 11:16:@1036.4]
  reg [31:0] _RAND_15;
  reg [21:0] _T_198; // @[Reg.scala 11:16:@1040.4]
  reg [31:0] _RAND_16;
  reg [21:0] _T_200; // @[Reg.scala 11:16:@1044.4]
  reg [31:0] _RAND_17;
  reg [21:0] _T_203; // @[Reg.scala 11:16:@1049.4]
  reg [31:0] _RAND_18;
  reg [21:0] _T_205; // @[Reg.scala 11:16:@1053.4]
  reg [31:0] _RAND_19;
  reg [21:0] _T_207; // @[Reg.scala 11:16:@1057.4]
  reg [31:0] _RAND_20;
  reg [21:0] _T_210; // @[Reg.scala 11:16:@1062.4]
  reg [31:0] _RAND_21;
  reg [21:0] _T_212; // @[Reg.scala 11:16:@1066.4]
  reg [31:0] _RAND_22;
  reg [21:0] _T_214; // @[Reg.scala 11:16:@1070.4]
  reg [31:0] _RAND_23;
  reg  _T_217; // @[Reg.scala 11:16:@1075.4]
  reg [31:0] _RAND_24;
  reg  _T_219; // @[Reg.scala 11:16:@1079.4]
  reg [31:0] _RAND_25;
  reg  _T_221; // @[Reg.scala 11:16:@1083.4]
  reg [31:0] _RAND_26;
  reg  _T_223; // @[Reg.scala 11:16:@1087.4]
  reg [31:0] _RAND_27;
  reg  _T_225; // @[Reg.scala 11:16:@1091.4]
  reg [31:0] _RAND_28;
  reg  _T_227; // @[Reg.scala 11:16:@1095.4]
  reg [31:0] _RAND_29;
  reg  _T_229; // @[Reg.scala 11:16:@1099.4]
  reg [31:0] _RAND_30;
  reg  _T_231; // @[Reg.scala 11:16:@1103.4]
  reg [31:0] _RAND_31;
  AT m_AT ( // @[Winograd.scala 454:18:@882.4]
    .clock(m_AT_clock),
    .io_dIn_0(m_AT_io_dIn_0),
    .io_dIn_1(m_AT_io_dIn_1),
    .io_dIn_2(m_AT_io_dIn_2),
    .io_dIn_3(m_AT_io_dIn_3),
    .io_dOut_0(m_AT_io_dOut_0),
    .io_dOut_1(m_AT_io_dOut_1)
  );
  assign _T_162 = value + 2'h1; // @[Counter.scala 35:22:@973.6]
  assign _T_163 = _T_162[1:0]; // @[Counter.scala 35:22:@974.6]
  assign _GEN_4 = _T_156 ? _T_163 : value; // @[Counter.scala 63:17:@971.4]
  assign _T_180 = value == 2'h1; // @[Winograd.scala 489:14:@1002.4]
  assign _T_182 = value == 2'h2; // @[Winograd.scala 494:20:@1010.6]
  assign _GEN_6 = _T_182 ? $signed(out2_0) : $signed(22'sh0); // @[Winograd.scala 494:28:@1011.6]
  assign _GEN_7 = _T_182 ? $signed(out2_1) : $signed(22'sh0); // @[Winograd.scala 494:28:@1011.6]
  assign _GEN_8 = _T_182 ? $signed(out2_2) : $signed(22'sh0); // @[Winograd.scala 494:28:@1011.6]
  assign _GEN_9 = _T_182 ? $signed(out2_3) : $signed(22'sh0); // @[Winograd.scala 494:28:@1011.6]
  assign out1_0 = m_AT_io_dOut_0; // @[Winograd.scala 469:19:@907.4 Winograd.scala 469:19:@908.4 Winograd.scala 482:10:@978.4]
  assign io_dOut_0 = _T_193; // @[Winograd.scala 506:15:@1035.4]
  assign io_dOut_1 = _T_200; // @[Winograd.scala 506:15:@1048.4]
  assign io_dOut_2 = _T_207; // @[Winograd.scala 506:15:@1061.4]
  assign io_dOut_3 = _T_214; // @[Winograd.scala 506:15:@1074.4]
  assign io_out_valid = _T_231; // @[Winograd.scala 510:15:@1107.4]
  assign m_AT_clock = clock; // @[:@883.4]
  assign m_AT_io_dIn_0 = io_dIn_0; // @[Winograd.scala 458:19:@885.4]
  assign m_AT_io_dIn_1 = io_dIn_1; // @[Winograd.scala 458:19:@886.4]
  assign m_AT_io_dIn_2 = io_dIn_2; // @[Winograd.scala 458:19:@887.4]
  assign m_AT_io_dIn_3 = io_dIn_3; // @[Winograd.scala 458:19:@888.4]
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
  _T_150 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  _T_152 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_154 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  _T_156 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  value = _RAND_4[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  out2_0 = _RAND_5[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  out1_1 = _RAND_6[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  out2_1 = _RAND_7[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  out1_2 = _RAND_8[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  out2_2 = _RAND_9[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  out1_3 = _RAND_10[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  out2_3 = _RAND_11[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  _T_189 = _RAND_12[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  _T_191 = _RAND_13[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  _T_193 = _RAND_14[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  _T_196 = _RAND_15[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  _T_198 = _RAND_16[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  _T_200 = _RAND_17[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  _T_203 = _RAND_18[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  _T_205 = _RAND_19[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  _T_207 = _RAND_20[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  _T_210 = _RAND_21[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  _T_212 = _RAND_22[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{$random}};
  _T_214 = _RAND_23[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{$random}};
  _T_217 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{$random}};
  _T_219 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{$random}};
  _T_221 = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{$random}};
  _T_223 = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{$random}};
  _T_225 = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{$random}};
  _T_227 = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{$random}};
  _T_229 = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{$random}};
  _T_231 = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    _T_150 <= io_mac_in_valid;
    _T_152 <= _T_150;
    _T_154 <= _T_152;
    _T_156 <= _T_154;
    if (reset) begin
      value <= 2'h0;
    end else begin
      if (_T_156) begin
        value <= _T_163;
      end
    end
    out2_0 <= m_AT_io_dOut_1;
    out1_1 <= m_AT_io_dOut_0;
    out2_1 <= out2_0;
    out1_2 <= out1_1;
    out2_2 <= out2_1;
    out1_3 <= out1_2;
    out2_3 <= out2_2;
    if (_T_180) begin
      _T_189 <= out1_0;
    end else begin
      if (_T_182) begin
        _T_189 <= out2_0;
      end else begin
        _T_189 <= 22'sh0;
      end
    end
    _T_191 <= _T_189;
    _T_193 <= _T_191;
    if (_T_180) begin
      _T_196 <= out1_1;
    end else begin
      if (_T_182) begin
        _T_196 <= out2_1;
      end else begin
        _T_196 <= 22'sh0;
      end
    end
    _T_198 <= _T_196;
    _T_200 <= _T_198;
    if (_T_180) begin
      _T_203 <= out1_2;
    end else begin
      if (_T_182) begin
        _T_203 <= out2_2;
      end else begin
        _T_203 <= 22'sh0;
      end
    end
    _T_205 <= _T_203;
    _T_207 <= _T_205;
    if (_T_180) begin
      _T_210 <= out1_3;
    end else begin
      if (_T_182) begin
        _T_210 <= out2_3;
      end else begin
        _T_210 <= 22'sh0;
      end
    end
    _T_212 <= _T_210;
    _T_214 <= _T_212;
    _T_217 <= io_mac_in_valid;
    _T_219 <= _T_217;
    _T_221 <= _T_219;
    _T_223 <= _T_221;
    _T_225 <= _T_223;
    _T_227 <= _T_225;
    _T_229 <= _T_227;
    _T_231 <= _T_229;
  end
endmodule
module Winograd( // @[:@1431.2]
  input         clock, // @[:@1432.4]
  input         reset, // @[:@1433.4]
  input         io_mac_in_valid, // @[:@1434.4]
  input  [7:0]  io_dIn_0, // @[:@1434.4]
  input  [7:0]  io_dIn_1, // @[:@1434.4]
  input  [7:0]  io_dIn_2, // @[:@1434.4]
  input  [7:0]  io_dIn_3, // @[:@1434.4]
  input  [9:0]  io_dIn_G_0, // @[:@1434.4]
  input  [9:0]  io_dIn_G_1, // @[:@1434.4]
  input  [9:0]  io_dIn_G_2, // @[:@1434.4]
  input  [9:0]  io_dIn_G_3, // @[:@1434.4]
  output [21:0] io_dOut, // @[:@1434.4]
  output        io_out_valid // @[:@1434.4]
);
  wire  BT_module_clock; // @[Winograd.scala 258:22:@1437.4]
  wire  BT_module_reset; // @[Winograd.scala 258:22:@1437.4]
  wire  BT_module_io_mac_in_valid; // @[Winograd.scala 258:22:@1437.4]
  wire [7:0] BT_module_io_dIn_0; // @[Winograd.scala 258:22:@1437.4]
  wire [7:0] BT_module_io_dIn_1; // @[Winograd.scala 258:22:@1437.4]
  wire [7:0] BT_module_io_dIn_2; // @[Winograd.scala 258:22:@1437.4]
  wire [7:0] BT_module_io_dIn_3; // @[Winograd.scala 258:22:@1437.4]
  wire [8:0] BT_module_io_dOut_0; // @[Winograd.scala 258:22:@1437.4]
  wire [8:0] BT_module_io_dOut_1; // @[Winograd.scala 258:22:@1437.4]
  wire [8:0] BT_module_io_dOut_2; // @[Winograd.scala 258:22:@1437.4]
  wire [8:0] BT_module_io_dOut_3; // @[Winograd.scala 258:22:@1437.4]
  wire  BT_module_io_out_valid; // @[Winograd.scala 258:22:@1437.4]
  wire  B_module_clock; // @[Winograd.scala 134:22:@1445.4]
  wire  B_module_reset; // @[Winograd.scala 134:22:@1445.4]
  wire  B_module_io_mac_in_valid; // @[Winograd.scala 134:22:@1445.4]
  wire [8:0] B_module_io_dIn_0; // @[Winograd.scala 134:22:@1445.4]
  wire [8:0] B_module_io_dIn_1; // @[Winograd.scala 134:22:@1445.4]
  wire [8:0] B_module_io_dIn_2; // @[Winograd.scala 134:22:@1445.4]
  wire [8:0] B_module_io_dIn_3; // @[Winograd.scala 134:22:@1445.4]
  wire [9:0] B_module_io_dOut_0; // @[Winograd.scala 134:22:@1445.4]
  wire [9:0] B_module_io_dOut_1; // @[Winograd.scala 134:22:@1445.4]
  wire [9:0] B_module_io_dOut_2; // @[Winograd.scala 134:22:@1445.4]
  wire [9:0] B_module_io_dOut_3; // @[Winograd.scala 134:22:@1445.4]
  wire  B_module_io_out_valid; // @[Winograd.scala 134:22:@1445.4]
  wire  MUL_module_clock; // @[Winograd.scala 391:22:@1453.4]
  wire  MUL_module_io_mac_in_valid; // @[Winograd.scala 391:22:@1453.4]
  wire [9:0] MUL_module_io_dIn_B_0; // @[Winograd.scala 391:22:@1453.4]
  wire [9:0] MUL_module_io_dIn_B_1; // @[Winograd.scala 391:22:@1453.4]
  wire [9:0] MUL_module_io_dIn_B_2; // @[Winograd.scala 391:22:@1453.4]
  wire [9:0] MUL_module_io_dIn_B_3; // @[Winograd.scala 391:22:@1453.4]
  wire [9:0] MUL_module_io_dIn_G_0; // @[Winograd.scala 391:22:@1453.4]
  wire [9:0] MUL_module_io_dIn_G_1; // @[Winograd.scala 391:22:@1453.4]
  wire [9:0] MUL_module_io_dIn_G_2; // @[Winograd.scala 391:22:@1453.4]
  wire [9:0] MUL_module_io_dIn_G_3; // @[Winograd.scala 391:22:@1453.4]
  wire [19:0] MUL_module_io_dOut_0; // @[Winograd.scala 391:22:@1453.4]
  wire [19:0] MUL_module_io_dOut_1; // @[Winograd.scala 391:22:@1453.4]
  wire [19:0] MUL_module_io_dOut_2; // @[Winograd.scala 391:22:@1453.4]
  wire [19:0] MUL_module_io_dOut_3; // @[Winograd.scala 391:22:@1453.4]
  wire  MUL_module_io_out_valid; // @[Winograd.scala 391:22:@1453.4]
  wire  AT_module_clock; // @[Winograd.scala 515:22:@1465.4]
  wire  AT_module_reset; // @[Winograd.scala 515:22:@1465.4]
  wire  AT_module_io_mac_in_valid; // @[Winograd.scala 515:22:@1465.4]
  wire [19:0] AT_module_io_dIn_0; // @[Winograd.scala 515:22:@1465.4]
  wire [19:0] AT_module_io_dIn_1; // @[Winograd.scala 515:22:@1465.4]
  wire [19:0] AT_module_io_dIn_2; // @[Winograd.scala 515:22:@1465.4]
  wire [19:0] AT_module_io_dIn_3; // @[Winograd.scala 515:22:@1465.4]
  wire [21:0] AT_module_io_dOut_0; // @[Winograd.scala 515:22:@1465.4]
  wire [21:0] AT_module_io_dOut_1; // @[Winograd.scala 515:22:@1465.4]
  wire [21:0] AT_module_io_dOut_2; // @[Winograd.scala 515:22:@1465.4]
  wire [21:0] AT_module_io_dOut_3; // @[Winograd.scala 515:22:@1465.4]
  wire  AT_module_io_out_valid; // @[Winograd.scala 515:22:@1465.4]
  wire  AT_module_1_clock; // @[Winograd.scala 515:22:@1473.4]
  wire  AT_module_1_reset; // @[Winograd.scala 515:22:@1473.4]
  wire  AT_module_1_io_mac_in_valid; // @[Winograd.scala 515:22:@1473.4]
  wire [19:0] AT_module_1_io_dIn_0; // @[Winograd.scala 515:22:@1473.4]
  wire [19:0] AT_module_1_io_dIn_1; // @[Winograd.scala 515:22:@1473.4]
  wire [19:0] AT_module_1_io_dIn_2; // @[Winograd.scala 515:22:@1473.4]
  wire [19:0] AT_module_1_io_dIn_3; // @[Winograd.scala 515:22:@1473.4]
  wire [21:0] AT_module_1_io_dOut_0; // @[Winograd.scala 515:22:@1473.4]
  wire [21:0] AT_module_1_io_dOut_1; // @[Winograd.scala 515:22:@1473.4]
  wire [21:0] AT_module_1_io_dOut_2; // @[Winograd.scala 515:22:@1473.4]
  wire [21:0] AT_module_1_io_dOut_3; // @[Winograd.scala 515:22:@1473.4]
  wire  AT_module_1_io_out_valid; // @[Winograd.scala 515:22:@1473.4]
  reg [21:0] out; // @[Winograd.scala 549:18:@1436.4]
  reg [31:0] _RAND_0;
  reg [21:0] _T_51; // @[Reg.scala 11:16:@1482.4]
  reg [31:0] _RAND_1;
  wire  _T_53; // @[Winograd.scala 562:29:@1487.4]
  wire [19:0] _GEN_1; // @[Winograd.scala 518:22:@1477.4]
  wire [19:0] _GEN_2; // @[Winograd.scala 518:22:@1478.4]
  wire [19:0] _GEN_3; // @[Winograd.scala 518:22:@1479.4]
  wire [19:0] _GEN_4; // @[Winograd.scala 518:22:@1480.4]
  BT_module BT_module ( // @[Winograd.scala 258:22:@1437.4]
    .clock(BT_module_clock),
    .reset(BT_module_reset),
    .io_mac_in_valid(BT_module_io_mac_in_valid),
    .io_dIn_0(BT_module_io_dIn_0),
    .io_dIn_1(BT_module_io_dIn_1),
    .io_dIn_2(BT_module_io_dIn_2),
    .io_dIn_3(BT_module_io_dIn_3),
    .io_dOut_0(BT_module_io_dOut_0),
    .io_dOut_1(BT_module_io_dOut_1),
    .io_dOut_2(BT_module_io_dOut_2),
    .io_dOut_3(BT_module_io_dOut_3),
    .io_out_valid(BT_module_io_out_valid)
  );
  B_module B_module ( // @[Winograd.scala 134:22:@1445.4]
    .clock(B_module_clock),
    .reset(B_module_reset),
    .io_mac_in_valid(B_module_io_mac_in_valid),
    .io_dIn_0(B_module_io_dIn_0),
    .io_dIn_1(B_module_io_dIn_1),
    .io_dIn_2(B_module_io_dIn_2),
    .io_dIn_3(B_module_io_dIn_3),
    .io_dOut_0(B_module_io_dOut_0),
    .io_dOut_1(B_module_io_dOut_1),
    .io_dOut_2(B_module_io_dOut_2),
    .io_dOut_3(B_module_io_dOut_3),
    .io_out_valid(B_module_io_out_valid)
  );
  MUL_module MUL_module ( // @[Winograd.scala 391:22:@1453.4]
    .clock(MUL_module_clock),
    .io_mac_in_valid(MUL_module_io_mac_in_valid),
    .io_dIn_B_0(MUL_module_io_dIn_B_0),
    .io_dIn_B_1(MUL_module_io_dIn_B_1),
    .io_dIn_B_2(MUL_module_io_dIn_B_2),
    .io_dIn_B_3(MUL_module_io_dIn_B_3),
    .io_dIn_G_0(MUL_module_io_dIn_G_0),
    .io_dIn_G_1(MUL_module_io_dIn_G_1),
    .io_dIn_G_2(MUL_module_io_dIn_G_2),
    .io_dIn_G_3(MUL_module_io_dIn_G_3),
    .io_dOut_0(MUL_module_io_dOut_0),
    .io_dOut_1(MUL_module_io_dOut_1),
    .io_dOut_2(MUL_module_io_dOut_2),
    .io_dOut_3(MUL_module_io_dOut_3),
    .io_out_valid(MUL_module_io_out_valid)
  );
  AT_module AT_module ( // @[Winograd.scala 515:22:@1465.4]
    .clock(AT_module_clock),
    .reset(AT_module_reset),
    .io_mac_in_valid(AT_module_io_mac_in_valid),
    .io_dIn_0(AT_module_io_dIn_0),
    .io_dIn_1(AT_module_io_dIn_1),
    .io_dIn_2(AT_module_io_dIn_2),
    .io_dIn_3(AT_module_io_dIn_3),
    .io_dOut_0(AT_module_io_dOut_0),
    .io_dOut_1(AT_module_io_dOut_1),
    .io_dOut_2(AT_module_io_dOut_2),
    .io_dOut_3(AT_module_io_dOut_3),
    .io_out_valid(AT_module_io_out_valid)
  );
  AT_module AT_module_1 ( // @[Winograd.scala 515:22:@1473.4]
    .clock(AT_module_1_clock),
    .reset(AT_module_1_reset),
    .io_mac_in_valid(AT_module_1_io_mac_in_valid),
    .io_dIn_0(AT_module_1_io_dIn_0),
    .io_dIn_1(AT_module_1_io_dIn_1),
    .io_dIn_2(AT_module_1_io_dIn_2),
    .io_dIn_3(AT_module_1_io_dIn_3),
    .io_dOut_0(AT_module_1_io_dOut_0),
    .io_dOut_1(AT_module_1_io_dOut_1),
    .io_dOut_2(AT_module_1_io_dOut_2),
    .io_dOut_3(AT_module_1_io_dOut_3),
    .io_out_valid(AT_module_1_io_out_valid)
  );
  assign _T_53 = $signed(AT_module_1_io_dOut_3) == $signed(22'sh0); // @[Winograd.scala 562:29:@1487.4]
  assign io_dOut = _T_53 ? $signed(out) : $signed(AT_module_1_io_dOut_3); // @[Winograd.scala 562:10:@1489.4]
  assign io_out_valid = AT_module_1_io_out_valid; // @[Winograd.scala 560:15:@1481.4]
  assign BT_module_clock = clock; // @[:@1438.4]
  assign BT_module_reset = reset; // @[:@1439.4]
  assign BT_module_io_mac_in_valid = io_mac_in_valid; // @[Winograd.scala 259:25:@1440.4]
  assign BT_module_io_dIn_0 = io_dIn_0; // @[Winograd.scala 261:22:@1441.4]
  assign BT_module_io_dIn_1 = io_dIn_1; // @[Winograd.scala 261:22:@1442.4]
  assign BT_module_io_dIn_2 = io_dIn_2; // @[Winograd.scala 261:22:@1443.4]
  assign BT_module_io_dIn_3 = io_dIn_3; // @[Winograd.scala 261:22:@1444.4]
  assign B_module_clock = clock; // @[:@1446.4]
  assign B_module_reset = reset; // @[:@1447.4]
  assign B_module_io_mac_in_valid = BT_module_io_out_valid; // @[Winograd.scala 135:25:@1448.4]
  assign B_module_io_dIn_0 = BT_module_io_dOut_0; // @[Winograd.scala 137:22:@1449.4]
  assign B_module_io_dIn_1 = BT_module_io_dOut_1; // @[Winograd.scala 137:22:@1450.4]
  assign B_module_io_dIn_2 = BT_module_io_dOut_2; // @[Winograd.scala 137:22:@1451.4]
  assign B_module_io_dIn_3 = BT_module_io_dOut_3; // @[Winograd.scala 137:22:@1452.4]
  assign MUL_module_clock = clock; // @[:@1454.4]
  assign MUL_module_io_mac_in_valid = B_module_io_out_valid; // @[Winograd.scala 392:25:@1456.4]
  assign MUL_module_io_dIn_B_0 = B_module_io_dOut_0; // @[Winograd.scala 394:24:@1457.4]
  assign MUL_module_io_dIn_B_1 = B_module_io_dOut_1; // @[Winograd.scala 394:24:@1459.4]
  assign MUL_module_io_dIn_B_2 = B_module_io_dOut_2; // @[Winograd.scala 394:24:@1461.4]
  assign MUL_module_io_dIn_B_3 = B_module_io_dOut_3; // @[Winograd.scala 394:24:@1463.4]
  assign MUL_module_io_dIn_G_0 = io_dIn_G_0; // @[Winograd.scala 395:24:@1458.4]
  assign MUL_module_io_dIn_G_1 = io_dIn_G_1; // @[Winograd.scala 395:24:@1460.4]
  assign MUL_module_io_dIn_G_2 = io_dIn_G_2; // @[Winograd.scala 395:24:@1462.4]
  assign MUL_module_io_dIn_G_3 = io_dIn_G_3; // @[Winograd.scala 395:24:@1464.4]
  assign AT_module_clock = clock; // @[:@1466.4]
  assign AT_module_reset = reset; // @[:@1467.4]
  assign AT_module_io_mac_in_valid = MUL_module_io_out_valid; // @[Winograd.scala 516:25:@1468.4]
  assign AT_module_io_dIn_0 = MUL_module_io_dOut_0; // @[Winograd.scala 518:22:@1469.4]
  assign AT_module_io_dIn_1 = MUL_module_io_dOut_1; // @[Winograd.scala 518:22:@1470.4]
  assign AT_module_io_dIn_2 = MUL_module_io_dOut_2; // @[Winograd.scala 518:22:@1471.4]
  assign AT_module_io_dIn_3 = MUL_module_io_dOut_3; // @[Winograd.scala 518:22:@1472.4]
  assign AT_module_1_clock = clock; // @[:@1474.4]
  assign AT_module_1_reset = reset; // @[:@1475.4]
  assign AT_module_1_io_mac_in_valid = AT_module_io_out_valid; // @[Winograd.scala 516:25:@1476.4]
  assign _GEN_1 = AT_module_io_dOut_0[19:0]; // @[Winograd.scala 518:22:@1477.4]
  assign AT_module_1_io_dIn_0 = $signed(_GEN_1); // @[Winograd.scala 518:22:@1477.4]
  assign _GEN_2 = AT_module_io_dOut_1[19:0]; // @[Winograd.scala 518:22:@1478.4]
  assign AT_module_1_io_dIn_1 = $signed(_GEN_2); // @[Winograd.scala 518:22:@1478.4]
  assign _GEN_3 = AT_module_io_dOut_2[19:0]; // @[Winograd.scala 518:22:@1479.4]
  assign AT_module_1_io_dIn_2 = $signed(_GEN_3); // @[Winograd.scala 518:22:@1479.4]
  assign _GEN_4 = AT_module_io_dOut_3[19:0]; // @[Winograd.scala 518:22:@1480.4]
  assign AT_module_1_io_dIn_3 = $signed(_GEN_4); // @[Winograd.scala 518:22:@1480.4]
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
  out = _RAND_0[21:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  _T_51 = _RAND_1[21:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      out <= 22'sh0;
    end else begin
      out <= _T_51;
    end
    _T_51 <= AT_module_1_io_dOut_2;
  end
endmodule
