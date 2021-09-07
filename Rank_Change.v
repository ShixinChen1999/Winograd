module Rank_Change( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input         io_input_valid, // @[:@6.4]
  input  [15:0] io_dIn_0, // @[:@6.4]
  input  [15:0] io_dIn_1, // @[:@6.4]
  input  [15:0] io_dIn_2, // @[:@6.4]
  input  [15:0] io_dIn_3, // @[:@6.4]
  input  [15:0] io_dIn_4, // @[:@6.4]
  input  [15:0] io_dIn_5, // @[:@6.4]
  output [15:0] io_dOut_0, // @[:@6.4]
  output [15:0] io_dOut_1, // @[:@6.4]
  output [15:0] io_dOut_2, // @[:@6.4]
  output [15:0] io_dOut_3 // @[:@6.4]
);
  reg [6:0] value; // @[Counter.scala 26:33:@13.4]
  reg [31:0] _RAND_0;
  wire  _T_63; // @[Counter.scala 34:24:@15.6]
  wire [7:0] _T_65; // @[Counter.scala 35:22:@16.6]
  wire [6:0] _T_66; // @[Counter.scala 35:22:@17.6]
  wire [6:0] _GEN_0; // @[Counter.scala 37:21:@19.6]
  wire [6:0] _GEN_1; // @[Counter.scala 63:17:@14.4]
  wire [7:0] _T_69; // @[Rank_Chang.scala 18:18:@24.4]
  wire [7:0] _T_70; // @[Rank_Chang.scala 18:18:@25.4]
  wire [6:0] cnt_out; // @[Rank_Chang.scala 18:18:@26.4]
  wire [6:0] _GEN_6; // @[Rank_Chang.scala 20:17:@28.6]
  wire [1:0] _T_72; // @[Rank_Chang.scala 20:17:@28.6]
  wire  _T_74; // @[Rank_Chang.scala 20:21:@29.6]
  wire [6:0] _T_76; // @[Rank_Chang.scala 21:20:@31.8]
  wire [6:0] _GEN_7; // @[Rank_Chang.scala 21:32:@32.8]
  wire [2:0] _T_78; // @[Rank_Chang.scala 21:32:@32.8]
  wire  _T_80; // @[Rank_Chang.scala 21:36:@33.8]
  wire  _T_86; // @[Rank_Chang.scala 21:68:@36.8]
  wire  _T_87; // @[Rank_Chang.scala 21:42:@37.8]
  wire [6:0] _GEN_10; // @[Rank_Chang.scala 22:23:@39.10]
  wire [2:0] _T_89; // @[Rank_Chang.scala 22:23:@39.10]
  wire  _T_91; // @[Rank_Chang.scala 22:27:@40.10]
  wire [15:0] _GEN_2; // @[Rank_Chang.scala 22:34:@41.10]
  wire [15:0] _GEN_3; // @[Rank_Chang.scala 22:34:@41.10]
  wire [15:0] _GEN_4; // @[Rank_Chang.scala 22:34:@41.10]
  wire [15:0] _GEN_5; // @[Rank_Chang.scala 22:34:@41.10]
  wire  _T_97; // @[Rank_Chang.scala 33:42:@57.10]
  wire  _T_103; // @[Rank_Chang.scala 33:74:@60.10]
  wire  _T_104; // @[Rank_Chang.scala 33:48:@61.10]
  wire [15:0] _GEN_8; // @[Rank_Chang.scala 34:34:@65.12]
  wire [15:0] _GEN_9; // @[Rank_Chang.scala 34:34:@65.12]
  wire  _T_114; // @[Rank_Chang.scala 45:42:@81.12]
  wire  _T_120; // @[Rank_Chang.scala 45:74:@84.12]
  wire  _T_121; // @[Rank_Chang.scala 45:48:@85.12]
  wire [15:0] _GEN_14; // @[Rank_Chang.scala 45:81:@86.12]
  wire [15:0] _GEN_15; // @[Rank_Chang.scala 45:81:@86.12]
  wire [15:0] _GEN_16; // @[Rank_Chang.scala 45:81:@86.12]
  wire [15:0] _GEN_17; // @[Rank_Chang.scala 45:81:@86.12]
  wire [15:0] _GEN_18; // @[Rank_Chang.scala 33:81:@62.10]
  wire [15:0] _GEN_19; // @[Rank_Chang.scala 33:81:@62.10]
  wire [15:0] _GEN_20; // @[Rank_Chang.scala 33:81:@62.10]
  wire [15:0] _GEN_21; // @[Rank_Chang.scala 33:81:@62.10]
  wire [15:0] _GEN_22; // @[Rank_Chang.scala 21:75:@38.8]
  wire [15:0] _GEN_23; // @[Rank_Chang.scala 21:75:@38.8]
  wire [15:0] _GEN_24; // @[Rank_Chang.scala 21:75:@38.8]
  wire [15:0] _GEN_25; // @[Rank_Chang.scala 21:75:@38.8]
  reg [15:0] _T_127; // @[Rank_Chang.scala 61:29:@104.8]
  reg [31:0] _RAND_1;
  reg [15:0] _T_129; // @[Rank_Chang.scala 61:29:@107.8]
  reg [31:0] _RAND_2;
  reg [15:0] _T_131; // @[Rank_Chang.scala 61:29:@110.8]
  reg [31:0] _RAND_3;
  reg [15:0] _T_133; // @[Rank_Chang.scala 61:29:@113.8]
  reg [31:0] _RAND_4;
  wire [15:0] _GEN_26; // @[Rank_Chang.scala 20:28:@30.6]
  wire [15:0] _GEN_27; // @[Rank_Chang.scala 20:28:@30.6]
  wire [15:0] _GEN_28; // @[Rank_Chang.scala 20:28:@30.6]
  wire [15:0] _GEN_29; // @[Rank_Chang.scala 20:28:@30.6]
  wire [15:0] out_temp_0; // @[Rank_Chang.scala 19:23:@27.4]
  wire [15:0] out_temp_1; // @[Rank_Chang.scala 19:23:@27.4]
  wire [15:0] out_temp_2; // @[Rank_Chang.scala 19:23:@27.4]
  wire [15:0] out_temp_3; // @[Rank_Chang.scala 19:23:@27.4]
  reg  _T_542; // @[Reg.scala 11:16:@148.4]
  reg [31:0] _RAND_5;
  reg  out_valid; // @[Reg.scala 11:16:@152.4]
  reg [31:0] _RAND_6;
  reg [6:0] value_2; // @[Counter.scala 26:33:@404.4]
  reg [31:0] _RAND_7;
  wire  _T_1541; // @[Counter.scala 34:24:@406.6]
  wire [7:0] _T_1543; // @[Counter.scala 35:22:@407.6]
  wire [6:0] _T_1544; // @[Counter.scala 35:22:@408.6]
  wire [6:0] _GEN_462; // @[Counter.scala 37:21:@410.6]
  wire [6:0] _GEN_463; // @[Counter.scala 63:17:@405.4]
  wire [6:0] cnt_en; // @[Rank_Chang.scala 112:19:@415.4]
  wire [6:0] _GEN_11; // @[Rank_Chang.scala 123:16:@417.6]
  wire [1:0] _T_1548; // @[Rank_Chang.scala 123:16:@417.6]
  wire  _T_1550; // @[Rank_Chang.scala 123:20:@418.6]
  wire  _T_1554; // @[Rank_Chang.scala 129:26:@431.8]
  wire [15:0] _GEN_464; // @[Rank_Chang.scala 129:33:@432.8]
  wire [15:0] _GEN_480; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] reg_4_0; // @[Rank_Chang.scala 113:18:@416.4]
  wire [15:0] _GEN_465; // @[Rank_Chang.scala 129:33:@432.8]
  wire [15:0] _GEN_466; // @[Rank_Chang.scala 129:33:@432.8]
  wire [15:0] _GEN_482; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] reg_4_1; // @[Rank_Chang.scala 113:18:@416.4]
  wire [15:0] _GEN_467; // @[Rank_Chang.scala 129:33:@432.8]
  wire [15:0] _GEN_468; // @[Rank_Chang.scala 129:33:@432.8]
  wire [15:0] _GEN_484; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] reg_4_2; // @[Rank_Chang.scala 113:18:@416.4]
  wire [15:0] _GEN_469; // @[Rank_Chang.scala 129:33:@432.8]
  wire [15:0] _GEN_470; // @[Rank_Chang.scala 129:33:@432.8]
  wire [15:0] _GEN_486; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] reg_4_3; // @[Rank_Chang.scala 113:18:@416.4]
  wire [15:0] _GEN_471; // @[Rank_Chang.scala 129:33:@432.8]
  wire [15:0] _GEN_472; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] reg_3_0; // @[Rank_Chang.scala 113:18:@416.4]
  wire [15:0] _GEN_473; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] _GEN_474; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] reg_3_1; // @[Rank_Chang.scala 113:18:@416.4]
  wire [15:0] _GEN_475; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] _GEN_476; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] reg_3_2; // @[Rank_Chang.scala 113:18:@416.4]
  wire [15:0] _GEN_477; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] _GEN_478; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] reg_3_3; // @[Rank_Chang.scala 113:18:@416.4]
  wire [15:0] _GEN_479; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] _GEN_481; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] _GEN_483; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] _GEN_485; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] _GEN_487; // @[Rank_Chang.scala 123:27:@419.6]
  wire [15:0] reg_1_0; // @[Rank_Chang.scala 113:18:@416.4]
  wire [15:0] reg_1_1; // @[Rank_Chang.scala 113:18:@416.4]
  wire [15:0] reg_1_2; // @[Rank_Chang.scala 113:18:@416.4]
  wire [15:0] reg_1_3; // @[Rank_Chang.scala 113:18:@416.4]
  reg  _T_1557; // @[Reg.scala 11:16:@443.4]
  reg [31:0] _RAND_8;
  reg  _T_1559; // @[Reg.scala 11:16:@447.4]
  reg [31:0] _RAND_9;
  reg [15:0] _T_1566; // @[Reg.scala 11:16:@456.8]
  reg [31:0] _RAND_10;
  reg [15:0] _T_1568; // @[Reg.scala 11:16:@460.8]
  reg [31:0] _RAND_11;
  reg [15:0] _T_1571; // @[Reg.scala 11:16:@467.8]
  reg [31:0] _RAND_12;
  reg [15:0] _T_1573; // @[Reg.scala 11:16:@471.8]
  reg [31:0] _RAND_13;
  wire [15:0] _GEN_510; // @[Rank_Chang.scala 139:29:@454.6]
  wire [15:0] _GEN_511; // @[Rank_Chang.scala 139:29:@454.6]
  reg [15:0] _T_1580; // @[Reg.scala 11:16:@482.8]
  reg [31:0] _RAND_14;
  reg [15:0] _T_1582; // @[Reg.scala 11:16:@486.8]
  reg [31:0] _RAND_15;
  reg [15:0] _T_1585; // @[Reg.scala 11:16:@493.8]
  reg [31:0] _RAND_16;
  reg [15:0] _T_1587; // @[Reg.scala 11:16:@497.8]
  reg [31:0] _RAND_17;
  wire [15:0] _GEN_516; // @[Rank_Chang.scala 139:29:@480.6]
  wire [15:0] _GEN_517; // @[Rank_Chang.scala 139:29:@480.6]
  reg [15:0] _T_1594; // @[Reg.scala 11:16:@508.8]
  reg [31:0] _RAND_18;
  reg [15:0] _T_1596; // @[Reg.scala 11:16:@512.8]
  reg [31:0] _RAND_19;
  reg [15:0] _T_1599; // @[Reg.scala 11:16:@519.8]
  reg [31:0] _RAND_20;
  reg [15:0] _T_1601; // @[Reg.scala 11:16:@523.8]
  reg [31:0] _RAND_21;
  wire [15:0] _GEN_522; // @[Rank_Chang.scala 139:29:@506.6]
  wire [15:0] _GEN_523; // @[Rank_Chang.scala 139:29:@506.6]
  reg [15:0] _T_1608; // @[Reg.scala 11:16:@534.8]
  reg [31:0] _RAND_22;
  reg [15:0] _T_1610; // @[Reg.scala 11:16:@538.8]
  reg [31:0] _RAND_23;
  reg [15:0] _T_1613; // @[Reg.scala 11:16:@545.8]
  reg [31:0] _RAND_24;
  reg [15:0] _T_1615; // @[Reg.scala 11:16:@549.8]
  reg [31:0] _RAND_25;
  wire [15:0] _GEN_528; // @[Rank_Chang.scala 139:29:@532.6]
  wire [15:0] _GEN_529; // @[Rank_Chang.scala 139:29:@532.6]
  wire [15:0] reg_end_0; // @[Rank_Chang.scala 137:35:@451.4]
  wire [15:0] reg_end_4; // @[Rank_Chang.scala 137:35:@451.4]
  wire [15:0] reg_end_1; // @[Rank_Chang.scala 137:35:@451.4]
  wire [15:0] reg_end_5; // @[Rank_Chang.scala 137:35:@451.4]
  wire [15:0] reg_end_2; // @[Rank_Chang.scala 137:35:@451.4]
  wire [15:0] reg_end_6; // @[Rank_Chang.scala 137:35:@451.4]
  wire [15:0] reg_end_3; // @[Rank_Chang.scala 137:35:@451.4]
  wire [15:0] reg_end_7; // @[Rank_Chang.scala 137:35:@451.4]
  wire [6:0] _GEN_12; // @[Rank_Chang.scala 159:15:@567.4]
  wire [1:0] _T_1625; // @[Rank_Chang.scala 159:15:@567.4]
  wire  _T_1627; // @[Rank_Chang.scala 159:19:@568.4]
  assign _T_63 = value == 7'h5f; // @[Counter.scala 34:24:@15.6]
  assign _T_65 = value + 7'h1; // @[Counter.scala 35:22:@16.6]
  assign _T_66 = _T_65[6:0]; // @[Counter.scala 35:22:@17.6]
  assign _GEN_0 = _T_63 ? 7'h0 : _T_66; // @[Counter.scala 37:21:@19.6]
  assign _GEN_1 = io_input_valid ? _GEN_0 : value; // @[Counter.scala 63:17:@14.4]
  assign _T_69 = value - 7'h2; // @[Rank_Chang.scala 18:18:@24.4]
  assign _T_70 = $unsigned(_T_69); // @[Rank_Chang.scala 18:18:@25.4]
  assign cnt_out = _T_70[6:0]; // @[Rank_Chang.scala 18:18:@26.4]
  assign _GEN_6 = cnt_out % 7'h2; // @[Rank_Chang.scala 20:17:@28.6]
  assign _T_72 = _GEN_6[1:0]; // @[Rank_Chang.scala 20:17:@28.6]
  assign _T_74 = _T_72 == 2'h0; // @[Rank_Chang.scala 20:21:@29.6]
  assign _T_76 = cnt_out / 7'h8; // @[Rank_Chang.scala 21:20:@31.8]
  assign _GEN_7 = _T_76 % 7'h6; // @[Rank_Chang.scala 21:32:@32.8]
  assign _T_78 = _GEN_7[2:0]; // @[Rank_Chang.scala 21:32:@32.8]
  assign _T_80 = _T_78 == 3'h0; // @[Rank_Chang.scala 21:36:@33.8]
  assign _T_86 = _T_78 == 3'h1; // @[Rank_Chang.scala 21:68:@36.8]
  assign _T_87 = _T_80 | _T_86; // @[Rank_Chang.scala 21:42:@37.8]
  assign _GEN_10 = cnt_out % 7'h4; // @[Rank_Chang.scala 22:23:@39.10]
  assign _T_89 = _GEN_10[2:0]; // @[Rank_Chang.scala 22:23:@39.10]
  assign _T_91 = _T_89 == 3'h0; // @[Rank_Chang.scala 22:27:@40.10]
  assign _GEN_2 = _T_91 ? io_dIn_0 : io_dIn_1; // @[Rank_Chang.scala 22:34:@41.10]
  assign _GEN_3 = _T_91 ? io_dIn_1 : io_dIn_0; // @[Rank_Chang.scala 22:34:@41.10]
  assign _GEN_4 = _T_91 ? io_dIn_2 : io_dIn_3; // @[Rank_Chang.scala 22:34:@41.10]
  assign _GEN_5 = _T_91 ? io_dIn_3 : io_dIn_2; // @[Rank_Chang.scala 22:34:@41.10]
  assign _T_97 = _T_78 == 3'h2; // @[Rank_Chang.scala 33:42:@57.10]
  assign _T_103 = _T_78 == 3'h3; // @[Rank_Chang.scala 33:74:@60.10]
  assign _T_104 = _T_97 | _T_103; // @[Rank_Chang.scala 33:48:@61.10]
  assign _GEN_8 = _T_91 ? io_dIn_4 : io_dIn_5; // @[Rank_Chang.scala 34:34:@65.12]
  assign _GEN_9 = _T_91 ? io_dIn_5 : io_dIn_4; // @[Rank_Chang.scala 34:34:@65.12]
  assign _T_114 = _T_78 == 3'h4; // @[Rank_Chang.scala 45:42:@81.12]
  assign _T_120 = _T_78 == 3'h5; // @[Rank_Chang.scala 45:74:@84.12]
  assign _T_121 = _T_114 | _T_120; // @[Rank_Chang.scala 45:48:@85.12]
  assign _GEN_14 = _T_121 ? _GEN_8 : 16'h0; // @[Rank_Chang.scala 45:81:@86.12]
  assign _GEN_15 = _T_121 ? _GEN_9 : 16'h0; // @[Rank_Chang.scala 45:81:@86.12]
  assign _GEN_16 = _T_121 ? _GEN_2 : 16'h0; // @[Rank_Chang.scala 45:81:@86.12]
  assign _GEN_17 = _T_121 ? _GEN_3 : 16'h0; // @[Rank_Chang.scala 45:81:@86.12]
  assign _GEN_18 = _T_104 ? _GEN_4 : _GEN_14; // @[Rank_Chang.scala 33:81:@62.10]
  assign _GEN_19 = _T_104 ? _GEN_5 : _GEN_15; // @[Rank_Chang.scala 33:81:@62.10]
  assign _GEN_20 = _T_104 ? _GEN_8 : _GEN_16; // @[Rank_Chang.scala 33:81:@62.10]
  assign _GEN_21 = _T_104 ? _GEN_9 : _GEN_17; // @[Rank_Chang.scala 33:81:@62.10]
  assign _GEN_22 = _T_87 ? _GEN_2 : _GEN_18; // @[Rank_Chang.scala 21:75:@38.8]
  assign _GEN_23 = _T_87 ? _GEN_3 : _GEN_19; // @[Rank_Chang.scala 21:75:@38.8]
  assign _GEN_24 = _T_87 ? _GEN_4 : _GEN_20; // @[Rank_Chang.scala 21:75:@38.8]
  assign _GEN_25 = _T_87 ? _GEN_5 : _GEN_21; // @[Rank_Chang.scala 21:75:@38.8]
  assign _GEN_26 = _T_74 ? _GEN_22 : _T_127; // @[Rank_Chang.scala 20:28:@30.6]
  assign _GEN_27 = _T_74 ? _GEN_23 : _T_129; // @[Rank_Chang.scala 20:28:@30.6]
  assign _GEN_28 = _T_74 ? _GEN_24 : _T_131; // @[Rank_Chang.scala 20:28:@30.6]
  assign _GEN_29 = _T_74 ? _GEN_25 : _T_133; // @[Rank_Chang.scala 20:28:@30.6]
  assign out_temp_0 = io_input_valid ? _GEN_26 : 16'h0; // @[Rank_Chang.scala 19:23:@27.4]
  assign out_temp_1 = io_input_valid ? _GEN_27 : 16'h0; // @[Rank_Chang.scala 19:23:@27.4]
  assign out_temp_2 = io_input_valid ? _GEN_28 : 16'h0; // @[Rank_Chang.scala 19:23:@27.4]
  assign out_temp_3 = io_input_valid ? _GEN_29 : 16'h0; // @[Rank_Chang.scala 19:23:@27.4]
  assign _T_1541 = value_2 == 7'h5f; // @[Counter.scala 34:24:@406.6]
  assign _T_1543 = value_2 + 7'h1; // @[Counter.scala 35:22:@407.6]
  assign _T_1544 = _T_1543[6:0]; // @[Counter.scala 35:22:@408.6]
  assign _GEN_462 = _T_1541 ? 7'h0 : _T_1544; // @[Counter.scala 37:21:@410.6]
  assign _GEN_463 = out_valid ? _GEN_462 : value_2; // @[Counter.scala 63:17:@405.4]
  assign cnt_en = value_2 / 7'h2; // @[Rank_Chang.scala 112:19:@415.4]
  assign _GEN_11 = cnt_en % 7'h2; // @[Rank_Chang.scala 123:16:@417.6]
  assign _T_1548 = _GEN_11[1:0]; // @[Rank_Chang.scala 123:16:@417.6]
  assign _T_1550 = _T_1548 == 2'h0; // @[Rank_Chang.scala 123:20:@418.6]
  assign _T_1554 = _T_1548 == 2'h1; // @[Rank_Chang.scala 129:26:@431.8]
  assign _GEN_464 = _T_1554 ? out_temp_0 : 16'h0; // @[Rank_Chang.scala 129:33:@432.8]
  assign _GEN_480 = _T_1550 ? 16'h0 : _GEN_464; // @[Rank_Chang.scala 123:27:@419.6]
  assign reg_4_0 = out_valid ? _GEN_480 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign _GEN_465 = _T_1554 ? reg_4_0 : 16'h0; // @[Rank_Chang.scala 129:33:@432.8]
  assign _GEN_466 = _T_1554 ? out_temp_1 : 16'h0; // @[Rank_Chang.scala 129:33:@432.8]
  assign _GEN_482 = _T_1550 ? 16'h0 : _GEN_466; // @[Rank_Chang.scala 123:27:@419.6]
  assign reg_4_1 = out_valid ? _GEN_482 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign _GEN_467 = _T_1554 ? reg_4_1 : 16'h0; // @[Rank_Chang.scala 129:33:@432.8]
  assign _GEN_468 = _T_1554 ? out_temp_2 : 16'h0; // @[Rank_Chang.scala 129:33:@432.8]
  assign _GEN_484 = _T_1550 ? 16'h0 : _GEN_468; // @[Rank_Chang.scala 123:27:@419.6]
  assign reg_4_2 = out_valid ? _GEN_484 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign _GEN_469 = _T_1554 ? reg_4_2 : 16'h0; // @[Rank_Chang.scala 129:33:@432.8]
  assign _GEN_470 = _T_1554 ? out_temp_3 : 16'h0; // @[Rank_Chang.scala 129:33:@432.8]
  assign _GEN_486 = _T_1550 ? 16'h0 : _GEN_470; // @[Rank_Chang.scala 123:27:@419.6]
  assign reg_4_3 = out_valid ? _GEN_486 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign _GEN_471 = _T_1554 ? reg_4_3 : 16'h0; // @[Rank_Chang.scala 129:33:@432.8]
  assign _GEN_472 = _T_1550 ? out_temp_0 : 16'h0; // @[Rank_Chang.scala 123:27:@419.6]
  assign reg_3_0 = out_valid ? _GEN_472 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign _GEN_473 = _T_1550 ? reg_3_0 : 16'h0; // @[Rank_Chang.scala 123:27:@419.6]
  assign _GEN_474 = _T_1550 ? out_temp_1 : 16'h0; // @[Rank_Chang.scala 123:27:@419.6]
  assign reg_3_1 = out_valid ? _GEN_474 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign _GEN_475 = _T_1550 ? reg_3_1 : 16'h0; // @[Rank_Chang.scala 123:27:@419.6]
  assign _GEN_476 = _T_1550 ? out_temp_2 : 16'h0; // @[Rank_Chang.scala 123:27:@419.6]
  assign reg_3_2 = out_valid ? _GEN_476 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign _GEN_477 = _T_1550 ? reg_3_2 : 16'h0; // @[Rank_Chang.scala 123:27:@419.6]
  assign _GEN_478 = _T_1550 ? out_temp_3 : 16'h0; // @[Rank_Chang.scala 123:27:@419.6]
  assign reg_3_3 = out_valid ? _GEN_478 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign _GEN_479 = _T_1550 ? reg_3_3 : 16'h0; // @[Rank_Chang.scala 123:27:@419.6]
  assign _GEN_481 = _T_1550 ? 16'h0 : _GEN_465; // @[Rank_Chang.scala 123:27:@419.6]
  assign _GEN_483 = _T_1550 ? 16'h0 : _GEN_467; // @[Rank_Chang.scala 123:27:@419.6]
  assign _GEN_485 = _T_1550 ? 16'h0 : _GEN_469; // @[Rank_Chang.scala 123:27:@419.6]
  assign _GEN_487 = _T_1550 ? 16'h0 : _GEN_471; // @[Rank_Chang.scala 123:27:@419.6]
  assign reg_1_0 = out_valid ? _GEN_473 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign reg_1_1 = out_valid ? _GEN_475 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign reg_1_2 = out_valid ? _GEN_477 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign reg_1_3 = out_valid ? _GEN_479 : 16'h0; // @[Rank_Chang.scala 113:18:@416.4]
  assign _GEN_510 = _T_1550 ? reg_1_0 : _T_1573; // @[Rank_Chang.scala 139:29:@454.6]
  assign _GEN_511 = _T_1550 ? _T_1568 : reg_4_0; // @[Rank_Chang.scala 139:29:@454.6]
  assign _GEN_516 = _T_1550 ? reg_1_1 : _T_1587; // @[Rank_Chang.scala 139:29:@480.6]
  assign _GEN_517 = _T_1550 ? _T_1582 : reg_4_1; // @[Rank_Chang.scala 139:29:@480.6]
  assign _GEN_522 = _T_1550 ? reg_1_2 : _T_1601; // @[Rank_Chang.scala 139:29:@506.6]
  assign _GEN_523 = _T_1550 ? _T_1596 : reg_4_2; // @[Rank_Chang.scala 139:29:@506.6]
  assign _GEN_528 = _T_1550 ? reg_1_3 : _T_1615; // @[Rank_Chang.scala 139:29:@532.6]
  assign _GEN_529 = _T_1550 ? _T_1610 : reg_4_3; // @[Rank_Chang.scala 139:29:@532.6]
  assign reg_end_0 = _T_1559 ? _GEN_510 : 16'h0; // @[Rank_Chang.scala 137:35:@451.4]
  assign reg_end_4 = _T_1559 ? _GEN_511 : 16'h0; // @[Rank_Chang.scala 137:35:@451.4]
  assign reg_end_1 = _T_1559 ? _GEN_516 : 16'h0; // @[Rank_Chang.scala 137:35:@451.4]
  assign reg_end_5 = _T_1559 ? _GEN_517 : 16'h0; // @[Rank_Chang.scala 137:35:@451.4]
  assign reg_end_2 = _T_1559 ? _GEN_522 : 16'h0; // @[Rank_Chang.scala 137:35:@451.4]
  assign reg_end_6 = _T_1559 ? _GEN_523 : 16'h0; // @[Rank_Chang.scala 137:35:@451.4]
  assign reg_end_3 = _T_1559 ? _GEN_528 : 16'h0; // @[Rank_Chang.scala 137:35:@451.4]
  assign reg_end_7 = _T_1559 ? _GEN_529 : 16'h0; // @[Rank_Chang.scala 137:35:@451.4]
  assign _GEN_12 = value_2 % 7'h2; // @[Rank_Chang.scala 159:15:@567.4]
  assign _T_1625 = _GEN_12[1:0]; // @[Rank_Chang.scala 159:15:@567.4]
  assign _T_1627 = _T_1625 == 2'h0; // @[Rank_Chang.scala 159:19:@568.4]
  assign io_dOut_0 = _T_1627 ? reg_end_4 : reg_end_0; // @[Rank_Chang.scala 161:19:@570.6 Rank_Chang.scala 165:19:@576.6]
  assign io_dOut_1 = _T_1627 ? reg_end_5 : reg_end_1; // @[Rank_Chang.scala 161:19:@571.6 Rank_Chang.scala 165:19:@577.6]
  assign io_dOut_2 = _T_1627 ? reg_end_6 : reg_end_2; // @[Rank_Chang.scala 161:19:@572.6 Rank_Chang.scala 165:19:@578.6]
  assign io_dOut_3 = _T_1627 ? reg_end_7 : reg_end_3; // @[Rank_Chang.scala 161:19:@573.6 Rank_Chang.scala 165:19:@579.6]
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
  value = _RAND_0[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  _T_127 = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_129 = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  _T_131 = _RAND_3[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  _T_133 = _RAND_4[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  _T_542 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  out_valid = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  value_2 = _RAND_7[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  _T_1557 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  _T_1559 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  _T_1566 = _RAND_10[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  _T_1568 = _RAND_11[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  _T_1571 = _RAND_12[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  _T_1573 = _RAND_13[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  _T_1580 = _RAND_14[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  _T_1582 = _RAND_15[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  _T_1585 = _RAND_16[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  _T_1587 = _RAND_17[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  _T_1594 = _RAND_18[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  _T_1596 = _RAND_19[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  _T_1599 = _RAND_20[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  _T_1601 = _RAND_21[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  _T_1608 = _RAND_22[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{$random}};
  _T_1610 = _RAND_23[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{$random}};
  _T_1613 = _RAND_24[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{$random}};
  _T_1615 = _RAND_25[15:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 7'h0;
    end else begin
      if (io_input_valid) begin
        if (_T_63) begin
          value <= 7'h0;
        end else begin
          value <= _T_66;
        end
      end
    end
    if (io_input_valid) begin
      if (_T_74) begin
        if (_T_87) begin
          if (_T_91) begin
            _T_127 <= io_dIn_0;
          end else begin
            _T_127 <= io_dIn_1;
          end
        end else begin
          if (_T_104) begin
            if (_T_91) begin
              _T_127 <= io_dIn_2;
            end else begin
              _T_127 <= io_dIn_3;
            end
          end else begin
            if (_T_121) begin
              if (_T_91) begin
                _T_127 <= io_dIn_4;
              end else begin
                _T_127 <= io_dIn_5;
              end
            end else begin
              _T_127 <= 16'h0;
            end
          end
        end
      end
    end else begin
      _T_127 <= 16'h0;
    end
    if (io_input_valid) begin
      if (_T_74) begin
        if (_T_87) begin
          if (_T_91) begin
            _T_129 <= io_dIn_1;
          end else begin
            _T_129 <= io_dIn_0;
          end
        end else begin
          if (_T_104) begin
            if (_T_91) begin
              _T_129 <= io_dIn_3;
            end else begin
              _T_129 <= io_dIn_2;
            end
          end else begin
            if (_T_121) begin
              if (_T_91) begin
                _T_129 <= io_dIn_5;
              end else begin
                _T_129 <= io_dIn_4;
              end
            end else begin
              _T_129 <= 16'h0;
            end
          end
        end
      end
    end else begin
      _T_129 <= 16'h0;
    end
    if (io_input_valid) begin
      if (_T_74) begin
        if (_T_87) begin
          if (_T_91) begin
            _T_131 <= io_dIn_2;
          end else begin
            _T_131 <= io_dIn_3;
          end
        end else begin
          if (_T_104) begin
            if (_T_91) begin
              _T_131 <= io_dIn_4;
            end else begin
              _T_131 <= io_dIn_5;
            end
          end else begin
            if (_T_121) begin
              if (_T_91) begin
                _T_131 <= io_dIn_0;
              end else begin
                _T_131 <= io_dIn_1;
              end
            end else begin
              _T_131 <= 16'h0;
            end
          end
        end
      end
    end else begin
      _T_131 <= 16'h0;
    end
    if (io_input_valid) begin
      if (_T_74) begin
        if (_T_87) begin
          if (_T_91) begin
            _T_133 <= io_dIn_3;
          end else begin
            _T_133 <= io_dIn_2;
          end
        end else begin
          if (_T_104) begin
            if (_T_91) begin
              _T_133 <= io_dIn_5;
            end else begin
              _T_133 <= io_dIn_4;
            end
          end else begin
            if (_T_121) begin
              if (_T_91) begin
                _T_133 <= io_dIn_1;
              end else begin
                _T_133 <= io_dIn_0;
              end
            end else begin
              _T_133 <= 16'h0;
            end
          end
        end
      end
    end else begin
      _T_133 <= 16'h0;
    end
    _T_542 <= io_input_valid;
    out_valid <= _T_542;
    if (reset) begin
      value_2 <= 7'h0;
    end else begin
      if (out_valid) begin
        if (_T_1541) begin
          value_2 <= 7'h0;
        end else begin
          value_2 <= _T_1544;
        end
      end
    end
    _T_1557 <= out_valid;
    _T_1559 <= _T_1557;
    if (out_valid) begin
      if (_T_1550) begin
        _T_1566 <= 16'h0;
      end else begin
        if (_T_1554) begin
          if (out_valid) begin
            if (_T_1550) begin
              _T_1566 <= 16'h0;
            end else begin
              if (_T_1554) begin
                if (io_input_valid) begin
                  if (_T_74) begin
                    if (_T_87) begin
                      if (_T_91) begin
                        _T_1566 <= io_dIn_0;
                      end else begin
                        _T_1566 <= io_dIn_1;
                      end
                    end else begin
                      if (_T_104) begin
                        if (_T_91) begin
                          _T_1566 <= io_dIn_2;
                        end else begin
                          _T_1566 <= io_dIn_3;
                        end
                      end else begin
                        if (_T_121) begin
                          if (_T_91) begin
                            _T_1566 <= io_dIn_4;
                          end else begin
                            _T_1566 <= io_dIn_5;
                          end
                        end else begin
                          _T_1566 <= 16'h0;
                        end
                      end
                    end
                  end else begin
                    _T_1566 <= _T_127;
                  end
                end else begin
                  _T_1566 <= 16'h0;
                end
              end else begin
                _T_1566 <= 16'h0;
              end
            end
          end else begin
            _T_1566 <= 16'h0;
          end
        end else begin
          _T_1566 <= 16'h0;
        end
      end
    end else begin
      _T_1566 <= 16'h0;
    end
    _T_1568 <= _T_1566;
    if (out_valid) begin
      if (_T_1550) begin
        if (io_input_valid) begin
          if (_T_74) begin
            if (_T_87) begin
              if (_T_91) begin
                _T_1571 <= io_dIn_0;
              end else begin
                _T_1571 <= io_dIn_1;
              end
            end else begin
              if (_T_104) begin
                if (_T_91) begin
                  _T_1571 <= io_dIn_2;
                end else begin
                  _T_1571 <= io_dIn_3;
                end
              end else begin
                if (_T_121) begin
                  if (_T_91) begin
                    _T_1571 <= io_dIn_4;
                  end else begin
                    _T_1571 <= io_dIn_5;
                  end
                end else begin
                  _T_1571 <= 16'h0;
                end
              end
            end
          end else begin
            _T_1571 <= _T_127;
          end
        end else begin
          _T_1571 <= 16'h0;
        end
      end else begin
        _T_1571 <= 16'h0;
      end
    end else begin
      _T_1571 <= 16'h0;
    end
    _T_1573 <= _T_1571;
    if (out_valid) begin
      if (_T_1550) begin
        _T_1580 <= 16'h0;
      end else begin
        if (_T_1554) begin
          if (out_valid) begin
            if (_T_1550) begin
              _T_1580 <= 16'h0;
            end else begin
              if (_T_1554) begin
                if (io_input_valid) begin
                  if (_T_74) begin
                    if (_T_87) begin
                      if (_T_91) begin
                        _T_1580 <= io_dIn_1;
                      end else begin
                        _T_1580 <= io_dIn_0;
                      end
                    end else begin
                      if (_T_104) begin
                        if (_T_91) begin
                          _T_1580 <= io_dIn_3;
                        end else begin
                          _T_1580 <= io_dIn_2;
                        end
                      end else begin
                        if (_T_121) begin
                          if (_T_91) begin
                            _T_1580 <= io_dIn_5;
                          end else begin
                            _T_1580 <= io_dIn_4;
                          end
                        end else begin
                          _T_1580 <= 16'h0;
                        end
                      end
                    end
                  end else begin
                    _T_1580 <= _T_129;
                  end
                end else begin
                  _T_1580 <= 16'h0;
                end
              end else begin
                _T_1580 <= 16'h0;
              end
            end
          end else begin
            _T_1580 <= 16'h0;
          end
        end else begin
          _T_1580 <= 16'h0;
        end
      end
    end else begin
      _T_1580 <= 16'h0;
    end
    _T_1582 <= _T_1580;
    if (out_valid) begin
      if (_T_1550) begin
        if (io_input_valid) begin
          if (_T_74) begin
            if (_T_87) begin
              if (_T_91) begin
                _T_1585 <= io_dIn_1;
              end else begin
                _T_1585 <= io_dIn_0;
              end
            end else begin
              if (_T_104) begin
                if (_T_91) begin
                  _T_1585 <= io_dIn_3;
                end else begin
                  _T_1585 <= io_dIn_2;
                end
              end else begin
                if (_T_121) begin
                  if (_T_91) begin
                    _T_1585 <= io_dIn_5;
                  end else begin
                    _T_1585 <= io_dIn_4;
                  end
                end else begin
                  _T_1585 <= 16'h0;
                end
              end
            end
          end else begin
            _T_1585 <= _T_129;
          end
        end else begin
          _T_1585 <= 16'h0;
        end
      end else begin
        _T_1585 <= 16'h0;
      end
    end else begin
      _T_1585 <= 16'h0;
    end
    _T_1587 <= _T_1585;
    if (out_valid) begin
      if (_T_1550) begin
        _T_1594 <= 16'h0;
      end else begin
        if (_T_1554) begin
          if (out_valid) begin
            if (_T_1550) begin
              _T_1594 <= 16'h0;
            end else begin
              if (_T_1554) begin
                if (io_input_valid) begin
                  if (_T_74) begin
                    if (_T_87) begin
                      if (_T_91) begin
                        _T_1594 <= io_dIn_2;
                      end else begin
                        _T_1594 <= io_dIn_3;
                      end
                    end else begin
                      if (_T_104) begin
                        if (_T_91) begin
                          _T_1594 <= io_dIn_4;
                        end else begin
                          _T_1594 <= io_dIn_5;
                        end
                      end else begin
                        if (_T_121) begin
                          if (_T_91) begin
                            _T_1594 <= io_dIn_0;
                          end else begin
                            _T_1594 <= io_dIn_1;
                          end
                        end else begin
                          _T_1594 <= 16'h0;
                        end
                      end
                    end
                  end else begin
                    _T_1594 <= _T_131;
                  end
                end else begin
                  _T_1594 <= 16'h0;
                end
              end else begin
                _T_1594 <= 16'h0;
              end
            end
          end else begin
            _T_1594 <= 16'h0;
          end
        end else begin
          _T_1594 <= 16'h0;
        end
      end
    end else begin
      _T_1594 <= 16'h0;
    end
    _T_1596 <= _T_1594;
    if (out_valid) begin
      if (_T_1550) begin
        if (io_input_valid) begin
          if (_T_74) begin
            if (_T_87) begin
              if (_T_91) begin
                _T_1599 <= io_dIn_2;
              end else begin
                _T_1599 <= io_dIn_3;
              end
            end else begin
              if (_T_104) begin
                if (_T_91) begin
                  _T_1599 <= io_dIn_4;
                end else begin
                  _T_1599 <= io_dIn_5;
                end
              end else begin
                if (_T_121) begin
                  if (_T_91) begin
                    _T_1599 <= io_dIn_0;
                  end else begin
                    _T_1599 <= io_dIn_1;
                  end
                end else begin
                  _T_1599 <= 16'h0;
                end
              end
            end
          end else begin
            _T_1599 <= _T_131;
          end
        end else begin
          _T_1599 <= 16'h0;
        end
      end else begin
        _T_1599 <= 16'h0;
      end
    end else begin
      _T_1599 <= 16'h0;
    end
    _T_1601 <= _T_1599;
    if (out_valid) begin
      if (_T_1550) begin
        _T_1608 <= 16'h0;
      end else begin
        if (_T_1554) begin
          if (out_valid) begin
            if (_T_1550) begin
              _T_1608 <= 16'h0;
            end else begin
              if (_T_1554) begin
                if (io_input_valid) begin
                  if (_T_74) begin
                    if (_T_87) begin
                      if (_T_91) begin
                        _T_1608 <= io_dIn_3;
                      end else begin
                        _T_1608 <= io_dIn_2;
                      end
                    end else begin
                      if (_T_104) begin
                        if (_T_91) begin
                          _T_1608 <= io_dIn_5;
                        end else begin
                          _T_1608 <= io_dIn_4;
                        end
                      end else begin
                        if (_T_121) begin
                          if (_T_91) begin
                            _T_1608 <= io_dIn_1;
                          end else begin
                            _T_1608 <= io_dIn_0;
                          end
                        end else begin
                          _T_1608 <= 16'h0;
                        end
                      end
                    end
                  end else begin
                    _T_1608 <= _T_133;
                  end
                end else begin
                  _T_1608 <= 16'h0;
                end
              end else begin
                _T_1608 <= 16'h0;
              end
            end
          end else begin
            _T_1608 <= 16'h0;
          end
        end else begin
          _T_1608 <= 16'h0;
        end
      end
    end else begin
      _T_1608 <= 16'h0;
    end
    _T_1610 <= _T_1608;
    if (out_valid) begin
      if (_T_1550) begin
        if (io_input_valid) begin
          if (_T_74) begin
            if (_T_87) begin
              if (_T_91) begin
                _T_1613 <= io_dIn_3;
              end else begin
                _T_1613 <= io_dIn_2;
              end
            end else begin
              if (_T_104) begin
                if (_T_91) begin
                  _T_1613 <= io_dIn_5;
                end else begin
                  _T_1613 <= io_dIn_4;
                end
              end else begin
                if (_T_121) begin
                  if (_T_91) begin
                    _T_1613 <= io_dIn_1;
                  end else begin
                    _T_1613 <= io_dIn_0;
                  end
                end else begin
                  _T_1613 <= 16'h0;
                end
              end
            end
          end else begin
            _T_1613 <= _T_133;
          end
        end else begin
          _T_1613 <= 16'h0;
        end
      end else begin
        _T_1613 <= 16'h0;
      end
    end else begin
      _T_1613 <= 16'h0;
    end
    _T_1615 <= _T_1613;
  end
endmodule
