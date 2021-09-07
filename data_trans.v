module data_gen( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input        io_input_valid, // @[:@6.4]
  output [7:0] io_dOut, // @[:@6.4]
  output [9:0] io_dOut_addr, // @[:@6.4]
  output       io_dOut_valid // @[:@6.4]
);
  reg [7:0] temp; // @[SRAM.scala 87:19:@8.4]
  reg [31:0] _RAND_0;
  reg [7:0] value; // @[Counter.scala 26:33:@9.4]
  reg [31:0] _RAND_1;
  wire  _T_18; // @[Counter.scala 34:24:@11.6]
  wire [8:0] _T_20; // @[Counter.scala 35:22:@12.6]
  wire [7:0] _T_21; // @[Counter.scala 35:22:@13.6]
  wire [7:0] _GEN_0; // @[Counter.scala 37:21:@15.6]
  wire [7:0] _GEN_1; // @[Counter.scala 63:17:@10.4]
  reg  _T_25; // @[Reg.scala 11:16:@21.6]
  reg [31:0] _RAND_2;
  wire [7:0] _GEN_2; // @[SRAM.scala 103:17:@33.6]
  wire [7:0] _T_29; // @[SRAM.scala 103:17:@33.6]
  wire [7:0] _GEN_5; // @[SRAM.scala 101:22:@32.4]
  assign _T_18 = value == 8'hbf; // @[Counter.scala 34:24:@11.6]
  assign _T_20 = value + 8'h1; // @[Counter.scala 35:22:@12.6]
  assign _T_21 = _T_20[7:0]; // @[Counter.scala 35:22:@13.6]
  assign _GEN_0 = _T_18 ? 8'h0 : _T_21; // @[Counter.scala 37:21:@15.6]
  assign _GEN_1 = io_input_valid ? _GEN_0 : value; // @[Counter.scala 63:17:@10.4]
  assign _GEN_2 = value % 8'h80; // @[SRAM.scala 103:17:@33.6]
  assign _T_29 = _GEN_2[7:0]; // @[SRAM.scala 103:17:@33.6]
  assign _GEN_5 = io_dOut_valid ? _T_29 : 8'h0; // @[SRAM.scala 101:22:@32.4]
  assign io_dOut = temp; // @[SRAM.scala 108:10:@421.4]
  assign io_dOut_addr = io_input_valid ? {{2'd0}, value} : 10'h0; // @[SRAM.scala 95:17:@26.6 SRAM.scala 98:17:@30.6]
  assign io_dOut_valid = io_input_valid ? _T_25 : 1'h0; // @[SRAM.scala 94:18:@25.6 SRAM.scala 97:18:@29.6]
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
  temp = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  value = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_25 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      temp <= 8'h0;
    end else begin
      if (io_dOut_valid) begin
        temp <= _T_29;
      end else begin
        temp <= 8'h0;
      end
    end
    if (reset) begin
      value <= 8'h0;
    end else begin
      if (io_input_valid) begin
        if (_T_18) begin
          value <= 8'h0;
        end else begin
          value <= _T_21;
        end
      end
    end
    _T_25 <= io_input_valid;
  end
endmodule
module Conter_pause( // @[:@423.2]
  input        clock, // @[:@424.4]
  input        reset, // @[:@425.4]
  input        io_valid, // @[:@426.4]
  input  [7:0] io_goal_num, // @[:@426.4]
  input        io_pulse, // @[:@426.4]
  output [7:0] io_cnt, // @[:@426.4]
  output       io_out_valid // @[:@426.4]
);
  reg [7:0] cnt_temp; // @[Rank_Chang.scala 15:23:@428.4]
  reg [31:0] _RAND_0;
  wire [8:0] _T_18; // @[Rank_Chang.scala 17:47:@430.6]
  wire [8:0] _T_19; // @[Rank_Chang.scala 17:47:@431.6]
  wire [7:0] _T_20; // @[Rank_Chang.scala 17:47:@432.6]
  wire  _T_21; // @[Rank_Chang.scala 17:30:@433.6]
  wire  _T_22; // @[Rank_Chang.scala 17:19:@434.6]
  wire [8:0] _T_24; // @[Rank_Chang.scala 18:27:@436.8]
  wire [7:0] _T_25; // @[Rank_Chang.scala 18:27:@437.8]
  wire  _T_31; // @[Rank_Chang.scala 20:36:@445.8]
  wire  _T_32; // @[Rank_Chang.scala 20:25:@446.8]
  wire [7:0] _GEN_0; // @[Rank_Chang.scala 20:62:@447.8]
  wire [7:0] _GEN_2; // @[Rank_Chang.scala 17:56:@435.6]
  wire  _GEN_3; // @[Rank_Chang.scala 17:56:@435.6]
  wire [7:0] _GEN_4; // @[Rank_Chang.scala 16:18:@429.4]
  assign _T_18 = io_goal_num - 8'h1; // @[Rank_Chang.scala 17:47:@430.6]
  assign _T_19 = $unsigned(_T_18); // @[Rank_Chang.scala 17:47:@431.6]
  assign _T_20 = _T_19[7:0]; // @[Rank_Chang.scala 17:47:@432.6]
  assign _T_21 = io_cnt != _T_20; // @[Rank_Chang.scala 17:30:@433.6]
  assign _T_22 = io_pulse & _T_21; // @[Rank_Chang.scala 17:19:@434.6]
  assign _T_24 = cnt_temp + 8'h1; // @[Rank_Chang.scala 18:27:@436.8]
  assign _T_25 = _T_24[7:0]; // @[Rank_Chang.scala 18:27:@437.8]
  assign _T_31 = io_cnt == _T_20; // @[Rank_Chang.scala 20:36:@445.8]
  assign _T_32 = io_pulse & _T_31; // @[Rank_Chang.scala 20:25:@446.8]
  assign _GEN_0 = _T_32 ? 8'h0 : cnt_temp; // @[Rank_Chang.scala 20:62:@447.8]
  assign _GEN_2 = _T_22 ? _T_25 : _GEN_0; // @[Rank_Chang.scala 17:56:@435.6]
  assign _GEN_3 = _T_22 ? 1'h0 : _T_32; // @[Rank_Chang.scala 17:56:@435.6]
  assign _GEN_4 = io_valid ? _GEN_2 : 8'h0; // @[Rank_Chang.scala 16:18:@429.4]
  assign io_cnt = cnt_temp; // @[Rank_Chang.scala 32:9:@460.4]
  assign io_out_valid = io_valid ? _GEN_3 : 1'h0; // @[Rank_Chang.scala 19:20:@439.8 Rank_Chang.scala 22:20:@449.10 Rank_Chang.scala 25:20:@453.10 Rank_Chang.scala 29:18:@458.6]
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
module Padding( // @[:@462.2]
  input        clock, // @[:@463.4]
  input        reset, // @[:@464.4]
  input  [7:0] io_dIn, // @[:@465.4]
  input        io_in_valid, // @[:@465.4]
  output [7:0] io_dOut, // @[:@465.4]
  output       io_out_vaild // @[:@465.4]
);
  wire  Conter_pause_clock; // @[Rank_Chang.scala 38:20:@477.4]
  wire  Conter_pause_reset; // @[Rank_Chang.scala 38:20:@477.4]
  wire  Conter_pause_io_valid; // @[Rank_Chang.scala 38:20:@477.4]
  wire [7:0] Conter_pause_io_goal_num; // @[Rank_Chang.scala 38:20:@477.4]
  wire  Conter_pause_io_pulse; // @[Rank_Chang.scala 38:20:@477.4]
  wire [7:0] Conter_pause_io_cnt; // @[Rank_Chang.scala 38:20:@477.4]
  wire  Conter_pause_io_out_valid; // @[Rank_Chang.scala 38:20:@477.4]
  reg [7:0] Buffer_0; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_0;
  reg [7:0] Buffer_1; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_1;
  reg [7:0] Buffer_2; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_2;
  reg [7:0] Buffer_3; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_3;
  reg [7:0] Buffer_4; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_4;
  reg [7:0] Buffer_5; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_5;
  reg [7:0] Buffer_6; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_6;
  reg [7:0] Buffer_7; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_7;
  reg [7:0] Buffer_8; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_8;
  reg [7:0] Buffer_9; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_9;
  reg [7:0] Buffer_10; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_10;
  reg [7:0] Buffer_11; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_11;
  reg [7:0] Buffer_12; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_12;
  reg [7:0] Buffer_13; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_13;
  reg [7:0] Buffer_14; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_14;
  reg [7:0] Buffer_15; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_15;
  reg [7:0] Buffer_16; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_16;
  reg [7:0] Buffer_17; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_17;
  reg [7:0] Buffer_18; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_18;
  reg [7:0] Buffer_19; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_19;
  reg [7:0] Buffer_20; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_20;
  reg [7:0] Buffer_21; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_21;
  reg [7:0] Buffer_22; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_22;
  reg [7:0] Buffer_23; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_23;
  reg [7:0] Buffer_24; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_24;
  reg [7:0] Buffer_25; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_25;
  reg [7:0] Buffer_26; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_26;
  reg [7:0] Buffer_27; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_27;
  reg [7:0] Buffer_28; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_28;
  reg [7:0] Buffer_29; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_29;
  reg [7:0] Buffer_30; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_30;
  reg [7:0] Buffer_31; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_31;
  reg [7:0] Buffer_32; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_32;
  reg [7:0] Buffer_33; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_33;
  reg [7:0] Buffer_34; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_34;
  reg [7:0] Buffer_35; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_35;
  reg [7:0] Buffer_36; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_36;
  reg [7:0] Buffer_37; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_37;
  reg [7:0] Buffer_38; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_38;
  reg [7:0] Buffer_39; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_39;
  reg [7:0] Buffer_40; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_40;
  reg [7:0] Buffer_41; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_41;
  reg [7:0] Buffer_42; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_42;
  reg [7:0] Buffer_43; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_43;
  reg [7:0] Buffer_44; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_44;
  reg [7:0] Buffer_45; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_45;
  reg [7:0] Buffer_46; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_46;
  reg [7:0] Buffer_47; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_47;
  reg [7:0] Buffer_48; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_48;
  reg [7:0] Buffer_49; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_49;
  reg [7:0] Buffer_50; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_50;
  reg [7:0] Buffer_51; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_51;
  reg [7:0] Buffer_52; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_52;
  reg [7:0] Buffer_53; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_53;
  reg [7:0] Buffer_54; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_54;
  reg [7:0] Buffer_55; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_55;
  reg [7:0] Buffer_56; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_56;
  reg [7:0] Buffer_57; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_57;
  reg [7:0] Buffer_58; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_58;
  reg [7:0] Buffer_59; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_59;
  reg [7:0] Buffer_60; // @[SRAM.scala 124:17:@467.4]
  reg [31:0] _RAND_60;
  reg [5:0] addr; // @[SRAM.scala 125:19:@468.4]
  reg [31:0] _RAND_61;
  reg [3:0] value; // @[Counter.scala 26:33:@469.4]
  reg [31:0] _RAND_62;
  wire  _T_84; // @[Counter.scala 34:24:@471.6]
  wire [4:0] _T_86; // @[Counter.scala 35:22:@472.6]
  wire [3:0] _T_87; // @[Counter.scala 35:22:@473.6]
  wire [3:0] _GEN_0; // @[Counter.scala 63:17:@470.4]
  reg  _T_152; // @[Reg.scala 11:16:@544.4]
  reg [31:0] _RAND_63;
  wire [7:0] _GEN_2; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_3; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_4; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_5; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_6; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_7; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_8; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_9; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_10; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_11; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_12; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_13; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_14; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_15; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_16; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_17; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_18; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_19; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_20; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_21; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_22; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_23; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_24; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_25; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_26; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_27; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_28; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_29; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_30; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_31; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_32; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_33; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_34; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_35; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_36; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_37; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_38; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_39; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_40; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_41; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_42; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_43; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_44; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_45; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_46; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_47; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_48; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_49; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_50; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_51; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_52; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_53; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_54; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_55; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_56; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_57; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_58; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_59; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_60; // @[SRAM.scala 138:37:@548.4]
  wire [7:0] _GEN_61; // @[SRAM.scala 138:37:@548.4]
  wire  _T_154; // @[SRAM.scala 147:13:@611.6]
  wire  _T_156; // @[SRAM.scala 148:21:@613.8]
  wire  _T_158; // @[SRAM.scala 148:36:@614.8]
  wire  _T_159; // @[SRAM.scala 148:27:@615.8]
  wire [6:0] _T_161; // @[SRAM.scala 149:21:@617.10]
  wire [6:0] _T_162; // @[SRAM.scala 149:21:@618.10]
  wire [5:0] _T_163; // @[SRAM.scala 149:21:@619.10]
  wire [6:0] _T_165; // @[SRAM.scala 149:32:@620.10]
  wire [6:0] _T_166; // @[SRAM.scala 149:32:@621.10]
  wire [5:0] _T_167; // @[SRAM.scala 149:32:@622.10]
  wire [6:0] _T_169; // @[SRAM.scala 151:23:@626.10]
  wire [6:0] _T_170; // @[SRAM.scala 151:23:@627.10]
  wire [5:0] _T_171; // @[SRAM.scala 151:23:@628.10]
  wire [5:0] _GEN_62; // @[SRAM.scala 148:52:@616.8]
  wire [7:0] _GEN_63; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_64; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_65; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_66; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_67; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_68; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_69; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_70; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_71; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_72; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_73; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_74; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_75; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_76; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_77; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_78; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_79; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_80; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_81; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_82; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_83; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_84; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_85; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_86; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_87; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_88; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_89; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_90; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_91; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_92; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_93; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_94; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_95; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_96; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_97; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_98; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_99; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_100; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_101; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_102; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_103; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_104; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_105; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_106; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_107; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_108; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_109; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_110; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_111; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_112; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_113; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_114; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_115; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_116; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_117; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_118; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_119; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_120; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_121; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_122; // @[SRAM.scala 155:23:@638.8]
  wire [7:0] _GEN_123; // @[SRAM.scala 155:23:@638.8]
  wire  _T_182; // @[SRAM.scala 156:16:@639.8]
  wire [5:0] _GEN_124; // @[SRAM.scala 156:23:@640.8]
  wire [7:0] _GEN_125; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_126; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_127; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_128; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_129; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_130; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_131; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_132; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_133; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_134; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_135; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_136; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_137; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_138; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_139; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_140; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_141; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_142; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_143; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_144; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_145; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_146; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_147; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_148; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_149; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_150; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_151; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_152; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_153; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_154; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_155; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_156; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_157; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_158; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_159; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_160; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_161; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_162; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_163; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_164; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_165; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_166; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_167; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_168; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_169; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_170; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_171; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_172; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_173; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_174; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_175; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_176; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_177; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_178; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_179; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_180; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_181; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_182; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_183; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_184; // @[SRAM.scala 163:19:@649.8]
  wire [7:0] _GEN_185; // @[SRAM.scala 163:19:@649.8]
  wire [5:0] _GEN_186; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_189; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_190; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_191; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_192; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_193; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_194; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_195; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_196; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_197; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_198; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_199; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_200; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_201; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_202; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_203; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_204; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_205; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_206; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_207; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_208; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_209; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_210; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_211; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_212; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_213; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_214; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_215; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_216; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_217; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_218; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_219; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_220; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_221; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_222; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_223; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_224; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_225; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_226; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_227; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_228; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_229; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_230; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_231; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_232; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_233; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_234; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_235; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_236; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_237; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_238; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_239; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_240; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_241; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_242; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_243; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_244; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_245; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_246; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_247; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_248; // @[SRAM.scala 147:20:@612.6]
  wire [7:0] _GEN_249; // @[SRAM.scala 147:20:@612.6]
  wire [5:0] _GEN_250; // @[SRAM.scala 145:20:@610.4]
  Conter_pause Conter_pause ( // @[Rank_Chang.scala 38:20:@477.4]
    .clock(Conter_pause_clock),
    .reset(Conter_pause_reset),
    .io_valid(Conter_pause_io_valid),
    .io_goal_num(Conter_pause_io_goal_num),
    .io_pulse(Conter_pause_io_pulse),
    .io_cnt(Conter_pause_io_cnt),
    .io_out_valid(Conter_pause_io_out_valid)
  );
  assign _T_84 = value == 4'hf; // @[Counter.scala 34:24:@471.6]
  assign _T_86 = value + 4'h1; // @[Counter.scala 35:22:@472.6]
  assign _T_87 = _T_86[3:0]; // @[Counter.scala 35:22:@473.6]
  assign _GEN_0 = io_in_valid ? _T_87 : value; // @[Counter.scala 63:17:@470.4]
  assign _GEN_2 = _T_152 ? Buffer_0 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_3 = _T_152 ? Buffer_1 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_4 = _T_152 ? Buffer_2 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_5 = _T_152 ? Buffer_3 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_6 = _T_152 ? Buffer_4 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_7 = _T_152 ? Buffer_5 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_8 = _T_152 ? Buffer_6 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_9 = _T_152 ? Buffer_7 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_10 = _T_152 ? Buffer_8 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_11 = _T_152 ? Buffer_9 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_12 = _T_152 ? Buffer_10 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_13 = _T_152 ? Buffer_11 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_14 = _T_152 ? Buffer_12 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_15 = _T_152 ? Buffer_13 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_16 = _T_152 ? Buffer_14 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_17 = _T_152 ? Buffer_15 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_18 = _T_152 ? Buffer_16 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_19 = _T_152 ? Buffer_17 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_20 = _T_152 ? Buffer_18 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_21 = _T_152 ? Buffer_19 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_22 = _T_152 ? Buffer_20 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_23 = _T_152 ? Buffer_21 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_24 = _T_152 ? Buffer_22 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_25 = _T_152 ? Buffer_23 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_26 = _T_152 ? Buffer_24 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_27 = _T_152 ? Buffer_25 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_28 = _T_152 ? Buffer_26 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_29 = _T_152 ? Buffer_27 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_30 = _T_152 ? Buffer_28 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_31 = _T_152 ? Buffer_29 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_32 = _T_152 ? Buffer_30 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_33 = _T_152 ? Buffer_31 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_34 = _T_152 ? Buffer_32 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_35 = _T_152 ? Buffer_33 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_36 = _T_152 ? Buffer_34 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_37 = _T_152 ? Buffer_35 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_38 = _T_152 ? Buffer_36 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_39 = _T_152 ? Buffer_37 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_40 = _T_152 ? Buffer_38 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_41 = _T_152 ? Buffer_39 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_42 = _T_152 ? Buffer_40 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_43 = _T_152 ? Buffer_41 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_44 = _T_152 ? Buffer_42 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_45 = _T_152 ? Buffer_43 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_46 = _T_152 ? Buffer_44 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_47 = _T_152 ? Buffer_45 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_48 = _T_152 ? Buffer_46 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_49 = _T_152 ? Buffer_47 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_50 = _T_152 ? Buffer_48 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_51 = _T_152 ? Buffer_49 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_52 = _T_152 ? Buffer_50 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_53 = _T_152 ? Buffer_51 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_54 = _T_152 ? Buffer_52 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_55 = _T_152 ? Buffer_53 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_56 = _T_152 ? Buffer_54 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_57 = _T_152 ? Buffer_55 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_58 = _T_152 ? Buffer_56 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_59 = _T_152 ? Buffer_57 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_60 = _T_152 ? Buffer_58 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _GEN_61 = _T_152 ? Buffer_59 : 8'h0; // @[SRAM.scala 138:37:@548.4]
  assign _T_154 = value == 4'h0; // @[SRAM.scala 147:13:@611.6]
  assign _T_156 = Conter_pause_io_cnt == 8'h0; // @[SRAM.scala 148:21:@613.8]
  assign _T_158 = Conter_pause_io_cnt == 8'hc; // @[SRAM.scala 148:36:@614.8]
  assign _T_159 = _T_156 | _T_158; // @[SRAM.scala 148:27:@615.8]
  assign _T_161 = addr - 6'h10; // @[SRAM.scala 149:21:@617.10]
  assign _T_162 = $unsigned(_T_161); // @[SRAM.scala 149:21:@618.10]
  assign _T_163 = _T_162[5:0]; // @[SRAM.scala 149:21:@619.10]
  assign _T_165 = _T_163 - 6'h2; // @[SRAM.scala 149:32:@620.10]
  assign _T_166 = $unsigned(_T_165); // @[SRAM.scala 149:32:@621.10]
  assign _T_167 = _T_166[5:0]; // @[SRAM.scala 149:32:@622.10]
  assign _T_169 = addr - 6'h2; // @[SRAM.scala 151:23:@626.10]
  assign _T_170 = $unsigned(_T_169); // @[SRAM.scala 151:23:@627.10]
  assign _T_171 = _T_170[5:0]; // @[SRAM.scala 151:23:@628.10]
  assign _GEN_62 = _T_159 ? _T_167 : _T_171; // @[SRAM.scala 148:52:@616.8]
  assign _GEN_63 = 6'h0 == _T_171 ? io_dIn : 8'h0; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_64 = 6'h1 == _T_171 ? io_dIn : _GEN_2; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_65 = 6'h2 == _T_171 ? io_dIn : _GEN_3; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_66 = 6'h3 == _T_171 ? io_dIn : _GEN_4; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_67 = 6'h4 == _T_171 ? io_dIn : _GEN_5; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_68 = 6'h5 == _T_171 ? io_dIn : _GEN_6; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_69 = 6'h6 == _T_171 ? io_dIn : _GEN_7; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_70 = 6'h7 == _T_171 ? io_dIn : _GEN_8; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_71 = 6'h8 == _T_171 ? io_dIn : _GEN_9; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_72 = 6'h9 == _T_171 ? io_dIn : _GEN_10; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_73 = 6'ha == _T_171 ? io_dIn : _GEN_11; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_74 = 6'hb == _T_171 ? io_dIn : _GEN_12; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_75 = 6'hc == _T_171 ? io_dIn : _GEN_13; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_76 = 6'hd == _T_171 ? io_dIn : _GEN_14; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_77 = 6'he == _T_171 ? io_dIn : _GEN_15; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_78 = 6'hf == _T_171 ? io_dIn : _GEN_16; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_79 = 6'h10 == _T_171 ? io_dIn : _GEN_17; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_80 = 6'h11 == _T_171 ? io_dIn : _GEN_18; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_81 = 6'h12 == _T_171 ? io_dIn : _GEN_19; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_82 = 6'h13 == _T_171 ? io_dIn : _GEN_20; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_83 = 6'h14 == _T_171 ? io_dIn : _GEN_21; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_84 = 6'h15 == _T_171 ? io_dIn : _GEN_22; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_85 = 6'h16 == _T_171 ? io_dIn : _GEN_23; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_86 = 6'h17 == _T_171 ? io_dIn : _GEN_24; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_87 = 6'h18 == _T_171 ? io_dIn : _GEN_25; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_88 = 6'h19 == _T_171 ? io_dIn : _GEN_26; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_89 = 6'h1a == _T_171 ? io_dIn : _GEN_27; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_90 = 6'h1b == _T_171 ? io_dIn : _GEN_28; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_91 = 6'h1c == _T_171 ? io_dIn : _GEN_29; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_92 = 6'h1d == _T_171 ? io_dIn : _GEN_30; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_93 = 6'h1e == _T_171 ? io_dIn : _GEN_31; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_94 = 6'h1f == _T_171 ? io_dIn : _GEN_32; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_95 = 6'h20 == _T_171 ? io_dIn : _GEN_33; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_96 = 6'h21 == _T_171 ? io_dIn : _GEN_34; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_97 = 6'h22 == _T_171 ? io_dIn : _GEN_35; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_98 = 6'h23 == _T_171 ? io_dIn : _GEN_36; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_99 = 6'h24 == _T_171 ? io_dIn : _GEN_37; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_100 = 6'h25 == _T_171 ? io_dIn : _GEN_38; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_101 = 6'h26 == _T_171 ? io_dIn : _GEN_39; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_102 = 6'h27 == _T_171 ? io_dIn : _GEN_40; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_103 = 6'h28 == _T_171 ? io_dIn : _GEN_41; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_104 = 6'h29 == _T_171 ? io_dIn : _GEN_42; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_105 = 6'h2a == _T_171 ? io_dIn : _GEN_43; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_106 = 6'h2b == _T_171 ? io_dIn : _GEN_44; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_107 = 6'h2c == _T_171 ? io_dIn : _GEN_45; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_108 = 6'h2d == _T_171 ? io_dIn : _GEN_46; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_109 = 6'h2e == _T_171 ? io_dIn : _GEN_47; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_110 = 6'h2f == _T_171 ? io_dIn : _GEN_48; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_111 = 6'h30 == _T_171 ? io_dIn : _GEN_49; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_112 = 6'h31 == _T_171 ? io_dIn : _GEN_50; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_113 = 6'h32 == _T_171 ? io_dIn : _GEN_51; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_114 = 6'h33 == _T_171 ? io_dIn : _GEN_52; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_115 = 6'h34 == _T_171 ? io_dIn : _GEN_53; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_116 = 6'h35 == _T_171 ? io_dIn : _GEN_54; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_117 = 6'h36 == _T_171 ? io_dIn : _GEN_55; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_118 = 6'h37 == _T_171 ? io_dIn : _GEN_56; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_119 = 6'h38 == _T_171 ? io_dIn : _GEN_57; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_120 = 6'h39 == _T_171 ? io_dIn : _GEN_58; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_121 = 6'h3a == _T_171 ? io_dIn : _GEN_59; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_122 = 6'h3b == _T_171 ? io_dIn : _GEN_60; // @[SRAM.scala 155:23:@638.8]
  assign _GEN_123 = 6'h3c == _T_171 ? io_dIn : _GEN_61; // @[SRAM.scala 155:23:@638.8]
  assign _T_182 = addr == 6'h0; // @[SRAM.scala 156:16:@639.8]
  assign _GEN_124 = _T_182 ? 6'h0 : _GEN_62; // @[SRAM.scala 156:23:@640.8]
  assign _GEN_125 = 6'h0 == addr ? io_dIn : 8'h0; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_126 = 6'h1 == addr ? io_dIn : _GEN_2; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_127 = 6'h2 == addr ? io_dIn : _GEN_3; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_128 = 6'h3 == addr ? io_dIn : _GEN_4; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_129 = 6'h4 == addr ? io_dIn : _GEN_5; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_130 = 6'h5 == addr ? io_dIn : _GEN_6; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_131 = 6'h6 == addr ? io_dIn : _GEN_7; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_132 = 6'h7 == addr ? io_dIn : _GEN_8; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_133 = 6'h8 == addr ? io_dIn : _GEN_9; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_134 = 6'h9 == addr ? io_dIn : _GEN_10; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_135 = 6'ha == addr ? io_dIn : _GEN_11; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_136 = 6'hb == addr ? io_dIn : _GEN_12; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_137 = 6'hc == addr ? io_dIn : _GEN_13; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_138 = 6'hd == addr ? io_dIn : _GEN_14; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_139 = 6'he == addr ? io_dIn : _GEN_15; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_140 = 6'hf == addr ? io_dIn : _GEN_16; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_141 = 6'h10 == addr ? io_dIn : _GEN_17; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_142 = 6'h11 == addr ? io_dIn : _GEN_18; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_143 = 6'h12 == addr ? io_dIn : _GEN_19; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_144 = 6'h13 == addr ? io_dIn : _GEN_20; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_145 = 6'h14 == addr ? io_dIn : _GEN_21; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_146 = 6'h15 == addr ? io_dIn : _GEN_22; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_147 = 6'h16 == addr ? io_dIn : _GEN_23; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_148 = 6'h17 == addr ? io_dIn : _GEN_24; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_149 = 6'h18 == addr ? io_dIn : _GEN_25; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_150 = 6'h19 == addr ? io_dIn : _GEN_26; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_151 = 6'h1a == addr ? io_dIn : _GEN_27; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_152 = 6'h1b == addr ? io_dIn : _GEN_28; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_153 = 6'h1c == addr ? io_dIn : _GEN_29; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_154 = 6'h1d == addr ? io_dIn : _GEN_30; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_155 = 6'h1e == addr ? io_dIn : _GEN_31; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_156 = 6'h1f == addr ? io_dIn : _GEN_32; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_157 = 6'h20 == addr ? io_dIn : _GEN_33; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_158 = 6'h21 == addr ? io_dIn : _GEN_34; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_159 = 6'h22 == addr ? io_dIn : _GEN_35; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_160 = 6'h23 == addr ? io_dIn : _GEN_36; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_161 = 6'h24 == addr ? io_dIn : _GEN_37; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_162 = 6'h25 == addr ? io_dIn : _GEN_38; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_163 = 6'h26 == addr ? io_dIn : _GEN_39; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_164 = 6'h27 == addr ? io_dIn : _GEN_40; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_165 = 6'h28 == addr ? io_dIn : _GEN_41; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_166 = 6'h29 == addr ? io_dIn : _GEN_42; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_167 = 6'h2a == addr ? io_dIn : _GEN_43; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_168 = 6'h2b == addr ? io_dIn : _GEN_44; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_169 = 6'h2c == addr ? io_dIn : _GEN_45; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_170 = 6'h2d == addr ? io_dIn : _GEN_46; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_171 = 6'h2e == addr ? io_dIn : _GEN_47; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_172 = 6'h2f == addr ? io_dIn : _GEN_48; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_173 = 6'h30 == addr ? io_dIn : _GEN_49; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_174 = 6'h31 == addr ? io_dIn : _GEN_50; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_175 = 6'h32 == addr ? io_dIn : _GEN_51; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_176 = 6'h33 == addr ? io_dIn : _GEN_52; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_177 = 6'h34 == addr ? io_dIn : _GEN_53; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_178 = 6'h35 == addr ? io_dIn : _GEN_54; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_179 = 6'h36 == addr ? io_dIn : _GEN_55; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_180 = 6'h37 == addr ? io_dIn : _GEN_56; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_181 = 6'h38 == addr ? io_dIn : _GEN_57; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_182 = 6'h39 == addr ? io_dIn : _GEN_58; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_183 = 6'h3a == addr ? io_dIn : _GEN_59; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_184 = 6'h3b == addr ? io_dIn : _GEN_60; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_185 = 6'h3c == addr ? io_dIn : _GEN_61; // @[SRAM.scala 163:19:@649.8]
  assign _GEN_186 = _T_154 ? _GEN_124 : addr; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_189 = _T_154 ? _GEN_63 : _GEN_125; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_190 = _T_154 ? _GEN_64 : _GEN_126; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_191 = _T_154 ? _GEN_65 : _GEN_127; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_192 = _T_154 ? _GEN_66 : _GEN_128; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_193 = _T_154 ? _GEN_67 : _GEN_129; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_194 = _T_154 ? _GEN_68 : _GEN_130; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_195 = _T_154 ? _GEN_69 : _GEN_131; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_196 = _T_154 ? _GEN_70 : _GEN_132; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_197 = _T_154 ? _GEN_71 : _GEN_133; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_198 = _T_154 ? _GEN_72 : _GEN_134; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_199 = _T_154 ? _GEN_73 : _GEN_135; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_200 = _T_154 ? _GEN_74 : _GEN_136; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_201 = _T_154 ? _GEN_75 : _GEN_137; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_202 = _T_154 ? _GEN_76 : _GEN_138; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_203 = _T_154 ? _GEN_77 : _GEN_139; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_204 = _T_154 ? _GEN_78 : _GEN_140; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_205 = _T_154 ? _GEN_79 : _GEN_141; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_206 = _T_154 ? _GEN_80 : _GEN_142; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_207 = _T_154 ? _GEN_81 : _GEN_143; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_208 = _T_154 ? _GEN_82 : _GEN_144; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_209 = _T_154 ? _GEN_83 : _GEN_145; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_210 = _T_154 ? _GEN_84 : _GEN_146; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_211 = _T_154 ? _GEN_85 : _GEN_147; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_212 = _T_154 ? _GEN_86 : _GEN_148; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_213 = _T_154 ? _GEN_87 : _GEN_149; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_214 = _T_154 ? _GEN_88 : _GEN_150; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_215 = _T_154 ? _GEN_89 : _GEN_151; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_216 = _T_154 ? _GEN_90 : _GEN_152; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_217 = _T_154 ? _GEN_91 : _GEN_153; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_218 = _T_154 ? _GEN_92 : _GEN_154; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_219 = _T_154 ? _GEN_93 : _GEN_155; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_220 = _T_154 ? _GEN_94 : _GEN_156; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_221 = _T_154 ? _GEN_95 : _GEN_157; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_222 = _T_154 ? _GEN_96 : _GEN_158; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_223 = _T_154 ? _GEN_97 : _GEN_159; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_224 = _T_154 ? _GEN_98 : _GEN_160; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_225 = _T_154 ? _GEN_99 : _GEN_161; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_226 = _T_154 ? _GEN_100 : _GEN_162; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_227 = _T_154 ? _GEN_101 : _GEN_163; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_228 = _T_154 ? _GEN_102 : _GEN_164; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_229 = _T_154 ? _GEN_103 : _GEN_165; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_230 = _T_154 ? _GEN_104 : _GEN_166; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_231 = _T_154 ? _GEN_105 : _GEN_167; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_232 = _T_154 ? _GEN_106 : _GEN_168; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_233 = _T_154 ? _GEN_107 : _GEN_169; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_234 = _T_154 ? _GEN_108 : _GEN_170; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_235 = _T_154 ? _GEN_109 : _GEN_171; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_236 = _T_154 ? _GEN_110 : _GEN_172; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_237 = _T_154 ? _GEN_111 : _GEN_173; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_238 = _T_154 ? _GEN_112 : _GEN_174; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_239 = _T_154 ? _GEN_113 : _GEN_175; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_240 = _T_154 ? _GEN_114 : _GEN_176; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_241 = _T_154 ? _GEN_115 : _GEN_177; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_242 = _T_154 ? _GEN_116 : _GEN_178; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_243 = _T_154 ? _GEN_117 : _GEN_179; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_244 = _T_154 ? _GEN_118 : _GEN_180; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_245 = _T_154 ? _GEN_119 : _GEN_181; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_246 = _T_154 ? _GEN_120 : _GEN_182; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_247 = _T_154 ? _GEN_121 : _GEN_183; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_248 = _T_154 ? _GEN_122 : _GEN_184; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_249 = _T_154 ? _GEN_123 : _GEN_185; // @[SRAM.scala 147:20:@612.6]
  assign _GEN_250 = io_in_valid ? _GEN_186 : addr; // @[SRAM.scala 145:20:@610.4]
  assign io_dOut = io_in_valid ? Buffer_60 : 8'h0; // @[SRAM.scala 153:14:@631.8 SRAM.scala 161:14:@645.8 SRAM.scala 172:12:@654.6]
  assign io_out_vaild = io_in_valid; // @[SRAM.scala 154:19:@632.8 SRAM.scala 162:19:@646.8 SRAM.scala 171:17:@653.6]
  assign Conter_pause_clock = clock; // @[:@478.4]
  assign Conter_pause_reset = reset; // @[:@479.4]
  assign Conter_pause_io_valid = io_in_valid; // @[Rank_Chang.scala 39:18:@480.4]
  assign Conter_pause_io_goal_num = 8'he; // @[Rank_Chang.scala 40:21:@481.4]
  assign Conter_pause_io_pulse = io_in_valid & _T_84; // @[Rank_Chang.scala 41:18:@482.4]
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
  Buffer_0 = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  Buffer_1 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  Buffer_2 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  Buffer_3 = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  Buffer_4 = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  Buffer_5 = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  Buffer_6 = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  Buffer_7 = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  Buffer_8 = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  Buffer_9 = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  Buffer_10 = _RAND_10[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  Buffer_11 = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  Buffer_12 = _RAND_12[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  Buffer_13 = _RAND_13[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  Buffer_14 = _RAND_14[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  Buffer_15 = _RAND_15[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  Buffer_16 = _RAND_16[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  Buffer_17 = _RAND_17[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  Buffer_18 = _RAND_18[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  Buffer_19 = _RAND_19[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  Buffer_20 = _RAND_20[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  Buffer_21 = _RAND_21[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  Buffer_22 = _RAND_22[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{$random}};
  Buffer_23 = _RAND_23[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{$random}};
  Buffer_24 = _RAND_24[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{$random}};
  Buffer_25 = _RAND_25[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{$random}};
  Buffer_26 = _RAND_26[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{$random}};
  Buffer_27 = _RAND_27[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{$random}};
  Buffer_28 = _RAND_28[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{$random}};
  Buffer_29 = _RAND_29[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{$random}};
  Buffer_30 = _RAND_30[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{$random}};
  Buffer_31 = _RAND_31[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{$random}};
  Buffer_32 = _RAND_32[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{$random}};
  Buffer_33 = _RAND_33[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{$random}};
  Buffer_34 = _RAND_34[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{$random}};
  Buffer_35 = _RAND_35[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{$random}};
  Buffer_36 = _RAND_36[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{$random}};
  Buffer_37 = _RAND_37[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{$random}};
  Buffer_38 = _RAND_38[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{$random}};
  Buffer_39 = _RAND_39[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{$random}};
  Buffer_40 = _RAND_40[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{$random}};
  Buffer_41 = _RAND_41[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{$random}};
  Buffer_42 = _RAND_42[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{$random}};
  Buffer_43 = _RAND_43[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{$random}};
  Buffer_44 = _RAND_44[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{$random}};
  Buffer_45 = _RAND_45[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{$random}};
  Buffer_46 = _RAND_46[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{$random}};
  Buffer_47 = _RAND_47[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{$random}};
  Buffer_48 = _RAND_48[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{$random}};
  Buffer_49 = _RAND_49[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{$random}};
  Buffer_50 = _RAND_50[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{$random}};
  Buffer_51 = _RAND_51[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{$random}};
  Buffer_52 = _RAND_52[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{$random}};
  Buffer_53 = _RAND_53[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{$random}};
  Buffer_54 = _RAND_54[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{$random}};
  Buffer_55 = _RAND_55[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{$random}};
  Buffer_56 = _RAND_56[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{$random}};
  Buffer_57 = _RAND_57[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{$random}};
  Buffer_58 = _RAND_58[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{$random}};
  Buffer_59 = _RAND_59[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{$random}};
  Buffer_60 = _RAND_60[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{$random}};
  addr = _RAND_61[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{$random}};
  value = _RAND_62[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{$random}};
  _T_152 = _RAND_63[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h0 == _T_171) begin
          Buffer_0 <= io_dIn;
        end else begin
          Buffer_0 <= 8'h0;
        end
      end else begin
        if (6'h0 == addr) begin
          Buffer_0 <= io_dIn;
        end else begin
          Buffer_0 <= 8'h0;
        end
      end
    end else begin
      Buffer_0 <= 8'h0;
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h1 == _T_171) begin
          Buffer_1 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_1 <= Buffer_0;
          end else begin
            Buffer_1 <= 8'h0;
          end
        end
      end else begin
        if (6'h1 == addr) begin
          Buffer_1 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_1 <= Buffer_0;
          end else begin
            Buffer_1 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_1 <= Buffer_0;
      end else begin
        Buffer_1 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h2 == _T_171) begin
          Buffer_2 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_2 <= Buffer_1;
          end else begin
            Buffer_2 <= 8'h0;
          end
        end
      end else begin
        if (6'h2 == addr) begin
          Buffer_2 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_2 <= Buffer_1;
          end else begin
            Buffer_2 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_2 <= Buffer_1;
      end else begin
        Buffer_2 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h3 == _T_171) begin
          Buffer_3 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_3 <= Buffer_2;
          end else begin
            Buffer_3 <= 8'h0;
          end
        end
      end else begin
        if (6'h3 == addr) begin
          Buffer_3 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_3 <= Buffer_2;
          end else begin
            Buffer_3 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_3 <= Buffer_2;
      end else begin
        Buffer_3 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h4 == _T_171) begin
          Buffer_4 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_4 <= Buffer_3;
          end else begin
            Buffer_4 <= 8'h0;
          end
        end
      end else begin
        if (6'h4 == addr) begin
          Buffer_4 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_4 <= Buffer_3;
          end else begin
            Buffer_4 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_4 <= Buffer_3;
      end else begin
        Buffer_4 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h5 == _T_171) begin
          Buffer_5 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_5 <= Buffer_4;
          end else begin
            Buffer_5 <= 8'h0;
          end
        end
      end else begin
        if (6'h5 == addr) begin
          Buffer_5 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_5 <= Buffer_4;
          end else begin
            Buffer_5 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_5 <= Buffer_4;
      end else begin
        Buffer_5 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h6 == _T_171) begin
          Buffer_6 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_6 <= Buffer_5;
          end else begin
            Buffer_6 <= 8'h0;
          end
        end
      end else begin
        if (6'h6 == addr) begin
          Buffer_6 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_6 <= Buffer_5;
          end else begin
            Buffer_6 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_6 <= Buffer_5;
      end else begin
        Buffer_6 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h7 == _T_171) begin
          Buffer_7 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_7 <= Buffer_6;
          end else begin
            Buffer_7 <= 8'h0;
          end
        end
      end else begin
        if (6'h7 == addr) begin
          Buffer_7 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_7 <= Buffer_6;
          end else begin
            Buffer_7 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_7 <= Buffer_6;
      end else begin
        Buffer_7 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h8 == _T_171) begin
          Buffer_8 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_8 <= Buffer_7;
          end else begin
            Buffer_8 <= 8'h0;
          end
        end
      end else begin
        if (6'h8 == addr) begin
          Buffer_8 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_8 <= Buffer_7;
          end else begin
            Buffer_8 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_8 <= Buffer_7;
      end else begin
        Buffer_8 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h9 == _T_171) begin
          Buffer_9 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_9 <= Buffer_8;
          end else begin
            Buffer_9 <= 8'h0;
          end
        end
      end else begin
        if (6'h9 == addr) begin
          Buffer_9 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_9 <= Buffer_8;
          end else begin
            Buffer_9 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_9 <= Buffer_8;
      end else begin
        Buffer_9 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'ha == _T_171) begin
          Buffer_10 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_10 <= Buffer_9;
          end else begin
            Buffer_10 <= 8'h0;
          end
        end
      end else begin
        if (6'ha == addr) begin
          Buffer_10 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_10 <= Buffer_9;
          end else begin
            Buffer_10 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_10 <= Buffer_9;
      end else begin
        Buffer_10 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'hb == _T_171) begin
          Buffer_11 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_11 <= Buffer_10;
          end else begin
            Buffer_11 <= 8'h0;
          end
        end
      end else begin
        if (6'hb == addr) begin
          Buffer_11 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_11 <= Buffer_10;
          end else begin
            Buffer_11 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_11 <= Buffer_10;
      end else begin
        Buffer_11 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'hc == _T_171) begin
          Buffer_12 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_12 <= Buffer_11;
          end else begin
            Buffer_12 <= 8'h0;
          end
        end
      end else begin
        if (6'hc == addr) begin
          Buffer_12 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_12 <= Buffer_11;
          end else begin
            Buffer_12 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_12 <= Buffer_11;
      end else begin
        Buffer_12 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'hd == _T_171) begin
          Buffer_13 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_13 <= Buffer_12;
          end else begin
            Buffer_13 <= 8'h0;
          end
        end
      end else begin
        if (6'hd == addr) begin
          Buffer_13 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_13 <= Buffer_12;
          end else begin
            Buffer_13 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_13 <= Buffer_12;
      end else begin
        Buffer_13 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'he == _T_171) begin
          Buffer_14 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_14 <= Buffer_13;
          end else begin
            Buffer_14 <= 8'h0;
          end
        end
      end else begin
        if (6'he == addr) begin
          Buffer_14 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_14 <= Buffer_13;
          end else begin
            Buffer_14 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_14 <= Buffer_13;
      end else begin
        Buffer_14 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'hf == _T_171) begin
          Buffer_15 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_15 <= Buffer_14;
          end else begin
            Buffer_15 <= 8'h0;
          end
        end
      end else begin
        if (6'hf == addr) begin
          Buffer_15 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_15 <= Buffer_14;
          end else begin
            Buffer_15 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_15 <= Buffer_14;
      end else begin
        Buffer_15 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h10 == _T_171) begin
          Buffer_16 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_16 <= Buffer_15;
          end else begin
            Buffer_16 <= 8'h0;
          end
        end
      end else begin
        if (6'h10 == addr) begin
          Buffer_16 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_16 <= Buffer_15;
          end else begin
            Buffer_16 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_16 <= Buffer_15;
      end else begin
        Buffer_16 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h11 == _T_171) begin
          Buffer_17 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_17 <= Buffer_16;
          end else begin
            Buffer_17 <= 8'h0;
          end
        end
      end else begin
        if (6'h11 == addr) begin
          Buffer_17 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_17 <= Buffer_16;
          end else begin
            Buffer_17 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_17 <= Buffer_16;
      end else begin
        Buffer_17 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h12 == _T_171) begin
          Buffer_18 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_18 <= Buffer_17;
          end else begin
            Buffer_18 <= 8'h0;
          end
        end
      end else begin
        if (6'h12 == addr) begin
          Buffer_18 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_18 <= Buffer_17;
          end else begin
            Buffer_18 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_18 <= Buffer_17;
      end else begin
        Buffer_18 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h13 == _T_171) begin
          Buffer_19 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_19 <= Buffer_18;
          end else begin
            Buffer_19 <= 8'h0;
          end
        end
      end else begin
        if (6'h13 == addr) begin
          Buffer_19 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_19 <= Buffer_18;
          end else begin
            Buffer_19 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_19 <= Buffer_18;
      end else begin
        Buffer_19 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h14 == _T_171) begin
          Buffer_20 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_20 <= Buffer_19;
          end else begin
            Buffer_20 <= 8'h0;
          end
        end
      end else begin
        if (6'h14 == addr) begin
          Buffer_20 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_20 <= Buffer_19;
          end else begin
            Buffer_20 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_20 <= Buffer_19;
      end else begin
        Buffer_20 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h15 == _T_171) begin
          Buffer_21 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_21 <= Buffer_20;
          end else begin
            Buffer_21 <= 8'h0;
          end
        end
      end else begin
        if (6'h15 == addr) begin
          Buffer_21 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_21 <= Buffer_20;
          end else begin
            Buffer_21 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_21 <= Buffer_20;
      end else begin
        Buffer_21 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h16 == _T_171) begin
          Buffer_22 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_22 <= Buffer_21;
          end else begin
            Buffer_22 <= 8'h0;
          end
        end
      end else begin
        if (6'h16 == addr) begin
          Buffer_22 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_22 <= Buffer_21;
          end else begin
            Buffer_22 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_22 <= Buffer_21;
      end else begin
        Buffer_22 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h17 == _T_171) begin
          Buffer_23 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_23 <= Buffer_22;
          end else begin
            Buffer_23 <= 8'h0;
          end
        end
      end else begin
        if (6'h17 == addr) begin
          Buffer_23 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_23 <= Buffer_22;
          end else begin
            Buffer_23 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_23 <= Buffer_22;
      end else begin
        Buffer_23 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h18 == _T_171) begin
          Buffer_24 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_24 <= Buffer_23;
          end else begin
            Buffer_24 <= 8'h0;
          end
        end
      end else begin
        if (6'h18 == addr) begin
          Buffer_24 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_24 <= Buffer_23;
          end else begin
            Buffer_24 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_24 <= Buffer_23;
      end else begin
        Buffer_24 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h19 == _T_171) begin
          Buffer_25 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_25 <= Buffer_24;
          end else begin
            Buffer_25 <= 8'h0;
          end
        end
      end else begin
        if (6'h19 == addr) begin
          Buffer_25 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_25 <= Buffer_24;
          end else begin
            Buffer_25 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_25 <= Buffer_24;
      end else begin
        Buffer_25 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h1a == _T_171) begin
          Buffer_26 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_26 <= Buffer_25;
          end else begin
            Buffer_26 <= 8'h0;
          end
        end
      end else begin
        if (6'h1a == addr) begin
          Buffer_26 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_26 <= Buffer_25;
          end else begin
            Buffer_26 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_26 <= Buffer_25;
      end else begin
        Buffer_26 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h1b == _T_171) begin
          Buffer_27 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_27 <= Buffer_26;
          end else begin
            Buffer_27 <= 8'h0;
          end
        end
      end else begin
        if (6'h1b == addr) begin
          Buffer_27 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_27 <= Buffer_26;
          end else begin
            Buffer_27 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_27 <= Buffer_26;
      end else begin
        Buffer_27 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h1c == _T_171) begin
          Buffer_28 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_28 <= Buffer_27;
          end else begin
            Buffer_28 <= 8'h0;
          end
        end
      end else begin
        if (6'h1c == addr) begin
          Buffer_28 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_28 <= Buffer_27;
          end else begin
            Buffer_28 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_28 <= Buffer_27;
      end else begin
        Buffer_28 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h1d == _T_171) begin
          Buffer_29 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_29 <= Buffer_28;
          end else begin
            Buffer_29 <= 8'h0;
          end
        end
      end else begin
        if (6'h1d == addr) begin
          Buffer_29 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_29 <= Buffer_28;
          end else begin
            Buffer_29 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_29 <= Buffer_28;
      end else begin
        Buffer_29 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h1e == _T_171) begin
          Buffer_30 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_30 <= Buffer_29;
          end else begin
            Buffer_30 <= 8'h0;
          end
        end
      end else begin
        if (6'h1e == addr) begin
          Buffer_30 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_30 <= Buffer_29;
          end else begin
            Buffer_30 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_30 <= Buffer_29;
      end else begin
        Buffer_30 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h1f == _T_171) begin
          Buffer_31 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_31 <= Buffer_30;
          end else begin
            Buffer_31 <= 8'h0;
          end
        end
      end else begin
        if (6'h1f == addr) begin
          Buffer_31 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_31 <= Buffer_30;
          end else begin
            Buffer_31 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_31 <= Buffer_30;
      end else begin
        Buffer_31 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h20 == _T_171) begin
          Buffer_32 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_32 <= Buffer_31;
          end else begin
            Buffer_32 <= 8'h0;
          end
        end
      end else begin
        if (6'h20 == addr) begin
          Buffer_32 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_32 <= Buffer_31;
          end else begin
            Buffer_32 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_32 <= Buffer_31;
      end else begin
        Buffer_32 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h21 == _T_171) begin
          Buffer_33 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_33 <= Buffer_32;
          end else begin
            Buffer_33 <= 8'h0;
          end
        end
      end else begin
        if (6'h21 == addr) begin
          Buffer_33 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_33 <= Buffer_32;
          end else begin
            Buffer_33 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_33 <= Buffer_32;
      end else begin
        Buffer_33 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h22 == _T_171) begin
          Buffer_34 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_34 <= Buffer_33;
          end else begin
            Buffer_34 <= 8'h0;
          end
        end
      end else begin
        if (6'h22 == addr) begin
          Buffer_34 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_34 <= Buffer_33;
          end else begin
            Buffer_34 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_34 <= Buffer_33;
      end else begin
        Buffer_34 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h23 == _T_171) begin
          Buffer_35 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_35 <= Buffer_34;
          end else begin
            Buffer_35 <= 8'h0;
          end
        end
      end else begin
        if (6'h23 == addr) begin
          Buffer_35 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_35 <= Buffer_34;
          end else begin
            Buffer_35 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_35 <= Buffer_34;
      end else begin
        Buffer_35 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h24 == _T_171) begin
          Buffer_36 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_36 <= Buffer_35;
          end else begin
            Buffer_36 <= 8'h0;
          end
        end
      end else begin
        if (6'h24 == addr) begin
          Buffer_36 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_36 <= Buffer_35;
          end else begin
            Buffer_36 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_36 <= Buffer_35;
      end else begin
        Buffer_36 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h25 == _T_171) begin
          Buffer_37 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_37 <= Buffer_36;
          end else begin
            Buffer_37 <= 8'h0;
          end
        end
      end else begin
        if (6'h25 == addr) begin
          Buffer_37 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_37 <= Buffer_36;
          end else begin
            Buffer_37 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_37 <= Buffer_36;
      end else begin
        Buffer_37 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h26 == _T_171) begin
          Buffer_38 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_38 <= Buffer_37;
          end else begin
            Buffer_38 <= 8'h0;
          end
        end
      end else begin
        if (6'h26 == addr) begin
          Buffer_38 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_38 <= Buffer_37;
          end else begin
            Buffer_38 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_38 <= Buffer_37;
      end else begin
        Buffer_38 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h27 == _T_171) begin
          Buffer_39 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_39 <= Buffer_38;
          end else begin
            Buffer_39 <= 8'h0;
          end
        end
      end else begin
        if (6'h27 == addr) begin
          Buffer_39 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_39 <= Buffer_38;
          end else begin
            Buffer_39 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_39 <= Buffer_38;
      end else begin
        Buffer_39 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h28 == _T_171) begin
          Buffer_40 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_40 <= Buffer_39;
          end else begin
            Buffer_40 <= 8'h0;
          end
        end
      end else begin
        if (6'h28 == addr) begin
          Buffer_40 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_40 <= Buffer_39;
          end else begin
            Buffer_40 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_40 <= Buffer_39;
      end else begin
        Buffer_40 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h29 == _T_171) begin
          Buffer_41 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_41 <= Buffer_40;
          end else begin
            Buffer_41 <= 8'h0;
          end
        end
      end else begin
        if (6'h29 == addr) begin
          Buffer_41 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_41 <= Buffer_40;
          end else begin
            Buffer_41 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_41 <= Buffer_40;
      end else begin
        Buffer_41 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h2a == _T_171) begin
          Buffer_42 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_42 <= Buffer_41;
          end else begin
            Buffer_42 <= 8'h0;
          end
        end
      end else begin
        if (6'h2a == addr) begin
          Buffer_42 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_42 <= Buffer_41;
          end else begin
            Buffer_42 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_42 <= Buffer_41;
      end else begin
        Buffer_42 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h2b == _T_171) begin
          Buffer_43 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_43 <= Buffer_42;
          end else begin
            Buffer_43 <= 8'h0;
          end
        end
      end else begin
        if (6'h2b == addr) begin
          Buffer_43 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_43 <= Buffer_42;
          end else begin
            Buffer_43 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_43 <= Buffer_42;
      end else begin
        Buffer_43 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h2c == _T_171) begin
          Buffer_44 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_44 <= Buffer_43;
          end else begin
            Buffer_44 <= 8'h0;
          end
        end
      end else begin
        if (6'h2c == addr) begin
          Buffer_44 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_44 <= Buffer_43;
          end else begin
            Buffer_44 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_44 <= Buffer_43;
      end else begin
        Buffer_44 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h2d == _T_171) begin
          Buffer_45 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_45 <= Buffer_44;
          end else begin
            Buffer_45 <= 8'h0;
          end
        end
      end else begin
        if (6'h2d == addr) begin
          Buffer_45 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_45 <= Buffer_44;
          end else begin
            Buffer_45 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_45 <= Buffer_44;
      end else begin
        Buffer_45 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h2e == _T_171) begin
          Buffer_46 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_46 <= Buffer_45;
          end else begin
            Buffer_46 <= 8'h0;
          end
        end
      end else begin
        if (6'h2e == addr) begin
          Buffer_46 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_46 <= Buffer_45;
          end else begin
            Buffer_46 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_46 <= Buffer_45;
      end else begin
        Buffer_46 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h2f == _T_171) begin
          Buffer_47 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_47 <= Buffer_46;
          end else begin
            Buffer_47 <= 8'h0;
          end
        end
      end else begin
        if (6'h2f == addr) begin
          Buffer_47 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_47 <= Buffer_46;
          end else begin
            Buffer_47 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_47 <= Buffer_46;
      end else begin
        Buffer_47 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h30 == _T_171) begin
          Buffer_48 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_48 <= Buffer_47;
          end else begin
            Buffer_48 <= 8'h0;
          end
        end
      end else begin
        if (6'h30 == addr) begin
          Buffer_48 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_48 <= Buffer_47;
          end else begin
            Buffer_48 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_48 <= Buffer_47;
      end else begin
        Buffer_48 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h31 == _T_171) begin
          Buffer_49 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_49 <= Buffer_48;
          end else begin
            Buffer_49 <= 8'h0;
          end
        end
      end else begin
        if (6'h31 == addr) begin
          Buffer_49 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_49 <= Buffer_48;
          end else begin
            Buffer_49 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_49 <= Buffer_48;
      end else begin
        Buffer_49 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h32 == _T_171) begin
          Buffer_50 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_50 <= Buffer_49;
          end else begin
            Buffer_50 <= 8'h0;
          end
        end
      end else begin
        if (6'h32 == addr) begin
          Buffer_50 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_50 <= Buffer_49;
          end else begin
            Buffer_50 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_50 <= Buffer_49;
      end else begin
        Buffer_50 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h33 == _T_171) begin
          Buffer_51 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_51 <= Buffer_50;
          end else begin
            Buffer_51 <= 8'h0;
          end
        end
      end else begin
        if (6'h33 == addr) begin
          Buffer_51 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_51 <= Buffer_50;
          end else begin
            Buffer_51 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_51 <= Buffer_50;
      end else begin
        Buffer_51 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h34 == _T_171) begin
          Buffer_52 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_52 <= Buffer_51;
          end else begin
            Buffer_52 <= 8'h0;
          end
        end
      end else begin
        if (6'h34 == addr) begin
          Buffer_52 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_52 <= Buffer_51;
          end else begin
            Buffer_52 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_52 <= Buffer_51;
      end else begin
        Buffer_52 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h35 == _T_171) begin
          Buffer_53 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_53 <= Buffer_52;
          end else begin
            Buffer_53 <= 8'h0;
          end
        end
      end else begin
        if (6'h35 == addr) begin
          Buffer_53 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_53 <= Buffer_52;
          end else begin
            Buffer_53 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_53 <= Buffer_52;
      end else begin
        Buffer_53 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h36 == _T_171) begin
          Buffer_54 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_54 <= Buffer_53;
          end else begin
            Buffer_54 <= 8'h0;
          end
        end
      end else begin
        if (6'h36 == addr) begin
          Buffer_54 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_54 <= Buffer_53;
          end else begin
            Buffer_54 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_54 <= Buffer_53;
      end else begin
        Buffer_54 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h37 == _T_171) begin
          Buffer_55 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_55 <= Buffer_54;
          end else begin
            Buffer_55 <= 8'h0;
          end
        end
      end else begin
        if (6'h37 == addr) begin
          Buffer_55 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_55 <= Buffer_54;
          end else begin
            Buffer_55 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_55 <= Buffer_54;
      end else begin
        Buffer_55 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h38 == _T_171) begin
          Buffer_56 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_56 <= Buffer_55;
          end else begin
            Buffer_56 <= 8'h0;
          end
        end
      end else begin
        if (6'h38 == addr) begin
          Buffer_56 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_56 <= Buffer_55;
          end else begin
            Buffer_56 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_56 <= Buffer_55;
      end else begin
        Buffer_56 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h39 == _T_171) begin
          Buffer_57 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_57 <= Buffer_56;
          end else begin
            Buffer_57 <= 8'h0;
          end
        end
      end else begin
        if (6'h39 == addr) begin
          Buffer_57 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_57 <= Buffer_56;
          end else begin
            Buffer_57 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_57 <= Buffer_56;
      end else begin
        Buffer_57 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h3a == _T_171) begin
          Buffer_58 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_58 <= Buffer_57;
          end else begin
            Buffer_58 <= 8'h0;
          end
        end
      end else begin
        if (6'h3a == addr) begin
          Buffer_58 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_58 <= Buffer_57;
          end else begin
            Buffer_58 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_58 <= Buffer_57;
      end else begin
        Buffer_58 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h3b == _T_171) begin
          Buffer_59 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_59 <= Buffer_58;
          end else begin
            Buffer_59 <= 8'h0;
          end
        end
      end else begin
        if (6'h3b == addr) begin
          Buffer_59 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_59 <= Buffer_58;
          end else begin
            Buffer_59 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_59 <= Buffer_58;
      end else begin
        Buffer_59 <= 8'h0;
      end
    end
    if (io_in_valid) begin
      if (_T_154) begin
        if (6'h3c == _T_171) begin
          Buffer_60 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_60 <= Buffer_59;
          end else begin
            Buffer_60 <= 8'h0;
          end
        end
      end else begin
        if (6'h3c == addr) begin
          Buffer_60 <= io_dIn;
        end else begin
          if (_T_152) begin
            Buffer_60 <= Buffer_59;
          end else begin
            Buffer_60 <= 8'h0;
          end
        end
      end
    end else begin
      if (_T_152) begin
        Buffer_60 <= Buffer_59;
      end else begin
        Buffer_60 <= 8'h0;
      end
    end
    if (reset) begin
      addr <= 6'h3c;
    end else begin
      if (io_in_valid) begin
        if (_T_154) begin
          if (_T_182) begin
            addr <= 6'h0;
          end else begin
            if (_T_159) begin
              addr <= _T_167;
            end else begin
              addr <= _T_171;
            end
          end
        end
      end
    end
    if (reset) begin
      value <= 4'h0;
    end else begin
      if (io_in_valid) begin
        value <= _T_87;
      end
    end
    _T_152 <= io_in_valid;
  end
endmodule
module G_gen( // @[:@674.2]
  input        clock, // @[:@675.4]
  input        reset, // @[:@676.4]
  input        io_input_valid, // @[:@677.4]
  output [7:0] io_dOut_0, // @[:@677.4]
  output [7:0] io_dOut_1, // @[:@677.4]
  output [7:0] io_dOut_2, // @[:@677.4]
  output [7:0] io_dOut_3 // @[:@677.4]
);
  reg [1:0] value; // @[Counter.scala 26:33:@679.4]
  reg [31:0] _RAND_0;
  wire  _T_28; // @[Counter.scala 34:24:@681.6]
  wire [2:0] _T_30; // @[Counter.scala 35:22:@682.6]
  wire [1:0] _T_31; // @[Counter.scala 35:22:@683.6]
  wire [1:0] _GEN_0; // @[Counter.scala 63:17:@680.4]
  wire  _T_33; // @[SRAM.scala 193:13:@688.6]
  wire  _T_39; // @[SRAM.scala 198:19:@696.8]
  wire  _T_45; // @[SRAM.scala 203:19:@704.10]
  wire [4:0] _GEN_1; // @[SRAM.scala 208:26:@713.12]
  wire [5:0] _GEN_2; // @[SRAM.scala 208:26:@713.12]
  wire [4:0] _GEN_3; // @[SRAM.scala 208:26:@713.12]
  wire [5:0] _GEN_4; // @[SRAM.scala 208:26:@713.12]
  wire [4:0] _GEN_5; // @[SRAM.scala 203:26:@705.10]
  wire [5:0] _GEN_6; // @[SRAM.scala 203:26:@705.10]
  wire [4:0] _GEN_7; // @[SRAM.scala 203:26:@705.10]
  wire [5:0] _GEN_8; // @[SRAM.scala 203:26:@705.10]
  wire [4:0] _GEN_9; // @[SRAM.scala 198:26:@697.8]
  wire [5:0] _GEN_10; // @[SRAM.scala 198:26:@697.8]
  wire [4:0] _GEN_11; // @[SRAM.scala 198:26:@697.8]
  wire [5:0] _GEN_12; // @[SRAM.scala 198:26:@697.8]
  wire [4:0] _GEN_13; // @[SRAM.scala 193:20:@689.6]
  wire [5:0] _GEN_14; // @[SRAM.scala 193:20:@689.6]
  wire [4:0] _GEN_15; // @[SRAM.scala 193:20:@689.6]
  wire [5:0] _GEN_16; // @[SRAM.scala 193:20:@689.6]
  wire [4:0] _GEN_17; // @[SRAM.scala 192:23:@687.4]
  wire [5:0] _GEN_18; // @[SRAM.scala 192:23:@687.4]
  wire [4:0] _GEN_19; // @[SRAM.scala 192:23:@687.4]
  wire [5:0] _GEN_20; // @[SRAM.scala 192:23:@687.4]
  assign _T_28 = value == 2'h3; // @[Counter.scala 34:24:@681.6]
  assign _T_30 = value + 2'h1; // @[Counter.scala 35:22:@682.6]
  assign _T_31 = _T_30[1:0]; // @[Counter.scala 35:22:@683.6]
  assign _GEN_0 = io_input_valid ? _T_31 : value; // @[Counter.scala 63:17:@680.4]
  assign _T_33 = value == 2'h0; // @[SRAM.scala 193:13:@688.6]
  assign _T_39 = value == 2'h1; // @[SRAM.scala 198:19:@696.8]
  assign _T_45 = value == 2'h2; // @[SRAM.scala 203:19:@704.10]
  assign _GEN_1 = _T_28 ? 5'h1c : 5'h0; // @[SRAM.scala 208:26:@713.12]
  assign _GEN_2 = _T_28 ? 6'h30 : 6'h0; // @[SRAM.scala 208:26:@713.12]
  assign _GEN_3 = _T_28 ? 5'h10 : 5'h0; // @[SRAM.scala 208:26:@713.12]
  assign _GEN_4 = _T_28 ? 6'h24 : 6'h0; // @[SRAM.scala 208:26:@713.12]
  assign _GEN_5 = _T_45 ? 5'h8 : _GEN_1; // @[SRAM.scala 203:26:@705.10]
  assign _GEN_6 = _T_45 ? 6'hf : _GEN_2; // @[SRAM.scala 203:26:@705.10]
  assign _GEN_7 = _T_45 ? 5'h5 : _GEN_3; // @[SRAM.scala 203:26:@705.10]
  assign _GEN_8 = _T_45 ? 6'hc : _GEN_4; // @[SRAM.scala 203:26:@705.10]
  assign _GEN_9 = _T_39 ? 5'h18 : _GEN_5; // @[SRAM.scala 198:26:@697.8]
  assign _GEN_10 = _T_39 ? 6'h2d : _GEN_6; // @[SRAM.scala 198:26:@697.8]
  assign _GEN_11 = _T_39 ? 5'hf : _GEN_7; // @[SRAM.scala 198:26:@697.8]
  assign _GEN_12 = _T_39 ? 6'h24 : _GEN_8; // @[SRAM.scala 198:26:@697.8]
  assign _GEN_13 = _T_33 ? 5'h4 : _GEN_9; // @[SRAM.scala 193:20:@689.6]
  assign _GEN_14 = _T_33 ? 6'hc : _GEN_10; // @[SRAM.scala 193:20:@689.6]
  assign _GEN_15 = _T_33 ? 5'h4 : _GEN_11; // @[SRAM.scala 193:20:@689.6]
  assign _GEN_16 = _T_33 ? 6'hc : _GEN_12; // @[SRAM.scala 193:20:@689.6]
  assign _GEN_17 = io_input_valid ? _GEN_13 : 5'h0; // @[SRAM.scala 192:23:@687.4]
  assign _GEN_18 = io_input_valid ? _GEN_14 : 6'h0; // @[SRAM.scala 192:23:@687.4]
  assign _GEN_19 = io_input_valid ? _GEN_15 : 5'h0; // @[SRAM.scala 192:23:@687.4]
  assign _GEN_20 = io_input_valid ? _GEN_16 : 6'h0; // @[SRAM.scala 192:23:@687.4]
  assign io_dOut_0 = {{2'd0}, _GEN_20}; // @[SRAM.scala 197:17:@693.8 SRAM.scala 202:17:@701.10 SRAM.scala 207:17:@709.12 SRAM.scala 212:17:@717.14 SRAM.scala 214:17:@720.14 SRAM.scala 220:15:@727.6]
  assign io_dOut_1 = {{3'd0}, _GEN_19}; // @[SRAM.scala 196:17:@692.8 SRAM.scala 201:17:@700.10 SRAM.scala 206:17:@708.12 SRAM.scala 211:17:@716.14 SRAM.scala 215:17:@721.14 SRAM.scala 221:15:@728.6]
  assign io_dOut_2 = {{2'd0}, _GEN_18}; // @[SRAM.scala 195:17:@691.8 SRAM.scala 200:17:@699.10 SRAM.scala 205:17:@707.12 SRAM.scala 210:17:@715.14 SRAM.scala 216:17:@722.14 SRAM.scala 222:15:@729.6]
  assign io_dOut_3 = {{3'd0}, _GEN_17}; // @[SRAM.scala 194:17:@690.8 SRAM.scala 199:17:@698.10 SRAM.scala 204:17:@706.12 SRAM.scala 209:17:@714.14 SRAM.scala 217:17:@723.14 SRAM.scala 223:15:@730.6]
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
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      value <= 2'h0;
    end else begin
      if (io_input_valid) begin
        value <= _T_31;
      end
    end
  end
endmodule
module Rank_Change( // @[:@850.2]
  input        clock, // @[:@851.4]
  input        reset, // @[:@852.4]
  input        io_input_valid, // @[:@853.4]
  input  [7:0] io_dIn_0, // @[:@853.4]
  input  [7:0] io_dIn_1, // @[:@853.4]
  input  [7:0] io_dIn_2, // @[:@853.4]
  input  [7:0] io_dIn_3, // @[:@853.4]
  input  [7:0] io_dIn_4, // @[:@853.4]
  input  [7:0] io_dIn_5, // @[:@853.4]
  output [7:0] io_dOut_0, // @[:@853.4]
  output [7:0] io_dOut_1, // @[:@853.4]
  output [7:0] io_dOut_2, // @[:@853.4]
  output [7:0] io_dOut_3, // @[:@853.4]
  output       io_output_valid // @[:@853.4]
);
  wire  Conter_pause_clock; // @[Rank_Chang.scala 38:20:@870.4]
  wire  Conter_pause_reset; // @[Rank_Chang.scala 38:20:@870.4]
  wire  Conter_pause_io_valid; // @[Rank_Chang.scala 38:20:@870.4]
  wire [7:0] Conter_pause_io_goal_num; // @[Rank_Chang.scala 38:20:@870.4]
  wire  Conter_pause_io_pulse; // @[Rank_Chang.scala 38:20:@870.4]
  wire [7:0] Conter_pause_io_cnt; // @[Rank_Chang.scala 38:20:@870.4]
  wire  Conter_pause_io_out_valid; // @[Rank_Chang.scala 38:20:@870.4]
  wire  Conter_pause_1_clock; // @[Rank_Chang.scala 38:20:@876.4]
  wire  Conter_pause_1_reset; // @[Rank_Chang.scala 38:20:@876.4]
  wire  Conter_pause_1_io_valid; // @[Rank_Chang.scala 38:20:@876.4]
  wire [7:0] Conter_pause_1_io_goal_num; // @[Rank_Chang.scala 38:20:@876.4]
  wire  Conter_pause_1_io_pulse; // @[Rank_Chang.scala 38:20:@876.4]
  wire [7:0] Conter_pause_1_io_cnt; // @[Rank_Chang.scala 38:20:@876.4]
  wire  Conter_pause_1_io_out_valid; // @[Rank_Chang.scala 38:20:@876.4]
  wire  Conter_pause_2_clock; // @[Rank_Chang.scala 38:20:@950.4]
  wire  Conter_pause_2_reset; // @[Rank_Chang.scala 38:20:@950.4]
  wire  Conter_pause_2_io_valid; // @[Rank_Chang.scala 38:20:@950.4]
  wire [7:0] Conter_pause_2_io_goal_num; // @[Rank_Chang.scala 38:20:@950.4]
  wire  Conter_pause_2_io_pulse; // @[Rank_Chang.scala 38:20:@950.4]
  wire [7:0] Conter_pause_2_io_cnt; // @[Rank_Chang.scala 38:20:@950.4]
  wire  Conter_pause_2_io_out_valid; // @[Rank_Chang.scala 38:20:@950.4]
  reg  in_valid; // @[Rank_Chang.scala 63:25:@860.4]
  reg [31:0] _RAND_0;
  reg  value; // @[Counter.scala 26:33:@862.4]
  reg [31:0] _RAND_1;
  wire [1:0] _T_68; // @[Counter.scala 35:22:@865.6]
  wire  _T_69; // @[Counter.scala 35:22:@866.6]
  wire  _GEN_0; // @[Counter.scala 63:17:@863.4]
  wire  _T_73; // @[Rank_Chang.scala 74:23:@883.6]
  wire  _T_75; // @[Rank_Chang.scala 79:29:@891.8]
  wire  _T_77; // @[Rank_Chang.scala 84:29:@899.10]
  wire [7:0] _GEN_1; // @[Rank_Chang.scala 84:36:@900.10]
  wire [7:0] _GEN_2; // @[Rank_Chang.scala 84:36:@900.10]
  wire [7:0] _GEN_3; // @[Rank_Chang.scala 84:36:@900.10]
  wire [7:0] _GEN_4; // @[Rank_Chang.scala 84:36:@900.10]
  wire [7:0] _GEN_5; // @[Rank_Chang.scala 79:36:@892.8]
  wire [7:0] _GEN_6; // @[Rank_Chang.scala 79:36:@892.8]
  wire [7:0] _GEN_7; // @[Rank_Chang.scala 79:36:@892.8]
  wire [7:0] _GEN_8; // @[Rank_Chang.scala 79:36:@892.8]
  wire [7:0] _GEN_9; // @[Rank_Chang.scala 74:30:@884.6]
  wire [7:0] _GEN_10; // @[Rank_Chang.scala 74:30:@884.6]
  wire [7:0] _GEN_11; // @[Rank_Chang.scala 74:30:@884.6]
  wire [7:0] _GEN_12; // @[Rank_Chang.scala 74:30:@884.6]
  reg [7:0] _T_79; // @[Rank_Chang.scala 92:33:@908.6]
  reg [31:0] _RAND_2;
  reg [7:0] _T_81; // @[Rank_Chang.scala 92:33:@911.6]
  reg [31:0] _RAND_3;
  reg [7:0] _T_83; // @[Rank_Chang.scala 92:33:@914.6]
  reg [31:0] _RAND_4;
  reg [7:0] _T_85; // @[Rank_Chang.scala 92:33:@917.6]
  reg [31:0] _RAND_5;
  wire [7:0] out_temp_0; // @[Rank_Chang.scala 73:17:@882.4]
  wire [7:0] out_temp_1; // @[Rank_Chang.scala 73:17:@882.4]
  wire [7:0] out_temp_2; // @[Rank_Chang.scala 73:17:@882.4]
  wire [7:0] out_temp_3; // @[Rank_Chang.scala 73:17:@882.4]
  wire  _T_161; // @[Rank_Chang.scala 195:18:@957.6]
  wire  _T_163; // @[Rank_Chang.scala 199:24:@965.8]
  wire [7:0] _GEN_17; // @[Rank_Chang.scala 199:31:@966.8]
  wire [7:0] _GEN_18; // @[Rank_Chang.scala 199:31:@966.8]
  wire [7:0] _GEN_19; // @[Rank_Chang.scala 199:31:@966.8]
  wire [7:0] _GEN_20; // @[Rank_Chang.scala 199:31:@966.8]
  wire [7:0] _GEN_21; // @[Rank_Chang.scala 195:25:@958.6]
  wire [7:0] _GEN_22; // @[Rank_Chang.scala 195:25:@958.6]
  wire [7:0] _GEN_23; // @[Rank_Chang.scala 195:25:@958.6]
  wire [7:0] _GEN_24; // @[Rank_Chang.scala 195:25:@958.6]
  wire [7:0] _GEN_25; // @[Rank_Chang.scala 195:25:@958.6]
  wire [7:0] _GEN_26; // @[Rank_Chang.scala 195:25:@958.6]
  wire [7:0] _GEN_27; // @[Rank_Chang.scala 195:25:@958.6]
  wire [7:0] _GEN_28; // @[Rank_Chang.scala 195:25:@958.6]
  reg [7:0] _T_166; // @[Reg.scala 11:16:@972.6]
  reg [31:0] _RAND_6;
  reg [7:0] _T_168; // @[Reg.scala 11:16:@976.6]
  reg [31:0] _RAND_7;
  reg [7:0] _T_170; // @[Reg.scala 11:16:@980.6]
  reg [31:0] _RAND_8;
  reg [7:0] _T_172; // @[Reg.scala 11:16:@984.6]
  reg [31:0] _RAND_9;
  reg [7:0] _T_175; // @[Reg.scala 11:16:@989.6]
  reg [31:0] _RAND_10;
  wire [7:0] reg_4_0; // @[Rank_Chang.scala 194:17:@956.4]
  reg [7:0] _T_177; // @[Reg.scala 11:16:@993.6]
  reg [31:0] _RAND_11;
  reg [7:0] _T_180; // @[Reg.scala 11:16:@998.6]
  reg [31:0] _RAND_12;
  reg [7:0] _T_182; // @[Reg.scala 11:16:@1002.6]
  reg [31:0] _RAND_13;
  reg [7:0] _T_184; // @[Reg.scala 11:16:@1006.6]
  reg [31:0] _RAND_14;
  reg [7:0] _T_186; // @[Reg.scala 11:16:@1010.6]
  reg [31:0] _RAND_15;
  reg [7:0] _T_189; // @[Reg.scala 11:16:@1015.6]
  reg [31:0] _RAND_16;
  wire [7:0] reg_4_1; // @[Rank_Chang.scala 194:17:@956.4]
  reg [7:0] _T_191; // @[Reg.scala 11:16:@1019.6]
  reg [31:0] _RAND_17;
  reg [7:0] _T_194; // @[Reg.scala 11:16:@1024.6]
  reg [31:0] _RAND_18;
  reg [7:0] _T_196; // @[Reg.scala 11:16:@1028.6]
  reg [31:0] _RAND_19;
  reg [7:0] _T_198; // @[Reg.scala 11:16:@1032.6]
  reg [31:0] _RAND_20;
  reg [7:0] _T_200; // @[Reg.scala 11:16:@1036.6]
  reg [31:0] _RAND_21;
  reg [7:0] _T_203; // @[Reg.scala 11:16:@1041.6]
  reg [31:0] _RAND_22;
  wire [7:0] reg_4_2; // @[Rank_Chang.scala 194:17:@956.4]
  reg [7:0] _T_205; // @[Reg.scala 11:16:@1045.6]
  reg [31:0] _RAND_23;
  reg [7:0] _T_208; // @[Reg.scala 11:16:@1050.6]
  reg [31:0] _RAND_24;
  reg [7:0] _T_210; // @[Reg.scala 11:16:@1054.6]
  reg [31:0] _RAND_25;
  reg [7:0] _T_212; // @[Reg.scala 11:16:@1058.6]
  reg [31:0] _RAND_26;
  reg [7:0] _T_214; // @[Reg.scala 11:16:@1062.6]
  reg [31:0] _RAND_27;
  reg [7:0] _T_217; // @[Reg.scala 11:16:@1067.6]
  reg [31:0] _RAND_28;
  wire [7:0] reg_4_3; // @[Rank_Chang.scala 194:17:@956.4]
  reg [7:0] _T_219; // @[Reg.scala 11:16:@1071.6]
  reg [31:0] _RAND_29;
  wire [7:0] reg_1_0; // @[Rank_Chang.scala 194:17:@956.4]
  wire [7:0] reg_2_0; // @[Rank_Chang.scala 194:17:@956.4]
  wire [7:0] reg_1_1; // @[Rank_Chang.scala 194:17:@956.4]
  wire [7:0] reg_2_1; // @[Rank_Chang.scala 194:17:@956.4]
  wire [7:0] reg_1_2; // @[Rank_Chang.scala 194:17:@956.4]
  wire [7:0] reg_2_2; // @[Rank_Chang.scala 194:17:@956.4]
  wire [7:0] reg_1_3; // @[Rank_Chang.scala 194:17:@956.4]
  wire [7:0] reg_2_3; // @[Rank_Chang.scala 194:17:@956.4]
  wire  _T_221; // @[Rank_Chang.scala 211:14:@1077.4]
  wire  _T_223; // @[Rank_Chang.scala 211:28:@1078.4]
  wire  _T_224; // @[Rank_Chang.scala 211:20:@1079.4]
  reg [1:0] value_1; // @[Counter.scala 26:33:@1086.4]
  reg [31:0] _RAND_30;
  wire [2:0] _T_232; // @[Counter.scala 35:22:@1089.6]
  wire [1:0] _T_233; // @[Counter.scala 35:22:@1090.6]
  wire [1:0] _GEN_70; // @[Counter.scala 63:17:@1087.4]
  wire  _T_235; // @[Rank_Chang.scala 219:17:@1095.6]
  wire  _T_237; // @[Rank_Chang.scala 223:23:@1103.8]
  wire  _T_239; // @[Rank_Chang.scala 227:23:@1111.10]
  reg [7:0] _T_242; // @[Reg.scala 11:16:@1113.12]
  reg [31:0] _RAND_31;
  reg [7:0] _T_244; // @[Reg.scala 11:16:@1117.12]
  reg [31:0] _RAND_32;
  reg [7:0] _T_247; // @[Reg.scala 11:16:@1122.12]
  reg [31:0] _RAND_33;
  reg [7:0] _T_249; // @[Reg.scala 11:16:@1126.12]
  reg [31:0] _RAND_34;
  reg [7:0] _T_252; // @[Reg.scala 11:16:@1131.12]
  reg [31:0] _RAND_35;
  reg [7:0] _T_254; // @[Reg.scala 11:16:@1135.12]
  reg [31:0] _RAND_36;
  reg [7:0] _T_257; // @[Reg.scala 11:16:@1140.12]
  reg [31:0] _RAND_37;
  reg [7:0] _T_259; // @[Reg.scala 11:16:@1144.12]
  reg [31:0] _RAND_38;
  wire [7:0] _GEN_79; // @[Rank_Chang.scala 227:30:@1112.10]
  wire [7:0] _GEN_80; // @[Rank_Chang.scala 227:30:@1112.10]
  wire [7:0] _GEN_81; // @[Rank_Chang.scala 227:30:@1112.10]
  wire [7:0] _GEN_82; // @[Rank_Chang.scala 227:30:@1112.10]
  wire [7:0] _GEN_83; // @[Rank_Chang.scala 223:30:@1104.8]
  wire [7:0] _GEN_84; // @[Rank_Chang.scala 223:30:@1104.8]
  wire [7:0] _GEN_85; // @[Rank_Chang.scala 223:30:@1104.8]
  wire [7:0] _GEN_86; // @[Rank_Chang.scala 223:30:@1104.8]
  wire [7:0] _GEN_87; // @[Rank_Chang.scala 219:24:@1096.6]
  wire [7:0] _GEN_88; // @[Rank_Chang.scala 219:24:@1096.6]
  wire [7:0] _GEN_89; // @[Rank_Chang.scala 219:24:@1096.6]
  wire [7:0] _GEN_90; // @[Rank_Chang.scala 219:24:@1096.6]
  Conter_pause Conter_pause ( // @[Rank_Chang.scala 38:20:@870.4]
    .clock(Conter_pause_clock),
    .reset(Conter_pause_reset),
    .io_valid(Conter_pause_io_valid),
    .io_goal_num(Conter_pause_io_goal_num),
    .io_pulse(Conter_pause_io_pulse),
    .io_cnt(Conter_pause_io_cnt),
    .io_out_valid(Conter_pause_io_out_valid)
  );
  Conter_pause Conter_pause_1 ( // @[Rank_Chang.scala 38:20:@876.4]
    .clock(Conter_pause_1_clock),
    .reset(Conter_pause_1_reset),
    .io_valid(Conter_pause_1_io_valid),
    .io_goal_num(Conter_pause_1_io_goal_num),
    .io_pulse(Conter_pause_1_io_pulse),
    .io_cnt(Conter_pause_1_io_cnt),
    .io_out_valid(Conter_pause_1_io_out_valid)
  );
  Conter_pause Conter_pause_2 ( // @[Rank_Chang.scala 38:20:@950.4]
    .clock(Conter_pause_2_clock),
    .reset(Conter_pause_2_reset),
    .io_valid(Conter_pause_2_io_valid),
    .io_goal_num(Conter_pause_2_io_goal_num),
    .io_pulse(Conter_pause_2_io_pulse),
    .io_cnt(Conter_pause_2_io_cnt),
    .io_out_valid(Conter_pause_2_io_out_valid)
  );
  assign _T_68 = value + 1'h1; // @[Counter.scala 35:22:@865.6]
  assign _T_69 = _T_68[0:0]; // @[Counter.scala 35:22:@866.6]
  assign _GEN_0 = in_valid ? _T_69 : value; // @[Counter.scala 63:17:@863.4]
  assign _T_73 = Conter_pause_1_io_cnt == 8'h0; // @[Rank_Chang.scala 74:23:@883.6]
  assign _T_75 = Conter_pause_1_io_cnt == 8'h1; // @[Rank_Chang.scala 79:29:@891.8]
  assign _T_77 = Conter_pause_1_io_cnt == 8'h2; // @[Rank_Chang.scala 84:29:@899.10]
  assign _GEN_1 = _T_77 ? io_dIn_4 : 8'h0; // @[Rank_Chang.scala 84:36:@900.10]
  assign _GEN_2 = _T_77 ? io_dIn_5 : 8'h0; // @[Rank_Chang.scala 84:36:@900.10]
  assign _GEN_3 = _T_77 ? io_dIn_0 : 8'h0; // @[Rank_Chang.scala 84:36:@900.10]
  assign _GEN_4 = _T_77 ? io_dIn_1 : 8'h0; // @[Rank_Chang.scala 84:36:@900.10]
  assign _GEN_5 = _T_75 ? io_dIn_2 : _GEN_1; // @[Rank_Chang.scala 79:36:@892.8]
  assign _GEN_6 = _T_75 ? io_dIn_3 : _GEN_2; // @[Rank_Chang.scala 79:36:@892.8]
  assign _GEN_7 = _T_75 ? io_dIn_4 : _GEN_3; // @[Rank_Chang.scala 79:36:@892.8]
  assign _GEN_8 = _T_75 ? io_dIn_5 : _GEN_4; // @[Rank_Chang.scala 79:36:@892.8]
  assign _GEN_9 = _T_73 ? io_dIn_0 : _GEN_5; // @[Rank_Chang.scala 74:30:@884.6]
  assign _GEN_10 = _T_73 ? io_dIn_1 : _GEN_6; // @[Rank_Chang.scala 74:30:@884.6]
  assign _GEN_11 = _T_73 ? io_dIn_2 : _GEN_7; // @[Rank_Chang.scala 74:30:@884.6]
  assign _GEN_12 = _T_73 ? io_dIn_3 : _GEN_8; // @[Rank_Chang.scala 74:30:@884.6]
  assign out_temp_0 = in_valid ? _GEN_9 : _T_79; // @[Rank_Chang.scala 73:17:@882.4]
  assign out_temp_1 = in_valid ? _GEN_10 : _T_81; // @[Rank_Chang.scala 73:17:@882.4]
  assign out_temp_2 = in_valid ? _GEN_11 : _T_83; // @[Rank_Chang.scala 73:17:@882.4]
  assign out_temp_3 = in_valid ? _GEN_12 : _T_85; // @[Rank_Chang.scala 73:17:@882.4]
  assign _T_161 = Conter_pause_2_io_cnt == 8'h0; // @[Rank_Chang.scala 195:18:@957.6]
  assign _T_163 = Conter_pause_2_io_cnt == 8'h1; // @[Rank_Chang.scala 199:24:@965.8]
  assign _GEN_17 = _T_163 ? out_temp_0 : 8'h0; // @[Rank_Chang.scala 199:31:@966.8]
  assign _GEN_18 = _T_163 ? out_temp_1 : 8'h0; // @[Rank_Chang.scala 199:31:@966.8]
  assign _GEN_19 = _T_163 ? out_temp_2 : 8'h0; // @[Rank_Chang.scala 199:31:@966.8]
  assign _GEN_20 = _T_163 ? out_temp_3 : 8'h0; // @[Rank_Chang.scala 199:31:@966.8]
  assign _GEN_21 = _T_161 ? out_temp_0 : 8'h0; // @[Rank_Chang.scala 195:25:@958.6]
  assign _GEN_22 = _T_161 ? out_temp_1 : 8'h0; // @[Rank_Chang.scala 195:25:@958.6]
  assign _GEN_23 = _T_161 ? out_temp_2 : 8'h0; // @[Rank_Chang.scala 195:25:@958.6]
  assign _GEN_24 = _T_161 ? out_temp_3 : 8'h0; // @[Rank_Chang.scala 195:25:@958.6]
  assign _GEN_25 = _T_161 ? 8'h0 : _GEN_17; // @[Rank_Chang.scala 195:25:@958.6]
  assign _GEN_26 = _T_161 ? 8'h0 : _GEN_18; // @[Rank_Chang.scala 195:25:@958.6]
  assign _GEN_27 = _T_161 ? 8'h0 : _GEN_19; // @[Rank_Chang.scala 195:25:@958.6]
  assign _GEN_28 = _T_161 ? 8'h0 : _GEN_20; // @[Rank_Chang.scala 195:25:@958.6]
  assign reg_4_0 = in_valid ? _GEN_25 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign reg_4_1 = in_valid ? _GEN_26 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign reg_4_2 = in_valid ? _GEN_27 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign reg_4_3 = in_valid ? _GEN_28 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign reg_1_0 = in_valid ? _T_172 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign reg_2_0 = in_valid ? _T_177 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign reg_1_1 = in_valid ? _T_186 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign reg_2_1 = in_valid ? _T_191 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign reg_1_2 = in_valid ? _T_200 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign reg_2_2 = in_valid ? _T_205 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign reg_1_3 = in_valid ? _T_214 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign reg_2_3 = in_valid ? _T_219 : 8'h0; // @[Rank_Chang.scala 194:17:@956.4]
  assign _T_221 = Conter_pause_io_cnt == 8'h0; // @[Rank_Chang.scala 211:14:@1077.4]
  assign _T_223 = Conter_pause_io_cnt == 8'h1; // @[Rank_Chang.scala 211:28:@1078.4]
  assign _T_224 = _T_221 | _T_223; // @[Rank_Chang.scala 211:20:@1079.4]
  assign _T_232 = value_1 + 2'h1; // @[Counter.scala 35:22:@1089.6]
  assign _T_233 = _T_232[1:0]; // @[Counter.scala 35:22:@1090.6]
  assign _GEN_70 = io_output_valid ? _T_233 : value_1; // @[Counter.scala 63:17:@1087.4]
  assign _T_235 = value_1 == 2'h0; // @[Rank_Chang.scala 219:17:@1095.6]
  assign _T_237 = value_1 == 2'h1; // @[Rank_Chang.scala 223:23:@1103.8]
  assign _T_239 = value_1 == 2'h2; // @[Rank_Chang.scala 227:23:@1111.10]
  assign _GEN_79 = _T_239 ? _T_244 : reg_4_0; // @[Rank_Chang.scala 227:30:@1112.10]
  assign _GEN_80 = _T_239 ? _T_249 : reg_4_1; // @[Rank_Chang.scala 227:30:@1112.10]
  assign _GEN_81 = _T_239 ? _T_254 : reg_4_2; // @[Rank_Chang.scala 227:30:@1112.10]
  assign _GEN_82 = _T_239 ? _T_259 : reg_4_3; // @[Rank_Chang.scala 227:30:@1112.10]
  assign _GEN_83 = _T_237 ? reg_2_0 : _GEN_79; // @[Rank_Chang.scala 223:30:@1104.8]
  assign _GEN_84 = _T_237 ? reg_2_1 : _GEN_80; // @[Rank_Chang.scala 223:30:@1104.8]
  assign _GEN_85 = _T_237 ? reg_2_2 : _GEN_81; // @[Rank_Chang.scala 223:30:@1104.8]
  assign _GEN_86 = _T_237 ? reg_2_3 : _GEN_82; // @[Rank_Chang.scala 223:30:@1104.8]
  assign _GEN_87 = _T_235 ? reg_1_0 : _GEN_83; // @[Rank_Chang.scala 219:24:@1096.6]
  assign _GEN_88 = _T_235 ? reg_1_1 : _GEN_84; // @[Rank_Chang.scala 219:24:@1096.6]
  assign _GEN_89 = _T_235 ? reg_1_2 : _GEN_85; // @[Rank_Chang.scala 219:24:@1096.6]
  assign _GEN_90 = _T_235 ? reg_1_3 : _GEN_86; // @[Rank_Chang.scala 219:24:@1096.6]
  assign io_dOut_0 = io_output_valid ? _GEN_87 : 8'h0; // @[Rank_Chang.scala 221:19:@1097.8 Rank_Chang.scala 225:19:@1105.10 Rank_Chang.scala 229:19:@1121.12 Rank_Chang.scala 233:19:@1151.12 Rank_Chang.scala 238:17:@1158.6]
  assign io_dOut_1 = io_output_valid ? _GEN_88 : 8'h0; // @[Rank_Chang.scala 221:19:@1098.8 Rank_Chang.scala 225:19:@1106.10 Rank_Chang.scala 229:19:@1130.12 Rank_Chang.scala 233:19:@1152.12 Rank_Chang.scala 238:17:@1159.6]
  assign io_dOut_2 = io_output_valid ? _GEN_89 : 8'h0; // @[Rank_Chang.scala 221:19:@1099.8 Rank_Chang.scala 225:19:@1107.10 Rank_Chang.scala 229:19:@1139.12 Rank_Chang.scala 233:19:@1153.12 Rank_Chang.scala 238:17:@1160.6]
  assign io_dOut_3 = io_output_valid ? _GEN_90 : 8'h0; // @[Rank_Chang.scala 221:19:@1100.8 Rank_Chang.scala 225:19:@1108.10 Rank_Chang.scala 229:19:@1148.12 Rank_Chang.scala 233:19:@1154.12 Rank_Chang.scala 238:17:@1161.6]
  assign io_output_valid = _T_224 ? 1'h0 : 1'h1; // @[Rank_Chang.scala 212:20:@1081.6 Rank_Chang.scala 214:20:@1084.6]
  assign Conter_pause_clock = clock; // @[:@871.4]
  assign Conter_pause_reset = reset; // @[:@872.4]
  assign Conter_pause_io_valid = in_valid; // @[Rank_Chang.scala 39:18:@873.4]
  assign Conter_pause_io_goal_num = 8'h12; // @[Rank_Chang.scala 40:21:@874.4]
  assign Conter_pause_io_pulse = in_valid & value; // @[Rank_Chang.scala 41:18:@875.4]
  assign Conter_pause_1_clock = clock; // @[:@877.4]
  assign Conter_pause_1_reset = reset; // @[:@878.4]
  assign Conter_pause_1_io_valid = in_valid; // @[Rank_Chang.scala 39:18:@879.4]
  assign Conter_pause_1_io_goal_num = 8'h3; // @[Rank_Chang.scala 40:21:@880.4]
  assign Conter_pause_1_io_pulse = Conter_pause_io_out_valid; // @[Rank_Chang.scala 41:18:@881.4]
  assign Conter_pause_2_clock = clock; // @[:@951.4]
  assign Conter_pause_2_reset = reset; // @[:@952.4]
  assign Conter_pause_2_io_valid = in_valid; // @[Rank_Chang.scala 39:18:@953.4]
  assign Conter_pause_2_io_goal_num = 8'h2; // @[Rank_Chang.scala 40:21:@954.4]
  assign Conter_pause_2_io_pulse = in_valid & value; // @[Rank_Chang.scala 41:18:@955.4]
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
  in_valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  value = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_79 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  _T_81 = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  _T_83 = _RAND_4[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  _T_85 = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  _T_166 = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  _T_168 = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  _T_170 = _RAND_8[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  _T_172 = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  _T_175 = _RAND_10[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  _T_177 = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  _T_180 = _RAND_12[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  _T_182 = _RAND_13[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  _T_184 = _RAND_14[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  _T_186 = _RAND_15[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  _T_189 = _RAND_16[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  _T_191 = _RAND_17[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{$random}};
  _T_194 = _RAND_18[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{$random}};
  _T_196 = _RAND_19[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{$random}};
  _T_198 = _RAND_20[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{$random}};
  _T_200 = _RAND_21[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{$random}};
  _T_203 = _RAND_22[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{$random}};
  _T_205 = _RAND_23[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{$random}};
  _T_208 = _RAND_24[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{$random}};
  _T_210 = _RAND_25[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{$random}};
  _T_212 = _RAND_26[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{$random}};
  _T_214 = _RAND_27[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{$random}};
  _T_217 = _RAND_28[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{$random}};
  _T_219 = _RAND_29[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{$random}};
  value_1 = _RAND_30[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{$random}};
  _T_242 = _RAND_31[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{$random}};
  _T_244 = _RAND_32[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{$random}};
  _T_247 = _RAND_33[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{$random}};
  _T_249 = _RAND_34[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{$random}};
  _T_252 = _RAND_35[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{$random}};
  _T_254 = _RAND_36[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{$random}};
  _T_257 = _RAND_37[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{$random}};
  _T_259 = _RAND_38[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    in_valid <= io_input_valid;
    if (reset) begin
      value <= 1'h0;
    end else begin
      if (in_valid) begin
        value <= _T_69;
      end
    end
    if (in_valid) begin
      if (_T_73) begin
        _T_79 <= io_dIn_0;
      end else begin
        if (_T_75) begin
          _T_79 <= io_dIn_2;
        end else begin
          if (_T_77) begin
            _T_79 <= io_dIn_4;
          end else begin
            _T_79 <= 8'h0;
          end
        end
      end
    end
    if (in_valid) begin
      if (_T_73) begin
        _T_81 <= io_dIn_1;
      end else begin
        if (_T_75) begin
          _T_81 <= io_dIn_3;
        end else begin
          if (_T_77) begin
            _T_81 <= io_dIn_5;
          end else begin
            _T_81 <= 8'h0;
          end
        end
      end
    end
    if (in_valid) begin
      if (_T_73) begin
        _T_83 <= io_dIn_2;
      end else begin
        if (_T_75) begin
          _T_83 <= io_dIn_4;
        end else begin
          if (_T_77) begin
            _T_83 <= io_dIn_0;
          end else begin
            _T_83 <= 8'h0;
          end
        end
      end
    end
    if (in_valid) begin
      if (_T_73) begin
        _T_85 <= io_dIn_3;
      end else begin
        if (_T_75) begin
          _T_85 <= io_dIn_5;
        end else begin
          if (_T_77) begin
            _T_85 <= io_dIn_1;
          end else begin
            _T_85 <= 8'h0;
          end
        end
      end
    end
    if (in_valid) begin
      if (_T_161) begin
        if (in_valid) begin
          if (_T_73) begin
            _T_166 <= io_dIn_0;
          end else begin
            if (_T_75) begin
              _T_166 <= io_dIn_2;
            end else begin
              if (_T_77) begin
                _T_166 <= io_dIn_4;
              end else begin
                _T_166 <= 8'h0;
              end
            end
          end
        end else begin
          _T_166 <= _T_79;
        end
      end else begin
        _T_166 <= 8'h0;
      end
    end else begin
      _T_166 <= 8'h0;
    end
    _T_168 <= _T_166;
    _T_170 <= _T_168;
    _T_172 <= _T_170;
    if (in_valid) begin
      if (_T_161) begin
        _T_175 <= 8'h0;
      end else begin
        if (_T_163) begin
          if (in_valid) begin
            if (_T_73) begin
              _T_175 <= io_dIn_0;
            end else begin
              if (_T_75) begin
                _T_175 <= io_dIn_2;
              end else begin
                if (_T_77) begin
                  _T_175 <= io_dIn_4;
                end else begin
                  _T_175 <= 8'h0;
                end
              end
            end
          end else begin
            _T_175 <= _T_79;
          end
        end else begin
          _T_175 <= 8'h0;
        end
      end
    end else begin
      _T_175 <= 8'h0;
    end
    _T_177 <= _T_175;
    if (in_valid) begin
      if (_T_161) begin
        if (in_valid) begin
          if (_T_73) begin
            _T_180 <= io_dIn_1;
          end else begin
            if (_T_75) begin
              _T_180 <= io_dIn_3;
            end else begin
              if (_T_77) begin
                _T_180 <= io_dIn_5;
              end else begin
                _T_180 <= 8'h0;
              end
            end
          end
        end else begin
          _T_180 <= _T_81;
        end
      end else begin
        _T_180 <= 8'h0;
      end
    end else begin
      _T_180 <= 8'h0;
    end
    _T_182 <= _T_180;
    _T_184 <= _T_182;
    _T_186 <= _T_184;
    if (in_valid) begin
      if (_T_161) begin
        _T_189 <= 8'h0;
      end else begin
        if (_T_163) begin
          if (in_valid) begin
            if (_T_73) begin
              _T_189 <= io_dIn_1;
            end else begin
              if (_T_75) begin
                _T_189 <= io_dIn_3;
              end else begin
                if (_T_77) begin
                  _T_189 <= io_dIn_5;
                end else begin
                  _T_189 <= 8'h0;
                end
              end
            end
          end else begin
            _T_189 <= _T_81;
          end
        end else begin
          _T_189 <= 8'h0;
        end
      end
    end else begin
      _T_189 <= 8'h0;
    end
    _T_191 <= _T_189;
    if (in_valid) begin
      if (_T_161) begin
        if (in_valid) begin
          if (_T_73) begin
            _T_194 <= io_dIn_2;
          end else begin
            if (_T_75) begin
              _T_194 <= io_dIn_4;
            end else begin
              if (_T_77) begin
                _T_194 <= io_dIn_0;
              end else begin
                _T_194 <= 8'h0;
              end
            end
          end
        end else begin
          _T_194 <= _T_83;
        end
      end else begin
        _T_194 <= 8'h0;
      end
    end else begin
      _T_194 <= 8'h0;
    end
    _T_196 <= _T_194;
    _T_198 <= _T_196;
    _T_200 <= _T_198;
    if (in_valid) begin
      if (_T_161) begin
        _T_203 <= 8'h0;
      end else begin
        if (_T_163) begin
          if (in_valid) begin
            if (_T_73) begin
              _T_203 <= io_dIn_2;
            end else begin
              if (_T_75) begin
                _T_203 <= io_dIn_4;
              end else begin
                if (_T_77) begin
                  _T_203 <= io_dIn_0;
                end else begin
                  _T_203 <= 8'h0;
                end
              end
            end
          end else begin
            _T_203 <= _T_83;
          end
        end else begin
          _T_203 <= 8'h0;
        end
      end
    end else begin
      _T_203 <= 8'h0;
    end
    _T_205 <= _T_203;
    if (in_valid) begin
      if (_T_161) begin
        if (in_valid) begin
          if (_T_73) begin
            _T_208 <= io_dIn_3;
          end else begin
            if (_T_75) begin
              _T_208 <= io_dIn_5;
            end else begin
              if (_T_77) begin
                _T_208 <= io_dIn_1;
              end else begin
                _T_208 <= 8'h0;
              end
            end
          end
        end else begin
          _T_208 <= _T_85;
        end
      end else begin
        _T_208 <= 8'h0;
      end
    end else begin
      _T_208 <= 8'h0;
    end
    _T_210 <= _T_208;
    _T_212 <= _T_210;
    _T_214 <= _T_212;
    if (in_valid) begin
      if (_T_161) begin
        _T_217 <= 8'h0;
      end else begin
        if (_T_163) begin
          if (in_valid) begin
            if (_T_73) begin
              _T_217 <= io_dIn_3;
            end else begin
              if (_T_75) begin
                _T_217 <= io_dIn_5;
              end else begin
                if (_T_77) begin
                  _T_217 <= io_dIn_1;
                end else begin
                  _T_217 <= 8'h0;
                end
              end
            end
          end else begin
            _T_217 <= _T_85;
          end
        end else begin
          _T_217 <= 8'h0;
        end
      end
    end else begin
      _T_217 <= 8'h0;
    end
    _T_219 <= _T_217;
    if (reset) begin
      value_1 <= 2'h0;
    end else begin
      if (io_output_valid) begin
        value_1 <= _T_233;
      end
    end
    if (in_valid) begin
      if (_T_161) begin
        if (in_valid) begin
          if (_T_73) begin
            _T_242 <= io_dIn_0;
          end else begin
            if (_T_75) begin
              _T_242 <= io_dIn_2;
            end else begin
              if (_T_77) begin
                _T_242 <= io_dIn_4;
              end else begin
                _T_242 <= 8'h0;
              end
            end
          end
        end else begin
          _T_242 <= _T_79;
        end
      end else begin
        _T_242 <= 8'h0;
      end
    end else begin
      _T_242 <= 8'h0;
    end
    _T_244 <= _T_242;
    if (in_valid) begin
      if (_T_161) begin
        if (in_valid) begin
          if (_T_73) begin
            _T_247 <= io_dIn_1;
          end else begin
            if (_T_75) begin
              _T_247 <= io_dIn_3;
            end else begin
              if (_T_77) begin
                _T_247 <= io_dIn_5;
              end else begin
                _T_247 <= 8'h0;
              end
            end
          end
        end else begin
          _T_247 <= _T_81;
        end
      end else begin
        _T_247 <= 8'h0;
      end
    end else begin
      _T_247 <= 8'h0;
    end
    _T_249 <= _T_247;
    if (in_valid) begin
      if (_T_161) begin
        if (in_valid) begin
          if (_T_73) begin
            _T_252 <= io_dIn_2;
          end else begin
            if (_T_75) begin
              _T_252 <= io_dIn_4;
            end else begin
              if (_T_77) begin
                _T_252 <= io_dIn_0;
              end else begin
                _T_252 <= 8'h0;
              end
            end
          end
        end else begin
          _T_252 <= _T_83;
        end
      end else begin
        _T_252 <= 8'h0;
      end
    end else begin
      _T_252 <= 8'h0;
    end
    _T_254 <= _T_252;
    if (in_valid) begin
      if (_T_161) begin
        if (in_valid) begin
          if (_T_73) begin
            _T_257 <= io_dIn_3;
          end else begin
            if (_T_75) begin
              _T_257 <= io_dIn_5;
            end else begin
              if (_T_77) begin
                _T_257 <= io_dIn_1;
              end else begin
                _T_257 <= 8'h0;
              end
            end
          end
        end else begin
          _T_257 <= _T_85;
        end
      end else begin
        _T_257 <= 8'h0;
      end
    end else begin
      _T_257 <= 8'h0;
    end
    _T_259 <= _T_257;
  end
endmodule
module BT( // @[:@1200.2]
  input        clock, // @[:@1201.4]
  input  [7:0] io_dIn1, // @[:@1203.4]
  input  [7:0] io_dIn2, // @[:@1203.4]
  input  [7:0] io_dIn3, // @[:@1203.4]
  input  [7:0] io_dIn4, // @[:@1203.4]
  output [8:0] io_dOut1, // @[:@1203.4]
  output [8:0] io_dOut2, // @[:@1203.4]
  output [8:0] io_dOut3, // @[:@1203.4]
  output [8:0] io_dOut4 // @[:@1203.4]
);
  wire  Add_8in_9out_CLK; // @[Winograd.scala 156:22:@1208.4]
  wire [8:0] Add_8in_9out_S; // @[Winograd.scala 156:22:@1208.4]
  wire [7:0] Add_8in_9out_B; // @[Winograd.scala 156:22:@1208.4]
  wire [7:0] Add_8in_9out_A; // @[Winograd.scala 156:22:@1208.4]
  wire  Add_8in_9out_1_CLK; // @[Winograd.scala 156:22:@1217.4]
  wire [8:0] Add_8in_9out_1_S; // @[Winograd.scala 156:22:@1217.4]
  wire [7:0] Add_8in_9out_1_B; // @[Winograd.scala 156:22:@1217.4]
  wire [7:0] Add_8in_9out_1_A; // @[Winograd.scala 156:22:@1217.4]
  wire  Add_8in_9out_2_CLK; // @[Winograd.scala 156:22:@1229.4]
  wire [8:0] Add_8in_9out_2_S; // @[Winograd.scala 156:22:@1229.4]
  wire [7:0] Add_8in_9out_2_B; // @[Winograd.scala 156:22:@1229.4]
  wire [7:0] Add_8in_9out_2_A; // @[Winograd.scala 156:22:@1229.4]
  wire  Add_8in_9out_3_CLK; // @[Winograd.scala 156:22:@1241.4]
  wire [8:0] Add_8in_9out_3_S; // @[Winograd.scala 156:22:@1241.4]
  wire [7:0] Add_8in_9out_3_B; // @[Winograd.scala 156:22:@1241.4]
  wire [7:0] Add_8in_9out_3_A; // @[Winograd.scala 156:22:@1241.4]
  wire [8:0] _T_22; // @[Winograd.scala 181:34:@1205.4]
  wire [7:0] _T_23; // @[Winograd.scala 181:34:@1206.4]
  wire [8:0] _T_26; // @[Winograd.scala 183:26:@1226.4]
  wire [7:0] _T_27; // @[Winograd.scala 183:26:@1227.4]
  wire [8:0] _T_30; // @[Winograd.scala 184:34:@1238.4]
  wire [7:0] _T_31; // @[Winograd.scala 184:34:@1239.4]
  Add_8in_9out Add_8in_9out ( // @[Winograd.scala 156:22:@1208.4]
    .CLK(Add_8in_9out_CLK),
    .S(Add_8in_9out_S),
    .B(Add_8in_9out_B),
    .A(Add_8in_9out_A)
  );
  Add_8in_9out Add_8in_9out_1 ( // @[Winograd.scala 156:22:@1217.4]
    .CLK(Add_8in_9out_1_CLK),
    .S(Add_8in_9out_1_S),
    .B(Add_8in_9out_1_B),
    .A(Add_8in_9out_1_A)
  );
  Add_8in_9out Add_8in_9out_2 ( // @[Winograd.scala 156:22:@1229.4]
    .CLK(Add_8in_9out_2_CLK),
    .S(Add_8in_9out_2_S),
    .B(Add_8in_9out_2_B),
    .A(Add_8in_9out_2_A)
  );
  Add_8in_9out Add_8in_9out_3 ( // @[Winograd.scala 156:22:@1241.4]
    .CLK(Add_8in_9out_3_CLK),
    .S(Add_8in_9out_3_S),
    .B(Add_8in_9out_3_B),
    .A(Add_8in_9out_3_A)
  );
  assign _T_22 = $signed(8'sh0) - $signed(io_dIn3); // @[Winograd.scala 181:34:@1205.4]
  assign _T_23 = _T_22[7:0]; // @[Winograd.scala 181:34:@1206.4]
  assign _T_26 = $signed(8'sh0) - $signed(io_dIn2); // @[Winograd.scala 183:26:@1226.4]
  assign _T_27 = _T_26[7:0]; // @[Winograd.scala 183:26:@1227.4]
  assign _T_30 = $signed(8'sh0) - $signed(io_dIn4); // @[Winograd.scala 184:34:@1238.4]
  assign _T_31 = _T_30[7:0]; // @[Winograd.scala 184:34:@1239.4]
  assign io_dOut1 = Add_8in_9out_S; // @[Winograd.scala 181:11:@1216.4]
  assign io_dOut2 = Add_8in_9out_1_S; // @[Winograd.scala 182:11:@1225.4]
  assign io_dOut3 = Add_8in_9out_2_S; // @[Winograd.scala 183:11:@1237.4]
  assign io_dOut4 = Add_8in_9out_3_S; // @[Winograd.scala 184:11:@1249.4]
  assign Add_8in_9out_CLK = clock; // @[Winograd.scala 159:16:@1215.4]
  assign Add_8in_9out_B = $signed(_T_23); // @[Winograd.scala 158:15:@1214.4]
  assign Add_8in_9out_A = io_dIn1; // @[Winograd.scala 157:15:@1213.4]
  assign Add_8in_9out_1_CLK = clock; // @[Winograd.scala 159:16:@1224.4]
  assign Add_8in_9out_1_B = io_dIn3; // @[Winograd.scala 158:15:@1223.4]
  assign Add_8in_9out_1_A = io_dIn2; // @[Winograd.scala 157:15:@1222.4]
  assign Add_8in_9out_2_CLK = clock; // @[Winograd.scala 159:16:@1236.4]
  assign Add_8in_9out_2_B = io_dIn3; // @[Winograd.scala 158:15:@1235.4]
  assign Add_8in_9out_2_A = $signed(_T_27); // @[Winograd.scala 157:15:@1234.4]
  assign Add_8in_9out_3_CLK = clock; // @[Winograd.scala 159:16:@1248.4]
  assign Add_8in_9out_3_B = $signed(_T_31); // @[Winograd.scala 158:15:@1247.4]
  assign Add_8in_9out_3_A = io_dIn2; // @[Winograd.scala 157:15:@1246.4]
endmodule
module BT_module( // @[:@1251.2]
  input        clock, // @[:@1252.4]
  input        reset, // @[:@1253.4]
  input        io_mac_in_valid, // @[:@1254.4]
  input  [7:0] io_dIn_0, // @[:@1254.4]
  input  [7:0] io_dIn_1, // @[:@1254.4]
  input  [7:0] io_dIn_2, // @[:@1254.4]
  input  [7:0] io_dIn_3, // @[:@1254.4]
  output [8:0] io_dOut_0, // @[:@1254.4]
  output [8:0] io_dOut_1, // @[:@1254.4]
  output [8:0] io_dOut_2, // @[:@1254.4]
  output [8:0] io_dOut_3, // @[:@1254.4]
  output       io_out_valid // @[:@1254.4]
);
  wire  m_BT_clock; // @[Winograd.scala 198:18:@1256.4]
  wire [7:0] m_BT_io_dIn1; // @[Winograd.scala 198:18:@1256.4]
  wire [7:0] m_BT_io_dIn2; // @[Winograd.scala 198:18:@1256.4]
  wire [7:0] m_BT_io_dIn3; // @[Winograd.scala 198:18:@1256.4]
  wire [7:0] m_BT_io_dIn4; // @[Winograd.scala 198:18:@1256.4]
  wire [8:0] m_BT_io_dOut1; // @[Winograd.scala 198:18:@1256.4]
  wire [8:0] m_BT_io_dOut2; // @[Winograd.scala 198:18:@1256.4]
  wire [8:0] m_BT_io_dOut3; // @[Winograd.scala 198:18:@1256.4]
  wire [8:0] m_BT_io_dOut4; // @[Winograd.scala 198:18:@1256.4]
  reg [1:0] value; // @[Counter.scala 26:33:@1347.4]
  reg [31:0] _RAND_0;
  wire  _T_180; // @[Counter.scala 34:24:@1349.6]
  wire [2:0] _T_182; // @[Counter.scala 35:22:@1350.6]
  wire [1:0] _T_183; // @[Counter.scala 35:22:@1351.6]
  wire [1:0] _GEN_0; // @[Counter.scala 63:17:@1348.4]
  reg [8:0] out2_0; // @[Reg.scala 11:16:@1356.4]
  reg [31:0] _RAND_1;
  reg [8:0] _T_189; // @[Reg.scala 11:16:@1361.4]
  reg [31:0] _RAND_2;
  reg [8:0] out3_0; // @[Reg.scala 11:16:@1365.4]
  reg [31:0] _RAND_3;
  reg [8:0] _T_194; // @[Reg.scala 11:16:@1370.4]
  reg [31:0] _RAND_4;
  reg [8:0] _T_196; // @[Reg.scala 11:16:@1374.4]
  reg [31:0] _RAND_5;
  reg [8:0] out4_0; // @[Reg.scala 11:16:@1378.4]
  reg [31:0] _RAND_6;
  reg [8:0] out1_1; // @[Winograd.scala 221:21:@1383.4]
  reg [31:0] _RAND_7;
  reg [8:0] out2_1; // @[Winograd.scala 222:21:@1386.4]
  reg [31:0] _RAND_8;
  reg [8:0] out3_1; // @[Winograd.scala 223:21:@1389.4]
  reg [31:0] _RAND_9;
  reg [8:0] out4_1; // @[Winograd.scala 224:21:@1392.4]
  reg [31:0] _RAND_10;
  reg [8:0] out1_2; // @[Winograd.scala 221:21:@1395.4]
  reg [31:0] _RAND_11;
  reg [8:0] out2_2; // @[Winograd.scala 222:21:@1398.4]
  reg [31:0] _RAND_12;
  reg [8:0] out3_2; // @[Winograd.scala 223:21:@1401.4]
  reg [31:0] _RAND_13;
  reg [8:0] out4_2; // @[Winograd.scala 224:21:@1404.4]
  reg [31:0] _RAND_14;
  reg [8:0] out1_3; // @[Winograd.scala 221:21:@1407.4]
  reg [31:0] _RAND_15;
  reg [8:0] out2_3; // @[Winograd.scala 222:21:@1410.4]
  reg [31:0] _RAND_16;
  reg [8:0] out3_3; // @[Winograd.scala 223:21:@1413.4]
  reg [31:0] _RAND_17;
  reg [8:0] out4_3; // @[Winograd.scala 224:21:@1416.4]
  reg [31:0] _RAND_18;
  wire  _T_224; // @[Winograd.scala 227:11:@1419.4]
  wire  _T_226; // @[Winograd.scala 232:17:@1427.6]
  wire  _T_228; // @[Winograd.scala 237:17:@1435.8]
  wire [8:0] _GEN_7; // @[Winograd.scala 242:24:@1444.10]
  wire [8:0] _GEN_8; // @[Winograd.scala 242:24:@1444.10]
  wire [8:0] _GEN_9; // @[Winograd.scala 242:24:@1444.10]
  wire [8:0] _GEN_10; // @[Winograd.scala 242:24:@1444.10]
  wire [8:0] _GEN_11; // @[Winograd.scala 237:24:@1436.8]
  wire [8:0] _GEN_12; // @[Winograd.scala 237:24:@1436.8]
  wire [8:0] _GEN_13; // @[Winograd.scala 237:24:@1436.8]
  wire [8:0] _GEN_14; // @[Winograd.scala 237:24:@1436.8]
  wire [8:0] _GEN_15; // @[Winograd.scala 232:25:@1428.6]
  wire [8:0] _GEN_16; // @[Winograd.scala 232:25:@1428.6]
  wire [8:0] _GEN_17; // @[Winograd.scala 232:25:@1428.6]
  wire [8:0] _GEN_18; // @[Winograd.scala 232:25:@1428.6]
  wire [8:0] out1_0; // @[Winograd.scala 205:19:@1279.4 Winograd.scala 205:19:@1280.4 Winograd.scala 216:10:@1355.4]
  reg  _T_237; // @[Reg.scala 11:16:@1456.4]
  reg [31:0] _RAND_19;
  reg  _T_239; // @[Reg.scala 11:16:@1460.4]
  reg [31:0] _RAND_20;
  reg  _T_241; // @[Reg.scala 11:16:@1464.4]
  reg [31:0] _RAND_21;
  reg  _T_243; // @[Reg.scala 11:16:@1468.4]
  reg [31:0] _RAND_22;
  BT m_BT ( // @[Winograd.scala 198:18:@1256.4]
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
  assign _T_180 = value == 2'h3; // @[Counter.scala 34:24:@1349.6]
  assign _T_182 = value + 2'h1; // @[Counter.scala 35:22:@1350.6]
  assign _T_183 = _T_182[1:0]; // @[Counter.scala 35:22:@1351.6]
  assign _GEN_0 = io_mac_in_valid ? _T_183 : value; // @[Counter.scala 63:17:@1348.4]
  assign _T_224 = value == 2'h0; // @[Winograd.scala 227:11:@1419.4]
  assign _T_226 = value == 2'h1; // @[Winograd.scala 232:17:@1427.6]
  assign _T_228 = value == 2'h2; // @[Winograd.scala 237:17:@1435.8]
  assign _GEN_7 = _T_180 ? $signed(out4_0) : $signed(9'sh0); // @[Winograd.scala 242:24:@1444.10]
  assign _GEN_8 = _T_180 ? $signed(out4_1) : $signed(9'sh0); // @[Winograd.scala 242:24:@1444.10]
  assign _GEN_9 = _T_180 ? $signed(out4_2) : $signed(9'sh0); // @[Winograd.scala 242:24:@1444.10]
  assign _GEN_10 = _T_180 ? $signed(out4_3) : $signed(9'sh0); // @[Winograd.scala 242:24:@1444.10]
  assign _GEN_11 = _T_228 ? $signed(out3_0) : $signed(_GEN_7); // @[Winograd.scala 237:24:@1436.8]
  assign _GEN_12 = _T_228 ? $signed(out3_1) : $signed(_GEN_8); // @[Winograd.scala 237:24:@1436.8]
  assign _GEN_13 = _T_228 ? $signed(out3_2) : $signed(_GEN_9); // @[Winograd.scala 237:24:@1436.8]
  assign _GEN_14 = _T_228 ? $signed(out3_3) : $signed(_GEN_10); // @[Winograd.scala 237:24:@1436.8]
  assign _GEN_15 = _T_226 ? $signed(out2_0) : $signed(_GEN_11); // @[Winograd.scala 232:25:@1428.6]
  assign _GEN_16 = _T_226 ? $signed(out2_1) : $signed(_GEN_12); // @[Winograd.scala 232:25:@1428.6]
  assign _GEN_17 = _T_226 ? $signed(out2_2) : $signed(_GEN_13); // @[Winograd.scala 232:25:@1428.6]
  assign _GEN_18 = _T_226 ? $signed(out2_3) : $signed(_GEN_14); // @[Winograd.scala 232:25:@1428.6]
  assign out1_0 = m_BT_io_dOut1; // @[Winograd.scala 205:19:@1279.4 Winograd.scala 205:19:@1280.4 Winograd.scala 216:10:@1355.4]
  assign io_dOut_0 = _T_224 ? $signed(out1_0) : $signed(_GEN_15); // @[Winograd.scala 228:16:@1421.6 Winograd.scala 233:16:@1429.8 Winograd.scala 238:16:@1437.10 Winograd.scala 243:16:@1445.12 Winograd.scala 248:16:@1451.12]
  assign io_dOut_1 = _T_224 ? $signed(out1_1) : $signed(_GEN_16); // @[Winograd.scala 229:16:@1422.6 Winograd.scala 234:16:@1430.8 Winograd.scala 239:16:@1438.10 Winograd.scala 244:16:@1446.12 Winograd.scala 249:15:@1452.12]
  assign io_dOut_2 = _T_224 ? $signed(out1_2) : $signed(_GEN_17); // @[Winograd.scala 230:16:@1423.6 Winograd.scala 235:16:@1431.8 Winograd.scala 240:16:@1439.10 Winograd.scala 245:16:@1447.12 Winograd.scala 250:16:@1453.12]
  assign io_dOut_3 = _T_224 ? $signed(out1_3) : $signed(_GEN_18); // @[Winograd.scala 231:16:@1424.6 Winograd.scala 236:16:@1432.8 Winograd.scala 241:16:@1440.10 Winograd.scala 246:16:@1448.12 Winograd.scala 251:16:@1454.12]
  assign io_out_valid = _T_243; // @[Winograd.scala 253:15:@1472.4]
  assign m_BT_clock = clock; // @[:@1257.4]
  assign m_BT_io_dIn1 = io_dIn_0; // @[Winograd.scala 200:15:@1259.4]
  assign m_BT_io_dIn2 = io_dIn_1; // @[Winograd.scala 201:15:@1260.4]
  assign m_BT_io_dIn3 = io_dIn_2; // @[Winograd.scala 202:15:@1261.4]
  assign m_BT_io_dIn4 = io_dIn_3; // @[Winograd.scala 203:15:@1262.4]
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
module B( // @[:@1510.2]
  input        clock, // @[:@1511.4]
  input  [8:0] io_dIn_0, // @[:@1513.4]
  input  [8:0] io_dIn_1, // @[:@1513.4]
  input  [8:0] io_dIn_2, // @[:@1513.4]
  input  [8:0] io_dIn_3, // @[:@1513.4]
  output [9:0] io_dOut_0, // @[:@1513.4]
  output [9:0] io_dOut_1, // @[:@1513.4]
  output [9:0] io_dOut_2, // @[:@1513.4]
  output [9:0] io_dOut_3 // @[:@1513.4]
);
  wire  Add_9in_10out_CLK; // @[Winograd.scala 22:22:@1518.4]
  wire [9:0] Add_9in_10out_S; // @[Winograd.scala 22:22:@1518.4]
  wire [8:0] Add_9in_10out_B; // @[Winograd.scala 22:22:@1518.4]
  wire [8:0] Add_9in_10out_A; // @[Winograd.scala 22:22:@1518.4]
  wire  Add_9in_10out_1_CLK; // @[Winograd.scala 22:22:@1527.4]
  wire [9:0] Add_9in_10out_1_S; // @[Winograd.scala 22:22:@1527.4]
  wire [8:0] Add_9in_10out_1_B; // @[Winograd.scala 22:22:@1527.4]
  wire [8:0] Add_9in_10out_1_A; // @[Winograd.scala 22:22:@1527.4]
  wire  Add_9in_10out_2_CLK; // @[Winograd.scala 22:22:@1539.4]
  wire [9:0] Add_9in_10out_2_S; // @[Winograd.scala 22:22:@1539.4]
  wire [8:0] Add_9in_10out_2_B; // @[Winograd.scala 22:22:@1539.4]
  wire [8:0] Add_9in_10out_2_A; // @[Winograd.scala 22:22:@1539.4]
  wire  Add_9in_10out_3_CLK; // @[Winograd.scala 22:22:@1551.4]
  wire [9:0] Add_9in_10out_3_S; // @[Winograd.scala 22:22:@1551.4]
  wire [8:0] Add_9in_10out_3_B; // @[Winograd.scala 22:22:@1551.4]
  wire [8:0] Add_9in_10out_3_A; // @[Winograd.scala 22:22:@1551.4]
  wire [9:0] _T_42; // @[Winograd.scala 38:39:@1515.4]
  wire [8:0] _T_43; // @[Winograd.scala 38:39:@1516.4]
  wire [9:0] _T_46; // @[Winograd.scala 40:39:@1536.4]
  wire [8:0] _T_47; // @[Winograd.scala 40:39:@1537.4]
  wire [9:0] _T_50; // @[Winograd.scala 41:39:@1548.4]
  wire [8:0] _T_51; // @[Winograd.scala 41:39:@1549.4]
  Add_9in_10out Add_9in_10out ( // @[Winograd.scala 22:22:@1518.4]
    .CLK(Add_9in_10out_CLK),
    .S(Add_9in_10out_S),
    .B(Add_9in_10out_B),
    .A(Add_9in_10out_A)
  );
  Add_9in_10out Add_9in_10out_1 ( // @[Winograd.scala 22:22:@1527.4]
    .CLK(Add_9in_10out_1_CLK),
    .S(Add_9in_10out_1_S),
    .B(Add_9in_10out_1_B),
    .A(Add_9in_10out_1_A)
  );
  Add_9in_10out Add_9in_10out_2 ( // @[Winograd.scala 22:22:@1539.4]
    .CLK(Add_9in_10out_2_CLK),
    .S(Add_9in_10out_2_S),
    .B(Add_9in_10out_2_B),
    .A(Add_9in_10out_2_A)
  );
  Add_9in_10out Add_9in_10out_3 ( // @[Winograd.scala 22:22:@1551.4]
    .CLK(Add_9in_10out_3_CLK),
    .S(Add_9in_10out_3_S),
    .B(Add_9in_10out_3_B),
    .A(Add_9in_10out_3_A)
  );
  assign _T_42 = $signed(9'sh0) - $signed(io_dIn_1); // @[Winograd.scala 38:39:@1515.4]
  assign _T_43 = _T_42[8:0]; // @[Winograd.scala 38:39:@1516.4]
  assign _T_46 = $signed(9'sh0) - $signed(io_dIn_2); // @[Winograd.scala 40:39:@1536.4]
  assign _T_47 = _T_46[8:0]; // @[Winograd.scala 40:39:@1537.4]
  assign _T_50 = $signed(9'sh0) - $signed(io_dIn_0); // @[Winograd.scala 41:39:@1548.4]
  assign _T_51 = _T_50[8:0]; // @[Winograd.scala 41:39:@1549.4]
  assign io_dOut_0 = Add_9in_10out_S; // @[Winograd.scala 38:13:@1526.4]
  assign io_dOut_1 = Add_9in_10out_1_S; // @[Winograd.scala 39:13:@1535.4]
  assign io_dOut_2 = Add_9in_10out_2_S; // @[Winograd.scala 40:13:@1547.4]
  assign io_dOut_3 = Add_9in_10out_3_S; // @[Winograd.scala 41:13:@1559.4]
  assign Add_9in_10out_CLK = clock; // @[Winograd.scala 25:16:@1525.4]
  assign Add_9in_10out_B = $signed(_T_43); // @[Winograd.scala 24:15:@1524.4]
  assign Add_9in_10out_A = io_dIn_3; // @[Winograd.scala 23:15:@1523.4]
  assign Add_9in_10out_1_CLK = clock; // @[Winograd.scala 25:16:@1534.4]
  assign Add_9in_10out_1_B = io_dIn_1; // @[Winograd.scala 24:15:@1533.4]
  assign Add_9in_10out_1_A = io_dIn_2; // @[Winograd.scala 23:15:@1532.4]
  assign Add_9in_10out_2_CLK = clock; // @[Winograd.scala 25:16:@1546.4]
  assign Add_9in_10out_2_B = $signed(_T_47); // @[Winograd.scala 24:15:@1545.4]
  assign Add_9in_10out_2_A = io_dIn_1; // @[Winograd.scala 23:15:@1544.4]
  assign Add_9in_10out_3_CLK = clock; // @[Winograd.scala 25:16:@1558.4]
  assign Add_9in_10out_3_B = $signed(_T_51); // @[Winograd.scala 24:15:@1557.4]
  assign Add_9in_10out_3_A = io_dIn_2; // @[Winograd.scala 23:15:@1556.4]
endmodule
module B_module( // @[:@1561.2]
  input        clock, // @[:@1562.4]
  input        reset, // @[:@1563.4]
  input        io_mac_in_valid, // @[:@1564.4]
  input  [8:0] io_dIn_0, // @[:@1564.4]
  input  [8:0] io_dIn_1, // @[:@1564.4]
  input  [8:0] io_dIn_2, // @[:@1564.4]
  input  [8:0] io_dIn_3, // @[:@1564.4]
  output [9:0] io_dOut_0, // @[:@1564.4]
  output [9:0] io_dOut_1, // @[:@1564.4]
  output [9:0] io_dOut_2, // @[:@1564.4]
  output [9:0] io_dOut_3, // @[:@1564.4]
  output       io_out_valid // @[:@1564.4]
);
  wire  m_B_clock; // @[Winograd.scala 55:17:@1566.4]
  wire [8:0] m_B_io_dIn_0; // @[Winograd.scala 55:17:@1566.4]
  wire [8:0] m_B_io_dIn_1; // @[Winograd.scala 55:17:@1566.4]
  wire [8:0] m_B_io_dIn_2; // @[Winograd.scala 55:17:@1566.4]
  wire [8:0] m_B_io_dIn_3; // @[Winograd.scala 55:17:@1566.4]
  wire [9:0] m_B_io_dOut_0; // @[Winograd.scala 55:17:@1566.4]
  wire [9:0] m_B_io_dOut_1; // @[Winograd.scala 55:17:@1566.4]
  wire [9:0] m_B_io_dOut_2; // @[Winograd.scala 55:17:@1566.4]
  wire [9:0] m_B_io_dOut_3; // @[Winograd.scala 55:17:@1566.4]
  reg [1:0] value; // @[Counter.scala 26:33:@1657.4]
  reg [31:0] _RAND_0;
  wire  _T_180; // @[Counter.scala 34:24:@1659.6]
  wire [2:0] _T_182; // @[Counter.scala 35:22:@1660.6]
  wire [1:0] _T_183; // @[Counter.scala 35:22:@1661.6]
  wire [1:0] _GEN_0; // @[Counter.scala 63:17:@1658.4]
  reg [9:0] out2_0; // @[Reg.scala 11:16:@1666.4]
  reg [31:0] _RAND_1;
  reg [9:0] _T_189; // @[Reg.scala 11:16:@1671.4]
  reg [31:0] _RAND_2;
  reg [9:0] out3_0; // @[Reg.scala 11:16:@1675.4]
  reg [31:0] _RAND_3;
  reg [9:0] _T_194; // @[Reg.scala 11:16:@1680.4]
  reg [31:0] _RAND_4;
  reg [9:0] _T_196; // @[Reg.scala 11:16:@1684.4]
  reg [31:0] _RAND_5;
  reg [9:0] out4_0; // @[Reg.scala 11:16:@1688.4]
  reg [31:0] _RAND_6;
  reg [9:0] out1_1; // @[Winograd.scala 96:21:@1693.4]
  reg [31:0] _RAND_7;
  reg [9:0] out2_1; // @[Winograd.scala 97:21:@1696.4]
  reg [31:0] _RAND_8;
  reg [9:0] out3_1; // @[Winograd.scala 98:21:@1699.4]
  reg [31:0] _RAND_9;
  reg [9:0] out4_1; // @[Winograd.scala 99:21:@1702.4]
  reg [31:0] _RAND_10;
  reg [9:0] out1_2; // @[Winograd.scala 96:21:@1705.4]
  reg [31:0] _RAND_11;
  reg [9:0] out2_2; // @[Winograd.scala 97:21:@1708.4]
  reg [31:0] _RAND_12;
  reg [9:0] out3_2; // @[Winograd.scala 98:21:@1711.4]
  reg [31:0] _RAND_13;
  reg [9:0] out4_2; // @[Winograd.scala 99:21:@1714.4]
  reg [31:0] _RAND_14;
  reg [9:0] out1_3; // @[Winograd.scala 96:21:@1717.4]
  reg [31:0] _RAND_15;
  reg [9:0] out2_3; // @[Winograd.scala 97:21:@1720.4]
  reg [31:0] _RAND_16;
  reg [9:0] out3_3; // @[Winograd.scala 98:21:@1723.4]
  reg [31:0] _RAND_17;
  reg [9:0] out4_3; // @[Winograd.scala 99:21:@1726.4]
  reg [31:0] _RAND_18;
  wire  _T_224; // @[Winograd.scala 102:11:@1729.4]
  wire  _T_226; // @[Winograd.scala 107:17:@1737.6]
  wire  _T_228; // @[Winograd.scala 113:17:@1745.8]
  wire [9:0] _GEN_7; // @[Winograd.scala 118:24:@1754.10]
  wire [9:0] _GEN_8; // @[Winograd.scala 118:24:@1754.10]
  wire [9:0] _GEN_9; // @[Winograd.scala 118:24:@1754.10]
  wire [9:0] _GEN_10; // @[Winograd.scala 118:24:@1754.10]
  wire [9:0] _GEN_11; // @[Winograd.scala 113:24:@1746.8]
  wire [9:0] _GEN_12; // @[Winograd.scala 113:24:@1746.8]
  wire [9:0] _GEN_13; // @[Winograd.scala 113:24:@1746.8]
  wire [9:0] _GEN_14; // @[Winograd.scala 113:24:@1746.8]
  wire [9:0] _GEN_15; // @[Winograd.scala 107:25:@1738.6]
  wire [9:0] _GEN_16; // @[Winograd.scala 107:25:@1738.6]
  wire [9:0] _GEN_17; // @[Winograd.scala 107:25:@1738.6]
  wire [9:0] _GEN_18; // @[Winograd.scala 107:25:@1738.6]
  wire [9:0] out1_0; // @[Winograd.scala 65:19:@1589.4 Winograd.scala 65:19:@1590.4 Winograd.scala 90:10:@1665.4]
  reg  _T_237; // @[Reg.scala 11:16:@1766.4]
  reg [31:0] _RAND_19;
  reg  _T_239; // @[Reg.scala 11:16:@1770.4]
  reg [31:0] _RAND_20;
  reg  _T_241; // @[Reg.scala 11:16:@1774.4]
  reg [31:0] _RAND_21;
  reg  _T_243; // @[Reg.scala 11:16:@1778.4]
  reg [31:0] _RAND_22;
  B m_B ( // @[Winograd.scala 55:17:@1566.4]
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
  assign _T_180 = value == 2'h3; // @[Counter.scala 34:24:@1659.6]
  assign _T_182 = value + 2'h1; // @[Counter.scala 35:22:@1660.6]
  assign _T_183 = _T_182[1:0]; // @[Counter.scala 35:22:@1661.6]
  assign _GEN_0 = io_mac_in_valid ? _T_183 : value; // @[Counter.scala 63:17:@1658.4]
  assign _T_224 = value == 2'h0; // @[Winograd.scala 102:11:@1729.4]
  assign _T_226 = value == 2'h1; // @[Winograd.scala 107:17:@1737.6]
  assign _T_228 = value == 2'h2; // @[Winograd.scala 113:17:@1745.8]
  assign _GEN_7 = _T_180 ? $signed(out4_0) : $signed(10'sh0); // @[Winograd.scala 118:24:@1754.10]
  assign _GEN_8 = _T_180 ? $signed(out4_1) : $signed(10'sh0); // @[Winograd.scala 118:24:@1754.10]
  assign _GEN_9 = _T_180 ? $signed(out4_2) : $signed(10'sh0); // @[Winograd.scala 118:24:@1754.10]
  assign _GEN_10 = _T_180 ? $signed(out4_3) : $signed(10'sh0); // @[Winograd.scala 118:24:@1754.10]
  assign _GEN_11 = _T_228 ? $signed(out3_0) : $signed(_GEN_7); // @[Winograd.scala 113:24:@1746.8]
  assign _GEN_12 = _T_228 ? $signed(out3_1) : $signed(_GEN_8); // @[Winograd.scala 113:24:@1746.8]
  assign _GEN_13 = _T_228 ? $signed(out3_2) : $signed(_GEN_9); // @[Winograd.scala 113:24:@1746.8]
  assign _GEN_14 = _T_228 ? $signed(out3_3) : $signed(_GEN_10); // @[Winograd.scala 113:24:@1746.8]
  assign _GEN_15 = _T_226 ? $signed(out2_0) : $signed(_GEN_11); // @[Winograd.scala 107:25:@1738.6]
  assign _GEN_16 = _T_226 ? $signed(out2_1) : $signed(_GEN_12); // @[Winograd.scala 107:25:@1738.6]
  assign _GEN_17 = _T_226 ? $signed(out2_2) : $signed(_GEN_13); // @[Winograd.scala 107:25:@1738.6]
  assign _GEN_18 = _T_226 ? $signed(out2_3) : $signed(_GEN_14); // @[Winograd.scala 107:25:@1738.6]
  assign out1_0 = m_B_io_dOut_0; // @[Winograd.scala 65:19:@1589.4 Winograd.scala 65:19:@1590.4 Winograd.scala 90:10:@1665.4]
  assign io_dOut_0 = _T_224 ? $signed(out1_0) : $signed(_GEN_15); // @[Winograd.scala 103:16:@1731.6 Winograd.scala 108:16:@1739.8 Winograd.scala 114:16:@1747.10 Winograd.scala 119:16:@1755.12 Winograd.scala 124:16:@1761.12]
  assign io_dOut_1 = _T_224 ? $signed(out1_1) : $signed(_GEN_16); // @[Winograd.scala 104:16:@1732.6 Winograd.scala 109:16:@1740.8 Winograd.scala 115:16:@1748.10 Winograd.scala 120:16:@1756.12 Winograd.scala 125:15:@1762.12]
  assign io_dOut_2 = _T_224 ? $signed(out1_2) : $signed(_GEN_17); // @[Winograd.scala 105:16:@1733.6 Winograd.scala 110:16:@1741.8 Winograd.scala 116:16:@1749.10 Winograd.scala 121:16:@1757.12 Winograd.scala 126:15:@1763.12]
  assign io_dOut_3 = _T_224 ? $signed(out1_3) : $signed(_GEN_18); // @[Winograd.scala 106:16:@1734.6 Winograd.scala 111:16:@1742.8 Winograd.scala 117:16:@1750.10 Winograd.scala 122:16:@1758.12 Winograd.scala 127:15:@1764.12]
  assign io_out_valid = _T_243; // @[Winograd.scala 129:15:@1782.4]
  assign m_B_clock = clock; // @[:@1567.4]
  assign m_B_io_dIn_0 = io_dIn_0; // @[Winograd.scala 57:16:@1569.4]
  assign m_B_io_dIn_1 = io_dIn_1; // @[Winograd.scala 58:16:@1570.4]
  assign m_B_io_dIn_2 = io_dIn_2; // @[Winograd.scala 59:16:@1571.4]
  assign m_B_io_dIn_3 = io_dIn_3; // @[Winograd.scala 60:16:@1572.4]
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
module MUL( // @[:@1820.2]
  input         clock, // @[:@1821.4]
  input  [9:0]  io_dIn_B_0, // @[:@1823.4]
  input  [9:0]  io_dIn_B_1, // @[:@1823.4]
  input  [9:0]  io_dIn_B_2, // @[:@1823.4]
  input  [9:0]  io_dIn_B_3, // @[:@1823.4]
  input  [9:0]  io_dIn_G_0, // @[:@1823.4]
  input  [9:0]  io_dIn_G_1, // @[:@1823.4]
  input  [9:0]  io_dIn_G_2, // @[:@1823.4]
  input  [9:0]  io_dIn_G_3, // @[:@1823.4]
  output [19:0] io_dOut_0, // @[:@1823.4]
  output [19:0] io_dOut_1, // @[:@1823.4]
  output [19:0] io_dOut_2, // @[:@1823.4]
  output [19:0] io_dOut_3 // @[:@1823.4]
);
  wire  Mul_8in_16out_CLK; // @[Winograd.scala 282:22:@1825.4]
  wire [19:0] Mul_8in_16out_P; // @[Winograd.scala 282:22:@1825.4]
  wire [9:0] Mul_8in_16out_B; // @[Winograd.scala 282:22:@1825.4]
  wire [9:0] Mul_8in_16out_A; // @[Winograd.scala 282:22:@1825.4]
  wire  Mul_8in_16out_1_CLK; // @[Winograd.scala 282:22:@1834.4]
  wire [19:0] Mul_8in_16out_1_P; // @[Winograd.scala 282:22:@1834.4]
  wire [9:0] Mul_8in_16out_1_B; // @[Winograd.scala 282:22:@1834.4]
  wire [9:0] Mul_8in_16out_1_A; // @[Winograd.scala 282:22:@1834.4]
  wire  Mul_8in_16out_2_CLK; // @[Winograd.scala 282:22:@1843.4]
  wire [19:0] Mul_8in_16out_2_P; // @[Winograd.scala 282:22:@1843.4]
  wire [9:0] Mul_8in_16out_2_B; // @[Winograd.scala 282:22:@1843.4]
  wire [9:0] Mul_8in_16out_2_A; // @[Winograd.scala 282:22:@1843.4]
  wire  Mul_8in_16out_3_CLK; // @[Winograd.scala 282:22:@1852.4]
  wire [19:0] Mul_8in_16out_3_P; // @[Winograd.scala 282:22:@1852.4]
  wire [9:0] Mul_8in_16out_3_B; // @[Winograd.scala 282:22:@1852.4]
  wire [9:0] Mul_8in_16out_3_A; // @[Winograd.scala 282:22:@1852.4]
  Mul_8in_16out Mul_8in_16out ( // @[Winograd.scala 282:22:@1825.4]
    .CLK(Mul_8in_16out_CLK),
    .P(Mul_8in_16out_P),
    .B(Mul_8in_16out_B),
    .A(Mul_8in_16out_A)
  );
  Mul_8in_16out Mul_8in_16out_1 ( // @[Winograd.scala 282:22:@1834.4]
    .CLK(Mul_8in_16out_1_CLK),
    .P(Mul_8in_16out_1_P),
    .B(Mul_8in_16out_1_B),
    .A(Mul_8in_16out_1_A)
  );
  Mul_8in_16out Mul_8in_16out_2 ( // @[Winograd.scala 282:22:@1843.4]
    .CLK(Mul_8in_16out_2_CLK),
    .P(Mul_8in_16out_2_P),
    .B(Mul_8in_16out_2_B),
    .A(Mul_8in_16out_2_A)
  );
  Mul_8in_16out Mul_8in_16out_3 ( // @[Winograd.scala 282:22:@1852.4]
    .CLK(Mul_8in_16out_3_CLK),
    .P(Mul_8in_16out_3_P),
    .B(Mul_8in_16out_3_B),
    .A(Mul_8in_16out_3_A)
  );
  assign io_dOut_0 = Mul_8in_16out_P; // @[Winograd.scala 306:15:@1833.4]
  assign io_dOut_1 = Mul_8in_16out_1_P; // @[Winograd.scala 306:15:@1842.4]
  assign io_dOut_2 = Mul_8in_16out_2_P; // @[Winograd.scala 306:15:@1851.4]
  assign io_dOut_3 = Mul_8in_16out_3_P; // @[Winograd.scala 306:15:@1860.4]
  assign Mul_8in_16out_CLK = clock; // @[Winograd.scala 285:16:@1832.4]
  assign Mul_8in_16out_B = io_dIn_G_0; // @[Winograd.scala 284:15:@1831.4]
  assign Mul_8in_16out_A = io_dIn_B_0; // @[Winograd.scala 283:15:@1830.4]
  assign Mul_8in_16out_1_CLK = clock; // @[Winograd.scala 285:16:@1841.4]
  assign Mul_8in_16out_1_B = io_dIn_G_1; // @[Winograd.scala 284:15:@1840.4]
  assign Mul_8in_16out_1_A = io_dIn_B_1; // @[Winograd.scala 283:15:@1839.4]
  assign Mul_8in_16out_2_CLK = clock; // @[Winograd.scala 285:16:@1850.4]
  assign Mul_8in_16out_2_B = io_dIn_G_2; // @[Winograd.scala 284:15:@1849.4]
  assign Mul_8in_16out_2_A = io_dIn_B_2; // @[Winograd.scala 283:15:@1848.4]
  assign Mul_8in_16out_3_CLK = clock; // @[Winograd.scala 285:16:@1859.4]
  assign Mul_8in_16out_3_B = io_dIn_G_3; // @[Winograd.scala 284:15:@1858.4]
  assign Mul_8in_16out_3_A = io_dIn_B_3; // @[Winograd.scala 283:15:@1857.4]
endmodule
module MUL_module( // @[:@1862.2]
  input         clock, // @[:@1863.4]
  input         io_mac_in_valid, // @[:@1865.4]
  input  [9:0]  io_dIn_B_0, // @[:@1865.4]
  input  [9:0]  io_dIn_B_1, // @[:@1865.4]
  input  [9:0]  io_dIn_B_2, // @[:@1865.4]
  input  [9:0]  io_dIn_B_3, // @[:@1865.4]
  input  [9:0]  io_dIn_G_0, // @[:@1865.4]
  input  [9:0]  io_dIn_G_1, // @[:@1865.4]
  input  [9:0]  io_dIn_G_2, // @[:@1865.4]
  input  [9:0]  io_dIn_G_3, // @[:@1865.4]
  output [19:0] io_dOut_0, // @[:@1865.4]
  output [19:0] io_dOut_1, // @[:@1865.4]
  output [19:0] io_dOut_2, // @[:@1865.4]
  output [19:0] io_dOut_3, // @[:@1865.4]
  output        io_out_valid // @[:@1865.4]
);
  wire  m_MUL_clock; // @[Winograd.scala 320:19:@1867.4]
  wire [9:0] m_MUL_io_dIn_B_0; // @[Winograd.scala 320:19:@1867.4]
  wire [9:0] m_MUL_io_dIn_B_1; // @[Winograd.scala 320:19:@1867.4]
  wire [9:0] m_MUL_io_dIn_B_2; // @[Winograd.scala 320:19:@1867.4]
  wire [9:0] m_MUL_io_dIn_B_3; // @[Winograd.scala 320:19:@1867.4]
  wire [9:0] m_MUL_io_dIn_G_0; // @[Winograd.scala 320:19:@1867.4]
  wire [9:0] m_MUL_io_dIn_G_1; // @[Winograd.scala 320:19:@1867.4]
  wire [9:0] m_MUL_io_dIn_G_2; // @[Winograd.scala 320:19:@1867.4]
  wire [9:0] m_MUL_io_dIn_G_3; // @[Winograd.scala 320:19:@1867.4]
  wire [19:0] m_MUL_io_dOut_0; // @[Winograd.scala 320:19:@1867.4]
  wire [19:0] m_MUL_io_dOut_1; // @[Winograd.scala 320:19:@1867.4]
  wire [19:0] m_MUL_io_dOut_2; // @[Winograd.scala 320:19:@1867.4]
  wire [19:0] m_MUL_io_dOut_3; // @[Winograd.scala 320:19:@1867.4]
  reg [19:0] _T_65; // @[Reg.scala 11:16:@1872.4]
  reg [31:0] _RAND_0;
  reg [19:0] _T_67; // @[Reg.scala 11:16:@1876.4]
  reg [31:0] _RAND_1;
  reg [19:0] _T_69; // @[Reg.scala 11:16:@1880.4]
  reg [31:0] _RAND_2;
  reg [19:0] _T_72; // @[Reg.scala 11:16:@1887.4]
  reg [31:0] _RAND_3;
  reg [19:0] _T_74; // @[Reg.scala 11:16:@1891.4]
  reg [31:0] _RAND_4;
  reg [19:0] _T_76; // @[Reg.scala 11:16:@1895.4]
  reg [31:0] _RAND_5;
  reg [19:0] _T_79; // @[Reg.scala 11:16:@1902.4]
  reg [31:0] _RAND_6;
  reg [19:0] _T_81; // @[Reg.scala 11:16:@1906.4]
  reg [31:0] _RAND_7;
  reg [19:0] _T_83; // @[Reg.scala 11:16:@1910.4]
  reg [31:0] _RAND_8;
  reg [19:0] _T_86; // @[Reg.scala 11:16:@1917.4]
  reg [31:0] _RAND_9;
  reg [19:0] _T_88; // @[Reg.scala 11:16:@1921.4]
  reg [31:0] _RAND_10;
  reg [19:0] _T_90; // @[Reg.scala 11:16:@1925.4]
  reg [31:0] _RAND_11;
  reg  _T_93; // @[Reg.scala 11:16:@1930.4]
  reg [31:0] _RAND_12;
  reg  _T_95; // @[Reg.scala 11:16:@1934.4]
  reg [31:0] _RAND_13;
  reg  _T_97; // @[Reg.scala 11:16:@1938.4]
  reg [31:0] _RAND_14;
  reg  _T_99; // @[Reg.scala 11:16:@1942.4]
  reg [31:0] _RAND_15;
  MUL m_MUL ( // @[Winograd.scala 320:19:@1867.4]
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
  assign io_dOut_0 = _T_69; // @[Winograd.scala 326:15:@1884.4]
  assign io_dOut_1 = _T_76; // @[Winograd.scala 326:15:@1899.4]
  assign io_dOut_2 = _T_83; // @[Winograd.scala 326:15:@1914.4]
  assign io_dOut_3 = _T_90; // @[Winograd.scala 326:15:@1929.4]
  assign io_out_valid = _T_99; // @[Winograd.scala 386:15:@1946.4]
  assign m_MUL_clock = clock; // @[:@1868.4]
  assign m_MUL_io_dIn_B_0 = io_dIn_B_0; // @[Winograd.scala 325:22:@1871.4]
  assign m_MUL_io_dIn_B_1 = io_dIn_B_1; // @[Winograd.scala 325:22:@1886.4]
  assign m_MUL_io_dIn_B_2 = io_dIn_B_2; // @[Winograd.scala 325:22:@1901.4]
  assign m_MUL_io_dIn_B_3 = io_dIn_B_3; // @[Winograd.scala 325:22:@1916.4]
  assign m_MUL_io_dIn_G_0 = io_dIn_G_0; // @[Winograd.scala 324:22:@1870.4]
  assign m_MUL_io_dIn_G_1 = io_dIn_G_1; // @[Winograd.scala 324:22:@1885.4]
  assign m_MUL_io_dIn_G_2 = io_dIn_G_2; // @[Winograd.scala 324:22:@1900.4]
  assign m_MUL_io_dIn_G_3 = io_dIn_G_3; // @[Winograd.scala 324:22:@1915.4]
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
module AT( // @[:@1984.2]
  input         clock, // @[:@1985.4]
  input  [19:0] io_dIn_0, // @[:@1987.4]
  input  [19:0] io_dIn_1, // @[:@1987.4]
  input  [19:0] io_dIn_2, // @[:@1987.4]
  input  [19:0] io_dIn_3, // @[:@1987.4]
  output [21:0] io_dOut_0, // @[:@1987.4]
  output [21:0] io_dOut_1 // @[:@1987.4]
);
  wire  Add_20in_21out_CLK; // @[Winograd.scala 418:22:@1989.4]
  wire [20:0] Add_20in_21out_S; // @[Winograd.scala 418:22:@1989.4]
  wire [19:0] Add_20in_21out_B; // @[Winograd.scala 418:22:@1989.4]
  wire [19:0] Add_20in_21out_A; // @[Winograd.scala 418:22:@1989.4]
  wire  Add_20in_21out_1_CLK; // @[Winograd.scala 418:22:@2001.4]
  wire [20:0] Add_20in_21out_1_S; // @[Winograd.scala 418:22:@2001.4]
  wire [19:0] Add_20in_21out_1_B; // @[Winograd.scala 418:22:@2001.4]
  wire [19:0] Add_20in_21out_1_A; // @[Winograd.scala 418:22:@2001.4]
  wire  Add_20in_21out_2_CLK; // @[Winograd.scala 418:22:@2013.4]
  wire [20:0] Add_20in_21out_2_S; // @[Winograd.scala 418:22:@2013.4]
  wire [19:0] Add_20in_21out_2_B; // @[Winograd.scala 418:22:@2013.4]
  wire [19:0] Add_20in_21out_2_A; // @[Winograd.scala 418:22:@2013.4]
  wire  Add_20in_21out_3_CLK; // @[Winograd.scala 418:22:@2028.4]
  wire [20:0] Add_20in_21out_3_S; // @[Winograd.scala 418:22:@2028.4]
  wire [19:0] Add_20in_21out_3_B; // @[Winograd.scala 418:22:@2028.4]
  wire [19:0] Add_20in_21out_3_A; // @[Winograd.scala 418:22:@2028.4]
  reg [19:0] _T_39; // @[Reg.scala 11:16:@1997.4]
  reg [31:0] _RAND_0;
  wire [20:0] _T_41; // @[Winograd.scala 442:55:@2010.4]
  wire [19:0] _T_42; // @[Winograd.scala 442:55:@2011.4]
  reg [19:0] _T_46; // @[Reg.scala 11:16:@2021.4]
  reg [31:0] _RAND_1;
  wire [20:0] _T_48; // @[Winograd.scala 442:67:@2025.4]
  wire [19:0] _T_49; // @[Winograd.scala 442:67:@2026.4]
  wire [19:0] _GEN_2; // @[Winograd.scala 419:15:@2006.4]
  wire [19:0] _GEN_3; // @[Winograd.scala 419:15:@2033.4]
  Add_20in_21out Add_20in_21out ( // @[Winograd.scala 418:22:@1989.4]
    .CLK(Add_20in_21out_CLK),
    .S(Add_20in_21out_S),
    .B(Add_20in_21out_B),
    .A(Add_20in_21out_A)
  );
  Add_20in_21out Add_20in_21out_1 ( // @[Winograd.scala 418:22:@2001.4]
    .CLK(Add_20in_21out_1_CLK),
    .S(Add_20in_21out_1_S),
    .B(Add_20in_21out_1_B),
    .A(Add_20in_21out_1_A)
  );
  Add_20in_21out Add_20in_21out_2 ( // @[Winograd.scala 418:22:@2013.4]
    .CLK(Add_20in_21out_2_CLK),
    .S(Add_20in_21out_2_S),
    .B(Add_20in_21out_2_B),
    .A(Add_20in_21out_2_A)
  );
  Add_20in_21out Add_20in_21out_3 ( // @[Winograd.scala 418:22:@2028.4]
    .CLK(Add_20in_21out_3_CLK),
    .S(Add_20in_21out_3_S),
    .B(Add_20in_21out_3_B),
    .A(Add_20in_21out_3_A)
  );
  assign _T_41 = $signed(20'sh0) - $signed(io_dIn_1); // @[Winograd.scala 442:55:@2010.4]
  assign _T_42 = _T_41[19:0]; // @[Winograd.scala 442:55:@2011.4]
  assign _T_48 = $signed(20'sh0) - $signed(_T_46); // @[Winograd.scala 442:67:@2025.4]
  assign _T_49 = _T_48[19:0]; // @[Winograd.scala 442:67:@2026.4]
  assign io_dOut_0 = {{1{Add_20in_21out_1_S[20]}},Add_20in_21out_1_S}; // @[Winograd.scala 441:13:@2009.4]
  assign io_dOut_1 = {{1{Add_20in_21out_3_S[20]}},Add_20in_21out_3_S}; // @[Winograd.scala 442:13:@2036.4]
  assign Add_20in_21out_CLK = clock; // @[Winograd.scala 421:16:@1996.4]
  assign Add_20in_21out_B = io_dIn_2; // @[Winograd.scala 420:15:@1995.4]
  assign Add_20in_21out_A = io_dIn_1; // @[Winograd.scala 419:15:@1994.4]
  assign Add_20in_21out_1_CLK = clock; // @[Winograd.scala 421:16:@2008.4]
  assign Add_20in_21out_1_B = _T_39; // @[Winograd.scala 420:15:@2007.4]
  assign _GEN_2 = Add_20in_21out_S[19:0]; // @[Winograd.scala 419:15:@2006.4]
  assign Add_20in_21out_1_A = $signed(_GEN_2); // @[Winograd.scala 419:15:@2006.4]
  assign Add_20in_21out_2_CLK = clock; // @[Winograd.scala 421:16:@2020.4]
  assign Add_20in_21out_2_B = $signed(_T_42); // @[Winograd.scala 420:15:@2019.4]
  assign Add_20in_21out_2_A = io_dIn_2; // @[Winograd.scala 419:15:@2018.4]
  assign Add_20in_21out_3_CLK = clock; // @[Winograd.scala 421:16:@2035.4]
  assign Add_20in_21out_3_B = $signed(_T_49); // @[Winograd.scala 420:15:@2034.4]
  assign _GEN_3 = Add_20in_21out_2_S[19:0]; // @[Winograd.scala 419:15:@2033.4]
  assign Add_20in_21out_3_A = $signed(_GEN_3); // @[Winograd.scala 419:15:@2033.4]
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
module AT_module( // @[:@2038.2]
  input         clock, // @[:@2039.4]
  input         reset, // @[:@2040.4]
  input         io_mac_in_valid, // @[:@2041.4]
  input  [19:0] io_dIn_0, // @[:@2041.4]
  input  [19:0] io_dIn_1, // @[:@2041.4]
  input  [19:0] io_dIn_2, // @[:@2041.4]
  input  [19:0] io_dIn_3, // @[:@2041.4]
  output [21:0] io_dOut_0, // @[:@2041.4]
  output [21:0] io_dOut_1, // @[:@2041.4]
  output [21:0] io_dOut_2, // @[:@2041.4]
  output [21:0] io_dOut_3, // @[:@2041.4]
  output        io_out_valid // @[:@2041.4]
);
  wire  m_AT_clock; // @[Winograd.scala 454:18:@2043.4]
  wire [19:0] m_AT_io_dIn_0; // @[Winograd.scala 454:18:@2043.4]
  wire [19:0] m_AT_io_dIn_1; // @[Winograd.scala 454:18:@2043.4]
  wire [19:0] m_AT_io_dIn_2; // @[Winograd.scala 454:18:@2043.4]
  wire [19:0] m_AT_io_dIn_3; // @[Winograd.scala 454:18:@2043.4]
  wire [21:0] m_AT_io_dOut_0; // @[Winograd.scala 454:18:@2043.4]
  wire [21:0] m_AT_io_dOut_1; // @[Winograd.scala 454:18:@2043.4]
  reg  _T_150; // @[Reg.scala 11:16:@2115.4]
  reg [31:0] _RAND_0;
  reg  _T_152; // @[Reg.scala 11:16:@2119.4]
  reg [31:0] _RAND_1;
  reg  _T_154; // @[Reg.scala 11:16:@2123.4]
  reg [31:0] _RAND_2;
  reg  _T_156; // @[Reg.scala 11:16:@2127.4]
  reg [31:0] _RAND_3;
  reg [1:0] value; // @[Counter.scala 26:33:@2131.4]
  reg [31:0] _RAND_4;
  wire [2:0] _T_162; // @[Counter.scala 35:22:@2134.6]
  wire [1:0] _T_163; // @[Counter.scala 35:22:@2135.6]
  wire [1:0] _GEN_4; // @[Counter.scala 63:17:@2132.4]
  reg [21:0] out2_0; // @[Reg.scala 11:16:@2140.4]
  reg [31:0] _RAND_5;
  reg [21:0] out1_1; // @[Winograd.scala 485:21:@2145.4]
  reg [31:0] _RAND_6;
  reg [21:0] out2_1; // @[Winograd.scala 486:21:@2148.4]
  reg [31:0] _RAND_7;
  reg [21:0] out1_2; // @[Winograd.scala 485:21:@2151.4]
  reg [31:0] _RAND_8;
  reg [21:0] out2_2; // @[Winograd.scala 486:21:@2154.4]
  reg [31:0] _RAND_9;
  reg [21:0] out1_3; // @[Winograd.scala 485:21:@2157.4]
  reg [31:0] _RAND_10;
  reg [21:0] out2_3; // @[Winograd.scala 486:21:@2160.4]
  reg [31:0] _RAND_11;
  wire  _T_180; // @[Winograd.scala 489:14:@2163.4]
  wire  _T_182; // @[Winograd.scala 494:20:@2171.6]
  wire [21:0] _GEN_6; // @[Winograd.scala 494:28:@2172.6]
  wire [21:0] _GEN_7; // @[Winograd.scala 494:28:@2172.6]
  wire [21:0] _GEN_8; // @[Winograd.scala 494:28:@2172.6]
  wire [21:0] _GEN_9; // @[Winograd.scala 494:28:@2172.6]
  wire [21:0] out1_0; // @[Winograd.scala 469:19:@2068.4 Winograd.scala 469:19:@2069.4 Winograd.scala 482:10:@2139.4]
  reg [21:0] _T_189; // @[Reg.scala 11:16:@2184.4]
  reg [31:0] _RAND_12;
  reg [21:0] _T_191; // @[Reg.scala 11:16:@2188.4]
  reg [31:0] _RAND_13;
  reg [21:0] _T_193; // @[Reg.scala 11:16:@2192.4]
  reg [31:0] _RAND_14;
  reg [21:0] _T_196; // @[Reg.scala 11:16:@2197.4]
  reg [31:0] _RAND_15;
  reg [21:0] _T_198; // @[Reg.scala 11:16:@2201.4]
  reg [31:0] _RAND_16;
  reg [21:0] _T_200; // @[Reg.scala 11:16:@2205.4]
  reg [31:0] _RAND_17;
  reg [21:0] _T_203; // @[Reg.scala 11:16:@2210.4]
  reg [31:0] _RAND_18;
  reg [21:0] _T_205; // @[Reg.scala 11:16:@2214.4]
  reg [31:0] _RAND_19;
  reg [21:0] _T_207; // @[Reg.scala 11:16:@2218.4]
  reg [31:0] _RAND_20;
  reg [21:0] _T_210; // @[Reg.scala 11:16:@2223.4]
  reg [31:0] _RAND_21;
  reg [21:0] _T_212; // @[Reg.scala 11:16:@2227.4]
  reg [31:0] _RAND_22;
  reg [21:0] _T_214; // @[Reg.scala 11:16:@2231.4]
  reg [31:0] _RAND_23;
  reg  _T_217; // @[Reg.scala 11:16:@2236.4]
  reg [31:0] _RAND_24;
  reg  _T_219; // @[Reg.scala 11:16:@2240.4]
  reg [31:0] _RAND_25;
  reg  _T_221; // @[Reg.scala 11:16:@2244.4]
  reg [31:0] _RAND_26;
  reg  _T_223; // @[Reg.scala 11:16:@2248.4]
  reg [31:0] _RAND_27;
  reg  _T_225; // @[Reg.scala 11:16:@2252.4]
  reg [31:0] _RAND_28;
  reg  _T_227; // @[Reg.scala 11:16:@2256.4]
  reg [31:0] _RAND_29;
  reg  _T_229; // @[Reg.scala 11:16:@2260.4]
  reg [31:0] _RAND_30;
  reg  _T_231; // @[Reg.scala 11:16:@2264.4]
  reg [31:0] _RAND_31;
  AT m_AT ( // @[Winograd.scala 454:18:@2043.4]
    .clock(m_AT_clock),
    .io_dIn_0(m_AT_io_dIn_0),
    .io_dIn_1(m_AT_io_dIn_1),
    .io_dIn_2(m_AT_io_dIn_2),
    .io_dIn_3(m_AT_io_dIn_3),
    .io_dOut_0(m_AT_io_dOut_0),
    .io_dOut_1(m_AT_io_dOut_1)
  );
  assign _T_162 = value + 2'h1; // @[Counter.scala 35:22:@2134.6]
  assign _T_163 = _T_162[1:0]; // @[Counter.scala 35:22:@2135.6]
  assign _GEN_4 = _T_156 ? _T_163 : value; // @[Counter.scala 63:17:@2132.4]
  assign _T_180 = value == 2'h1; // @[Winograd.scala 489:14:@2163.4]
  assign _T_182 = value == 2'h2; // @[Winograd.scala 494:20:@2171.6]
  assign _GEN_6 = _T_182 ? $signed(out2_0) : $signed(22'sh0); // @[Winograd.scala 494:28:@2172.6]
  assign _GEN_7 = _T_182 ? $signed(out2_1) : $signed(22'sh0); // @[Winograd.scala 494:28:@2172.6]
  assign _GEN_8 = _T_182 ? $signed(out2_2) : $signed(22'sh0); // @[Winograd.scala 494:28:@2172.6]
  assign _GEN_9 = _T_182 ? $signed(out2_3) : $signed(22'sh0); // @[Winograd.scala 494:28:@2172.6]
  assign out1_0 = m_AT_io_dOut_0; // @[Winograd.scala 469:19:@2068.4 Winograd.scala 469:19:@2069.4 Winograd.scala 482:10:@2139.4]
  assign io_dOut_0 = _T_193; // @[Winograd.scala 506:15:@2196.4]
  assign io_dOut_1 = _T_200; // @[Winograd.scala 506:15:@2209.4]
  assign io_dOut_2 = _T_207; // @[Winograd.scala 506:15:@2222.4]
  assign io_dOut_3 = _T_214; // @[Winograd.scala 506:15:@2235.4]
  assign io_out_valid = _T_231; // @[Winograd.scala 510:15:@2268.4]
  assign m_AT_clock = clock; // @[:@2044.4]
  assign m_AT_io_dIn_0 = io_dIn_0; // @[Winograd.scala 458:19:@2046.4]
  assign m_AT_io_dIn_1 = io_dIn_1; // @[Winograd.scala 458:19:@2047.4]
  assign m_AT_io_dIn_2 = io_dIn_2; // @[Winograd.scala 458:19:@2048.4]
  assign m_AT_io_dIn_3 = io_dIn_3; // @[Winograd.scala 458:19:@2049.4]
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
module Winograd( // @[:@2592.2]
  input         clock, // @[:@2593.4]
  input         reset, // @[:@2594.4]
  input         io_mac_in_valid, // @[:@2595.4]
  input  [7:0]  io_dIn_0, // @[:@2595.4]
  input  [7:0]  io_dIn_1, // @[:@2595.4]
  input  [7:0]  io_dIn_2, // @[:@2595.4]
  input  [7:0]  io_dIn_3, // @[:@2595.4]
  input  [9:0]  io_dIn_G_0, // @[:@2595.4]
  input  [9:0]  io_dIn_G_1, // @[:@2595.4]
  input  [9:0]  io_dIn_G_2, // @[:@2595.4]
  input  [9:0]  io_dIn_G_3, // @[:@2595.4]
  output [21:0] io_dOut, // @[:@2595.4]
  output        io_out_valid // @[:@2595.4]
);
  wire  BT_module_clock; // @[Winograd.scala 258:22:@2598.4]
  wire  BT_module_reset; // @[Winograd.scala 258:22:@2598.4]
  wire  BT_module_io_mac_in_valid; // @[Winograd.scala 258:22:@2598.4]
  wire [7:0] BT_module_io_dIn_0; // @[Winograd.scala 258:22:@2598.4]
  wire [7:0] BT_module_io_dIn_1; // @[Winograd.scala 258:22:@2598.4]
  wire [7:0] BT_module_io_dIn_2; // @[Winograd.scala 258:22:@2598.4]
  wire [7:0] BT_module_io_dIn_3; // @[Winograd.scala 258:22:@2598.4]
  wire [8:0] BT_module_io_dOut_0; // @[Winograd.scala 258:22:@2598.4]
  wire [8:0] BT_module_io_dOut_1; // @[Winograd.scala 258:22:@2598.4]
  wire [8:0] BT_module_io_dOut_2; // @[Winograd.scala 258:22:@2598.4]
  wire [8:0] BT_module_io_dOut_3; // @[Winograd.scala 258:22:@2598.4]
  wire  BT_module_io_out_valid; // @[Winograd.scala 258:22:@2598.4]
  wire  B_module_clock; // @[Winograd.scala 134:22:@2606.4]
  wire  B_module_reset; // @[Winograd.scala 134:22:@2606.4]
  wire  B_module_io_mac_in_valid; // @[Winograd.scala 134:22:@2606.4]
  wire [8:0] B_module_io_dIn_0; // @[Winograd.scala 134:22:@2606.4]
  wire [8:0] B_module_io_dIn_1; // @[Winograd.scala 134:22:@2606.4]
  wire [8:0] B_module_io_dIn_2; // @[Winograd.scala 134:22:@2606.4]
  wire [8:0] B_module_io_dIn_3; // @[Winograd.scala 134:22:@2606.4]
  wire [9:0] B_module_io_dOut_0; // @[Winograd.scala 134:22:@2606.4]
  wire [9:0] B_module_io_dOut_1; // @[Winograd.scala 134:22:@2606.4]
  wire [9:0] B_module_io_dOut_2; // @[Winograd.scala 134:22:@2606.4]
  wire [9:0] B_module_io_dOut_3; // @[Winograd.scala 134:22:@2606.4]
  wire  B_module_io_out_valid; // @[Winograd.scala 134:22:@2606.4]
  wire  MUL_module_clock; // @[Winograd.scala 391:22:@2614.4]
  wire  MUL_module_io_mac_in_valid; // @[Winograd.scala 391:22:@2614.4]
  wire [9:0] MUL_module_io_dIn_B_0; // @[Winograd.scala 391:22:@2614.4]
  wire [9:0] MUL_module_io_dIn_B_1; // @[Winograd.scala 391:22:@2614.4]
  wire [9:0] MUL_module_io_dIn_B_2; // @[Winograd.scala 391:22:@2614.4]
  wire [9:0] MUL_module_io_dIn_B_3; // @[Winograd.scala 391:22:@2614.4]
  wire [9:0] MUL_module_io_dIn_G_0; // @[Winograd.scala 391:22:@2614.4]
  wire [9:0] MUL_module_io_dIn_G_1; // @[Winograd.scala 391:22:@2614.4]
  wire [9:0] MUL_module_io_dIn_G_2; // @[Winograd.scala 391:22:@2614.4]
  wire [9:0] MUL_module_io_dIn_G_3; // @[Winograd.scala 391:22:@2614.4]
  wire [19:0] MUL_module_io_dOut_0; // @[Winograd.scala 391:22:@2614.4]
  wire [19:0] MUL_module_io_dOut_1; // @[Winograd.scala 391:22:@2614.4]
  wire [19:0] MUL_module_io_dOut_2; // @[Winograd.scala 391:22:@2614.4]
  wire [19:0] MUL_module_io_dOut_3; // @[Winograd.scala 391:22:@2614.4]
  wire  MUL_module_io_out_valid; // @[Winograd.scala 391:22:@2614.4]
  wire  AT_module_clock; // @[Winograd.scala 515:22:@2626.4]
  wire  AT_module_reset; // @[Winograd.scala 515:22:@2626.4]
  wire  AT_module_io_mac_in_valid; // @[Winograd.scala 515:22:@2626.4]
  wire [19:0] AT_module_io_dIn_0; // @[Winograd.scala 515:22:@2626.4]
  wire [19:0] AT_module_io_dIn_1; // @[Winograd.scala 515:22:@2626.4]
  wire [19:0] AT_module_io_dIn_2; // @[Winograd.scala 515:22:@2626.4]
  wire [19:0] AT_module_io_dIn_3; // @[Winograd.scala 515:22:@2626.4]
  wire [21:0] AT_module_io_dOut_0; // @[Winograd.scala 515:22:@2626.4]
  wire [21:0] AT_module_io_dOut_1; // @[Winograd.scala 515:22:@2626.4]
  wire [21:0] AT_module_io_dOut_2; // @[Winograd.scala 515:22:@2626.4]
  wire [21:0] AT_module_io_dOut_3; // @[Winograd.scala 515:22:@2626.4]
  wire  AT_module_io_out_valid; // @[Winograd.scala 515:22:@2626.4]
  wire  AT_module_1_clock; // @[Winograd.scala 515:22:@2634.4]
  wire  AT_module_1_reset; // @[Winograd.scala 515:22:@2634.4]
  wire  AT_module_1_io_mac_in_valid; // @[Winograd.scala 515:22:@2634.4]
  wire [19:0] AT_module_1_io_dIn_0; // @[Winograd.scala 515:22:@2634.4]
  wire [19:0] AT_module_1_io_dIn_1; // @[Winograd.scala 515:22:@2634.4]
  wire [19:0] AT_module_1_io_dIn_2; // @[Winograd.scala 515:22:@2634.4]
  wire [19:0] AT_module_1_io_dIn_3; // @[Winograd.scala 515:22:@2634.4]
  wire [21:0] AT_module_1_io_dOut_0; // @[Winograd.scala 515:22:@2634.4]
  wire [21:0] AT_module_1_io_dOut_1; // @[Winograd.scala 515:22:@2634.4]
  wire [21:0] AT_module_1_io_dOut_2; // @[Winograd.scala 515:22:@2634.4]
  wire [21:0] AT_module_1_io_dOut_3; // @[Winograd.scala 515:22:@2634.4]
  wire  AT_module_1_io_out_valid; // @[Winograd.scala 515:22:@2634.4]
  reg [21:0] out; // @[Winograd.scala 549:18:@2597.4]
  reg [31:0] _RAND_0;
  reg [21:0] _T_51; // @[Reg.scala 11:16:@2643.4]
  reg [31:0] _RAND_1;
  wire  _T_53; // @[Winograd.scala 562:29:@2648.4]
  wire [19:0] _GEN_1; // @[Winograd.scala 518:22:@2638.4]
  wire [19:0] _GEN_2; // @[Winograd.scala 518:22:@2639.4]
  wire [19:0] _GEN_3; // @[Winograd.scala 518:22:@2640.4]
  wire [19:0] _GEN_4; // @[Winograd.scala 518:22:@2641.4]
  BT_module BT_module ( // @[Winograd.scala 258:22:@2598.4]
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
  B_module B_module ( // @[Winograd.scala 134:22:@2606.4]
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
  MUL_module MUL_module ( // @[Winograd.scala 391:22:@2614.4]
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
  AT_module AT_module ( // @[Winograd.scala 515:22:@2626.4]
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
  AT_module AT_module_1 ( // @[Winograd.scala 515:22:@2634.4]
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
  assign _T_53 = $signed(AT_module_1_io_dOut_3) == $signed(22'sh0); // @[Winograd.scala 562:29:@2648.4]
  assign io_dOut = _T_53 ? $signed(out) : $signed(AT_module_1_io_dOut_3); // @[Winograd.scala 562:10:@2650.4]
  assign io_out_valid = AT_module_1_io_out_valid; // @[Winograd.scala 560:15:@2642.4]
  assign BT_module_clock = clock; // @[:@2599.4]
  assign BT_module_reset = reset; // @[:@2600.4]
  assign BT_module_io_mac_in_valid = io_mac_in_valid; // @[Winograd.scala 259:25:@2601.4]
  assign BT_module_io_dIn_0 = io_dIn_0; // @[Winograd.scala 261:22:@2602.4]
  assign BT_module_io_dIn_1 = io_dIn_1; // @[Winograd.scala 261:22:@2603.4]
  assign BT_module_io_dIn_2 = io_dIn_2; // @[Winograd.scala 261:22:@2604.4]
  assign BT_module_io_dIn_3 = io_dIn_3; // @[Winograd.scala 261:22:@2605.4]
  assign B_module_clock = clock; // @[:@2607.4]
  assign B_module_reset = reset; // @[:@2608.4]
  assign B_module_io_mac_in_valid = BT_module_io_out_valid; // @[Winograd.scala 135:25:@2609.4]
  assign B_module_io_dIn_0 = BT_module_io_dOut_0; // @[Winograd.scala 137:22:@2610.4]
  assign B_module_io_dIn_1 = BT_module_io_dOut_1; // @[Winograd.scala 137:22:@2611.4]
  assign B_module_io_dIn_2 = BT_module_io_dOut_2; // @[Winograd.scala 137:22:@2612.4]
  assign B_module_io_dIn_3 = BT_module_io_dOut_3; // @[Winograd.scala 137:22:@2613.4]
  assign MUL_module_clock = clock; // @[:@2615.4]
  assign MUL_module_io_mac_in_valid = B_module_io_out_valid; // @[Winograd.scala 392:25:@2617.4]
  assign MUL_module_io_dIn_B_0 = B_module_io_dOut_0; // @[Winograd.scala 394:24:@2618.4]
  assign MUL_module_io_dIn_B_1 = B_module_io_dOut_1; // @[Winograd.scala 394:24:@2620.4]
  assign MUL_module_io_dIn_B_2 = B_module_io_dOut_2; // @[Winograd.scala 394:24:@2622.4]
  assign MUL_module_io_dIn_B_3 = B_module_io_dOut_3; // @[Winograd.scala 394:24:@2624.4]
  assign MUL_module_io_dIn_G_0 = io_dIn_G_0; // @[Winograd.scala 395:24:@2619.4]
  assign MUL_module_io_dIn_G_1 = io_dIn_G_1; // @[Winograd.scala 395:24:@2621.4]
  assign MUL_module_io_dIn_G_2 = io_dIn_G_2; // @[Winograd.scala 395:24:@2623.4]
  assign MUL_module_io_dIn_G_3 = io_dIn_G_3; // @[Winograd.scala 395:24:@2625.4]
  assign AT_module_clock = clock; // @[:@2627.4]
  assign AT_module_reset = reset; // @[:@2628.4]
  assign AT_module_io_mac_in_valid = MUL_module_io_out_valid; // @[Winograd.scala 516:25:@2629.4]
  assign AT_module_io_dIn_0 = MUL_module_io_dOut_0; // @[Winograd.scala 518:22:@2630.4]
  assign AT_module_io_dIn_1 = MUL_module_io_dOut_1; // @[Winograd.scala 518:22:@2631.4]
  assign AT_module_io_dIn_2 = MUL_module_io_dOut_2; // @[Winograd.scala 518:22:@2632.4]
  assign AT_module_io_dIn_3 = MUL_module_io_dOut_3; // @[Winograd.scala 518:22:@2633.4]
  assign AT_module_1_clock = clock; // @[:@2635.4]
  assign AT_module_1_reset = reset; // @[:@2636.4]
  assign AT_module_1_io_mac_in_valid = AT_module_io_out_valid; // @[Winograd.scala 516:25:@2637.4]
  assign _GEN_1 = AT_module_io_dOut_0[19:0]; // @[Winograd.scala 518:22:@2638.4]
  assign AT_module_1_io_dIn_0 = $signed(_GEN_1); // @[Winograd.scala 518:22:@2638.4]
  assign _GEN_2 = AT_module_io_dOut_1[19:0]; // @[Winograd.scala 518:22:@2639.4]
  assign AT_module_1_io_dIn_1 = $signed(_GEN_2); // @[Winograd.scala 518:22:@2639.4]
  assign _GEN_3 = AT_module_io_dOut_2[19:0]; // @[Winograd.scala 518:22:@2640.4]
  assign AT_module_1_io_dIn_2 = $signed(_GEN_3); // @[Winograd.scala 518:22:@2640.4]
  assign _GEN_4 = AT_module_io_dOut_3[19:0]; // @[Winograd.scala 518:22:@2641.4]
  assign AT_module_1_io_dIn_3 = $signed(_GEN_4); // @[Winograd.scala 518:22:@2641.4]
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
module data_trans( // @[:@2652.2]
  input         clock, // @[:@2653.4]
  input         reset, // @[:@2654.4]
  input         io_input_valid, // @[:@2655.4]
  output        io_output_valid, // @[:@2655.4]
  output [7:0]  io_RAM_OUT_0, // @[:@2655.4]
  output [7:0]  io_RAM_OUT_1, // @[:@2655.4]
  output [7:0]  io_RAM_OUT_2, // @[:@2655.4]
  output [7:0]  io_RAM_OUT_3, // @[:@2655.4]
  output [21:0] io_result // @[:@2655.4]
);
  wire  data_gen_clock; // @[SRAM.scala 237:22:@2657.4]
  wire  data_gen_reset; // @[SRAM.scala 237:22:@2657.4]
  wire  data_gen_io_input_valid; // @[SRAM.scala 237:22:@2657.4]
  wire [7:0] data_gen_io_dOut; // @[SRAM.scala 237:22:@2657.4]
  wire [9:0] data_gen_io_dOut_addr; // @[SRAM.scala 237:22:@2657.4]
  wire  data_gen_io_dOut_valid; // @[SRAM.scala 237:22:@2657.4]
  wire  padding_clock; // @[SRAM.scala 238:21:@2660.4]
  wire  padding_reset; // @[SRAM.scala 238:21:@2660.4]
  wire [7:0] padding_io_dIn; // @[SRAM.scala 238:21:@2660.4]
  wire  padding_io_in_valid; // @[SRAM.scala 238:21:@2660.4]
  wire [7:0] padding_io_dOut; // @[SRAM.scala 238:21:@2660.4]
  wire  padding_io_out_vaild; // @[SRAM.scala 238:21:@2660.4]
  wire  transfer_io_out_valid; // @[SRAM.scala 239:22:@2663.4]
  wire [7:0] transfer_io_RAM_OUT_5; // @[SRAM.scala 239:22:@2663.4]
  wire [7:0] transfer_io_RAM_OUT_4; // @[SRAM.scala 239:22:@2663.4]
  wire [7:0] transfer_io_RAM_OUT_3; // @[SRAM.scala 239:22:@2663.4]
  wire [7:0] transfer_io_RAM_OUT_2; // @[SRAM.scala 239:22:@2663.4]
  wire [7:0] transfer_io_RAM_OUT_1; // @[SRAM.scala 239:22:@2663.4]
  wire [7:0] transfer_io_RAM_OUT_0; // @[SRAM.scala 239:22:@2663.4]
  wire  transfer_io_input_valid; // @[SRAM.scala 239:22:@2663.4]
  wire [9:0] transfer_io_dIn_addr; // @[SRAM.scala 239:22:@2663.4]
  wire [7:0] transfer_io_dIn; // @[SRAM.scala 239:22:@2663.4]
  wire  transfer_reset; // @[SRAM.scala 239:22:@2663.4]
  wire  transfer_clock; // @[SRAM.scala 239:22:@2663.4]
  wire  dG_in_clock; // @[SRAM.scala 240:19:@2676.4]
  wire  dG_in_reset; // @[SRAM.scala 240:19:@2676.4]
  wire  dG_in_io_input_valid; // @[SRAM.scala 240:19:@2676.4]
  wire [7:0] dG_in_io_dOut_0; // @[SRAM.scala 240:19:@2676.4]
  wire [7:0] dG_in_io_dOut_1; // @[SRAM.scala 240:19:@2676.4]
  wire [7:0] dG_in_io_dOut_2; // @[SRAM.scala 240:19:@2676.4]
  wire [7:0] dG_in_io_dOut_3; // @[SRAM.scala 240:19:@2676.4]
  wire  rank_change_clock; // @[SRAM.scala 241:25:@2679.4]
  wire  rank_change_reset; // @[SRAM.scala 241:25:@2679.4]
  wire  rank_change_io_input_valid; // @[SRAM.scala 241:25:@2679.4]
  wire [7:0] rank_change_io_dIn_0; // @[SRAM.scala 241:25:@2679.4]
  wire [7:0] rank_change_io_dIn_1; // @[SRAM.scala 241:25:@2679.4]
  wire [7:0] rank_change_io_dIn_2; // @[SRAM.scala 241:25:@2679.4]
  wire [7:0] rank_change_io_dIn_3; // @[SRAM.scala 241:25:@2679.4]
  wire [7:0] rank_change_io_dIn_4; // @[SRAM.scala 241:25:@2679.4]
  wire [7:0] rank_change_io_dIn_5; // @[SRAM.scala 241:25:@2679.4]
  wire [7:0] rank_change_io_dOut_0; // @[SRAM.scala 241:25:@2679.4]
  wire [7:0] rank_change_io_dOut_1; // @[SRAM.scala 241:25:@2679.4]
  wire [7:0] rank_change_io_dOut_2; // @[SRAM.scala 241:25:@2679.4]
  wire [7:0] rank_change_io_dOut_3; // @[SRAM.scala 241:25:@2679.4]
  wire  rank_change_io_output_valid; // @[SRAM.scala 241:25:@2679.4]
  wire  winograd_clock; // @[SRAM.scala 242:22:@2682.4]
  wire  winograd_reset; // @[SRAM.scala 242:22:@2682.4]
  wire  winograd_io_mac_in_valid; // @[SRAM.scala 242:22:@2682.4]
  wire [7:0] winograd_io_dIn_0; // @[SRAM.scala 242:22:@2682.4]
  wire [7:0] winograd_io_dIn_1; // @[SRAM.scala 242:22:@2682.4]
  wire [7:0] winograd_io_dIn_2; // @[SRAM.scala 242:22:@2682.4]
  wire [7:0] winograd_io_dIn_3; // @[SRAM.scala 242:22:@2682.4]
  wire [9:0] winograd_io_dIn_G_0; // @[SRAM.scala 242:22:@2682.4]
  wire [9:0] winograd_io_dIn_G_1; // @[SRAM.scala 242:22:@2682.4]
  wire [9:0] winograd_io_dIn_G_2; // @[SRAM.scala 242:22:@2682.4]
  wire [9:0] winograd_io_dIn_G_3; // @[SRAM.scala 242:22:@2682.4]
  wire [21:0] winograd_io_dOut; // @[SRAM.scala 242:22:@2682.4]
  wire  winograd_io_out_valid; // @[SRAM.scala 242:22:@2682.4]
  reg  _T_31; // @[Reg.scala 11:16:@2700.4]
  reg [31:0] _RAND_0;
  reg  _T_33; // @[Reg.scala 11:16:@2704.4]
  reg [31:0] _RAND_1;
  reg  _T_35; // @[Reg.scala 11:16:@2708.4]
  reg [31:0] _RAND_2;
  reg  _T_37; // @[Reg.scala 11:16:@2712.4]
  reg [31:0] _RAND_3;
  reg  _T_39; // @[Reg.scala 11:16:@2716.4]
  reg [31:0] _RAND_4;
  reg  _T_42; // @[Reg.scala 11:16:@2721.4]
  reg [31:0] _RAND_5;
  reg  _T_44; // @[Reg.scala 11:16:@2725.4]
  reg [31:0] _RAND_6;
  reg  _T_46; // @[Reg.scala 11:16:@2729.4]
  reg [31:0] _RAND_7;
  reg  _T_48; // @[Reg.scala 11:16:@2733.4]
  reg [31:0] _RAND_8;
  reg  _T_50; // @[Reg.scala 11:16:@2737.4]
  reg [31:0] _RAND_9;
  reg  _T_52; // @[Reg.scala 11:16:@2741.4]
  reg [31:0] _RAND_10;
  reg  _T_54; // @[Reg.scala 11:16:@2745.4]
  reg [31:0] _RAND_11;
  reg  _T_56; // @[Reg.scala 11:16:@2749.4]
  reg [31:0] _RAND_12;
  reg  _T_58; // @[Reg.scala 11:16:@2753.4]
  reg [31:0] _RAND_13;
  reg  _T_60; // @[Reg.scala 11:16:@2757.4]
  reg [31:0] _RAND_14;
  reg  _T_62; // @[Reg.scala 11:16:@2761.4]
  reg [31:0] _RAND_15;
  reg  _T_64; // @[Reg.scala 11:16:@2765.4]
  reg [31:0] _RAND_16;
  reg  _T_66; // @[Reg.scala 11:16:@2769.4]
  reg [31:0] _RAND_17;
  wire [7:0] _T_67; // @[SRAM.scala 277:56:@2775.6]
  wire [7:0] _T_68; // @[SRAM.scala 278:52:@2777.6]
  wire [7:0] _T_69; // @[SRAM.scala 277:56:@2779.6]
  wire [7:0] _T_70; // @[SRAM.scala 278:52:@2781.6]
  wire [7:0] _T_71; // @[SRAM.scala 277:56:@2783.6]
  wire [7:0] _T_72; // @[SRAM.scala 278:52:@2785.6]
  wire [7:0] _T_73; // @[SRAM.scala 277:56:@2787.6]
  wire [7:0] _T_74; // @[SRAM.scala 278:52:@2789.6]
  wire [7:0] _GEN_19; // @[SRAM.scala 275:33:@2774.4]
  wire [7:0] _GEN_21; // @[SRAM.scala 275:33:@2774.4]
  wire [7:0] _GEN_23; // @[SRAM.scala 275:33:@2774.4]
  wire [7:0] _GEN_25; // @[SRAM.scala 275:33:@2774.4]
  wire [21:0] _T_83; // @[SRAM.scala 295:39:@2804.6]
  data_gen data_gen ( // @[SRAM.scala 237:22:@2657.4]
    .clock(data_gen_clock),
    .reset(data_gen_reset),
    .io_input_valid(data_gen_io_input_valid),
    .io_dOut(data_gen_io_dOut),
    .io_dOut_addr(data_gen_io_dOut_addr),
    .io_dOut_valid(data_gen_io_dOut_valid)
  );
  Padding padding ( // @[SRAM.scala 238:21:@2660.4]
    .clock(padding_clock),
    .reset(padding_reset),
    .io_dIn(padding_io_dIn),
    .io_in_valid(padding_io_in_valid),
    .io_dOut(padding_io_dOut),
    .io_out_vaild(padding_io_out_vaild)
  );
  Transfer transfer ( // @[SRAM.scala 239:22:@2663.4]
    .io_out_valid(transfer_io_out_valid),
    .io_RAM_OUT_5(transfer_io_RAM_OUT_5),
    .io_RAM_OUT_4(transfer_io_RAM_OUT_4),
    .io_RAM_OUT_3(transfer_io_RAM_OUT_3),
    .io_RAM_OUT_2(transfer_io_RAM_OUT_2),
    .io_RAM_OUT_1(transfer_io_RAM_OUT_1),
    .io_RAM_OUT_0(transfer_io_RAM_OUT_0),
    .io_input_valid(transfer_io_input_valid),
    .io_dIn_addr(transfer_io_dIn_addr),
    .io_dIn(transfer_io_dIn),
    .reset(transfer_reset),
    .clock(transfer_clock)
  );
  G_gen dG_in ( // @[SRAM.scala 240:19:@2676.4]
    .clock(dG_in_clock),
    .reset(dG_in_reset),
    .io_input_valid(dG_in_io_input_valid),
    .io_dOut_0(dG_in_io_dOut_0),
    .io_dOut_1(dG_in_io_dOut_1),
    .io_dOut_2(dG_in_io_dOut_2),
    .io_dOut_3(dG_in_io_dOut_3)
  );
  Rank_Change rank_change ( // @[SRAM.scala 241:25:@2679.4]
    .clock(rank_change_clock),
    .reset(rank_change_reset),
    .io_input_valid(rank_change_io_input_valid),
    .io_dIn_0(rank_change_io_dIn_0),
    .io_dIn_1(rank_change_io_dIn_1),
    .io_dIn_2(rank_change_io_dIn_2),
    .io_dIn_3(rank_change_io_dIn_3),
    .io_dIn_4(rank_change_io_dIn_4),
    .io_dIn_5(rank_change_io_dIn_5),
    .io_dOut_0(rank_change_io_dOut_0),
    .io_dOut_1(rank_change_io_dOut_1),
    .io_dOut_2(rank_change_io_dOut_2),
    .io_dOut_3(rank_change_io_dOut_3),
    .io_output_valid(rank_change_io_output_valid)
  );
  Winograd winograd ( // @[SRAM.scala 242:22:@2682.4]
    .clock(winograd_clock),
    .reset(winograd_reset),
    .io_mac_in_valid(winograd_io_mac_in_valid),
    .io_dIn_0(winograd_io_dIn_0),
    .io_dIn_1(winograd_io_dIn_1),
    .io_dIn_2(winograd_io_dIn_2),
    .io_dIn_3(winograd_io_dIn_3),
    .io_dIn_G_0(winograd_io_dIn_G_0),
    .io_dIn_G_1(winograd_io_dIn_G_1),
    .io_dIn_G_2(winograd_io_dIn_G_2),
    .io_dIn_G_3(winograd_io_dIn_G_3),
    .io_dOut(winograd_io_dOut),
    .io_out_valid(winograd_io_out_valid)
  );
  assign _T_67 = $signed(rank_change_io_dOut_0); // @[SRAM.scala 277:56:@2775.6]
  assign _T_68 = $signed(dG_in_io_dOut_0); // @[SRAM.scala 278:52:@2777.6]
  assign _T_69 = $signed(rank_change_io_dOut_1); // @[SRAM.scala 277:56:@2779.6]
  assign _T_70 = $signed(dG_in_io_dOut_1); // @[SRAM.scala 278:52:@2781.6]
  assign _T_71 = $signed(rank_change_io_dOut_2); // @[SRAM.scala 277:56:@2783.6]
  assign _T_72 = $signed(dG_in_io_dOut_2); // @[SRAM.scala 278:52:@2785.6]
  assign _T_73 = $signed(rank_change_io_dOut_3); // @[SRAM.scala 277:56:@2787.6]
  assign _T_74 = $signed(dG_in_io_dOut_3); // @[SRAM.scala 278:52:@2789.6]
  assign _GEN_19 = winograd_io_mac_in_valid ? $signed(_T_68) : $signed(8'sh0); // @[SRAM.scala 275:33:@2774.4]
  assign _GEN_21 = winograd_io_mac_in_valid ? $signed(_T_70) : $signed(8'sh0); // @[SRAM.scala 275:33:@2774.4]
  assign _GEN_23 = winograd_io_mac_in_valid ? $signed(_T_72) : $signed(8'sh0); // @[SRAM.scala 275:33:@2774.4]
  assign _GEN_25 = winograd_io_mac_in_valid ? $signed(_T_74) : $signed(8'sh0); // @[SRAM.scala 275:33:@2774.4]
  assign _T_83 = $unsigned(winograd_io_dOut); // @[SRAM.scala 295:39:@2804.6]
  assign io_output_valid = winograd_io_out_valid; // @[SRAM.scala 292:18:@2802.4]
  assign io_RAM_OUT_0 = rank_change_io_dOut_0; // @[SRAM.scala 299:13:@2810.4]
  assign io_RAM_OUT_1 = rank_change_io_dOut_1; // @[SRAM.scala 299:13:@2811.4]
  assign io_RAM_OUT_2 = rank_change_io_dOut_2; // @[SRAM.scala 299:13:@2812.4]
  assign io_RAM_OUT_3 = rank_change_io_dOut_3; // @[SRAM.scala 299:13:@2813.4]
  assign io_result = io_output_valid ? _T_83 : 22'h0; // @[SRAM.scala 295:14:@2805.6 SRAM.scala 297:14:@2808.6]
  assign data_gen_clock = clock; // @[:@2658.4]
  assign data_gen_reset = reset; // @[:@2659.4]
  assign data_gen_io_input_valid = io_input_valid; // @[SRAM.scala 248:26:@2687.4]
  assign padding_clock = clock; // @[:@2661.4]
  assign padding_reset = reset; // @[:@2662.4]
  assign padding_io_dIn = data_gen_io_dOut; // @[SRAM.scala 251:17:@2689.4]
  assign padding_io_in_valid = data_gen_io_dOut_valid; // @[SRAM.scala 250:22:@2688.4]
  assign transfer_io_input_valid = padding_io_out_vaild; // @[SRAM.scala 259:29:@2691.4]
  assign transfer_io_dIn_addr = data_gen_io_dOut_addr; // @[SRAM.scala 257:26:@2690.4]
  assign transfer_io_dIn = padding_io_dOut; // @[SRAM.scala 260:21:@2692.4]
  assign transfer_reset = reset; // @[SRAM.scala 246:20:@2685.4]
  assign transfer_clock = clock; // @[SRAM.scala 247:20:@2686.4]
  assign dG_in_clock = clock; // @[:@2677.4]
  assign dG_in_reset = reset; // @[:@2678.4]
  assign dG_in_io_input_valid = _T_66; // @[SRAM.scala 273:23:@2773.4]
  assign rank_change_clock = clock; // @[:@2680.4]
  assign rank_change_reset = reset; // @[:@2681.4]
  assign rank_change_io_input_valid = transfer_io_out_valid; // @[SRAM.scala 263:29:@2693.4]
  assign rank_change_io_dIn_0 = transfer_io_RAM_OUT_0; // @[SRAM.scala 264:24:@2694.4]
  assign rank_change_io_dIn_1 = transfer_io_RAM_OUT_1; // @[SRAM.scala 265:24:@2695.4]
  assign rank_change_io_dIn_2 = transfer_io_RAM_OUT_2; // @[SRAM.scala 266:24:@2696.4]
  assign rank_change_io_dIn_3 = transfer_io_RAM_OUT_3; // @[SRAM.scala 267:24:@2697.4]
  assign rank_change_io_dIn_4 = transfer_io_RAM_OUT_4; // @[SRAM.scala 268:24:@2698.4]
  assign rank_change_io_dIn_5 = transfer_io_RAM_OUT_5; // @[SRAM.scala 269:24:@2699.4]
  assign winograd_clock = clock; // @[:@2683.4]
  assign winograd_reset = reset; // @[:@2684.4]
  assign winograd_io_mac_in_valid = _T_39; // @[SRAM.scala 272:27:@2720.4]
  assign winograd_io_dIn_0 = winograd_io_mac_in_valid ? $signed(_T_67) : $signed(8'sh0); // @[SRAM.scala 277:25:@2776.6 SRAM.scala 282:25:@2793.6]
  assign winograd_io_dIn_1 = winograd_io_mac_in_valid ? $signed(_T_69) : $signed(8'sh0); // @[SRAM.scala 277:25:@2780.6 SRAM.scala 282:25:@2795.6]
  assign winograd_io_dIn_2 = winograd_io_mac_in_valid ? $signed(_T_71) : $signed(8'sh0); // @[SRAM.scala 277:25:@2784.6 SRAM.scala 282:25:@2797.6]
  assign winograd_io_dIn_3 = winograd_io_mac_in_valid ? $signed(_T_73) : $signed(8'sh0); // @[SRAM.scala 277:25:@2788.6 SRAM.scala 282:25:@2799.6]
  assign winograd_io_dIn_G_0 = {{2{_GEN_19[7]}},_GEN_19}; // @[SRAM.scala 278:27:@2778.6 SRAM.scala 283:27:@2794.6]
  assign winograd_io_dIn_G_1 = {{2{_GEN_21[7]}},_GEN_21}; // @[SRAM.scala 278:27:@2782.6 SRAM.scala 283:27:@2796.6]
  assign winograd_io_dIn_G_2 = {{2{_GEN_23[7]}},_GEN_23}; // @[SRAM.scala 278:27:@2786.6 SRAM.scala 283:27:@2798.6]
  assign winograd_io_dIn_G_3 = {{2{_GEN_25[7]}},_GEN_25}; // @[SRAM.scala 278:27:@2790.6 SRAM.scala 283:27:@2800.6]
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
  _T_31 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{$random}};
  _T_33 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{$random}};
  _T_35 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{$random}};
  _T_37 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{$random}};
  _T_39 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{$random}};
  _T_42 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{$random}};
  _T_44 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{$random}};
  _T_46 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{$random}};
  _T_48 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{$random}};
  _T_50 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{$random}};
  _T_52 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{$random}};
  _T_54 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{$random}};
  _T_56 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{$random}};
  _T_58 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{$random}};
  _T_60 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{$random}};
  _T_62 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{$random}};
  _T_64 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{$random}};
  _T_66 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    _T_31 <= transfer_io_out_valid;
    _T_33 <= _T_31;
    _T_35 <= _T_33;
    _T_37 <= _T_35;
    _T_39 <= _T_37;
    _T_42 <= transfer_io_out_valid;
    _T_44 <= _T_42;
    _T_46 <= _T_44;
    _T_48 <= _T_46;
    _T_50 <= _T_48;
    _T_52 <= _T_50;
    _T_54 <= _T_52;
    _T_56 <= _T_54;
    _T_58 <= _T_56;
    _T_60 <= _T_58;
    _T_62 <= _T_60;
    _T_64 <= _T_62;
    _T_66 <= _T_64;
  end
endmodule
