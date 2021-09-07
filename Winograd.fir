;buildInfoPackage: chisel3, version: 3.1.2, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-07-25 16:52:17.431, builtAtMillis: 1532537537431
circuit Winograd : 
  extmodule Add_8in_9out : 
    input CLK : Clock
    output S : SInt<9>
    input B : SInt<8>
    input A : SInt<8>
    
    defname = Add_8in_9out
    
    
  extmodule Add_8in_9out_1 : 
    input CLK : Clock
    output S : SInt<9>
    input B : SInt<8>
    input A : SInt<8>
    
    defname = Add_8in_9out
    
    
  extmodule Add_8in_9out_2 : 
    input CLK : Clock
    output S : SInt<9>
    input B : SInt<8>
    input A : SInt<8>
    
    defname = Add_8in_9out
    
    
  extmodule Add_8in_9out_3 : 
    input CLK : Clock
    output S : SInt<9>
    input B : SInt<8>
    input A : SInt<8>
    
    defname = Add_8in_9out
    
    
  module BT : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip dIn1 : SInt<8>, flip dIn2 : SInt<8>, flip dIn3 : SInt<8>, flip dIn4 : SInt<8>, dOut1 : SInt<9>, dOut2 : SInt<9>, dOut3 : SInt<9>, dOut4 : SInt<9>}
    
    node _T_22 = sub(asSInt(UInt<1>("h00")), io.dIn3) @[Winograd.scala 181:34]
    node _T_23 = tail(_T_22, 1) @[Winograd.scala 181:34]
    node _T_24 = asSInt(_T_23) @[Winograd.scala 181:34]
    inst Add_8in_9out of Add_8in_9out @[Winograd.scala 156:22]
    Add_8in_9out.CLK is invalid
    Add_8in_9out.S is invalid
    Add_8in_9out.B is invalid
    Add_8in_9out.A is invalid
    Add_8in_9out.A <= io.dIn1 @[Winograd.scala 157:15]
    Add_8in_9out.B <= _T_24 @[Winograd.scala 158:15]
    Add_8in_9out.CLK <= clock @[Winograd.scala 159:16]
    io.dOut1 <= Add_8in_9out.S @[Winograd.scala 181:11]
    inst Add_8in_9out_1 of Add_8in_9out_1 @[Winograd.scala 156:22]
    Add_8in_9out_1.CLK is invalid
    Add_8in_9out_1.S is invalid
    Add_8in_9out_1.B is invalid
    Add_8in_9out_1.A is invalid
    Add_8in_9out_1.A <= io.dIn2 @[Winograd.scala 157:15]
    Add_8in_9out_1.B <= io.dIn3 @[Winograd.scala 158:15]
    Add_8in_9out_1.CLK <= clock @[Winograd.scala 159:16]
    io.dOut2 <= Add_8in_9out_1.S @[Winograd.scala 182:11]
    node _T_26 = sub(asSInt(UInt<1>("h00")), io.dIn2) @[Winograd.scala 183:26]
    node _T_27 = tail(_T_26, 1) @[Winograd.scala 183:26]
    node _T_28 = asSInt(_T_27) @[Winograd.scala 183:26]
    inst Add_8in_9out_2 of Add_8in_9out_2 @[Winograd.scala 156:22]
    Add_8in_9out_2.CLK is invalid
    Add_8in_9out_2.S is invalid
    Add_8in_9out_2.B is invalid
    Add_8in_9out_2.A is invalid
    Add_8in_9out_2.A <= _T_28 @[Winograd.scala 157:15]
    Add_8in_9out_2.B <= io.dIn3 @[Winograd.scala 158:15]
    Add_8in_9out_2.CLK <= clock @[Winograd.scala 159:16]
    io.dOut3 <= Add_8in_9out_2.S @[Winograd.scala 183:11]
    node _T_30 = sub(asSInt(UInt<1>("h00")), io.dIn4) @[Winograd.scala 184:34]
    node _T_31 = tail(_T_30, 1) @[Winograd.scala 184:34]
    node _T_32 = asSInt(_T_31) @[Winograd.scala 184:34]
    inst Add_8in_9out_3 of Add_8in_9out_3 @[Winograd.scala 156:22]
    Add_8in_9out_3.CLK is invalid
    Add_8in_9out_3.S is invalid
    Add_8in_9out_3.B is invalid
    Add_8in_9out_3.A is invalid
    Add_8in_9out_3.A <= io.dIn2 @[Winograd.scala 157:15]
    Add_8in_9out_3.B <= _T_32 @[Winograd.scala 158:15]
    Add_8in_9out_3.CLK <= clock @[Winograd.scala 159:16]
    io.dOut4 <= Add_8in_9out_3.S @[Winograd.scala 184:11]
    
  module BT_module : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip mac_in_valid : UInt<1>, flip dIn : SInt<8>[4], dOut : SInt<9>[4], out_valid : UInt<1>}
    
    inst m_BT of BT @[Winograd.scala 198:18]
    m_BT.clock <= clock
    m_BT.reset <= reset
    m_BT.io.dIn1 <= io.dIn[0] @[Winograd.scala 200:15]
    m_BT.io.dIn2 <= io.dIn[1] @[Winograd.scala 201:15]
    m_BT.io.dIn3 <= io.dIn[2] @[Winograd.scala 202:15]
    m_BT.io.dIn4 <= io.dIn[3] @[Winograd.scala 203:15]
    wire _T_48 : SInt<9> @[Winograd.scala 206:14]
    node _T_49 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 206:14]
    node _T_50 = asSInt(_T_49) @[Winograd.scala 206:14]
    _T_48 <= _T_50 @[Winograd.scala 206:14]
    wire _T_54 : SInt<9> @[Winograd.scala 206:14]
    node _T_55 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 206:14]
    node _T_56 = asSInt(_T_55) @[Winograd.scala 206:14]
    _T_54 <= _T_56 @[Winograd.scala 206:14]
    wire _T_60 : SInt<9> @[Winograd.scala 206:14]
    node _T_61 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 206:14]
    node _T_62 = asSInt(_T_61) @[Winograd.scala 206:14]
    _T_60 <= _T_62 @[Winograd.scala 206:14]
    wire _T_66 : SInt<9> @[Winograd.scala 206:14]
    node _T_67 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 206:14]
    node _T_68 = asSInt(_T_67) @[Winograd.scala 206:14]
    _T_66 <= _T_68 @[Winograd.scala 206:14]
    wire out1 : SInt<9>[4] @[Winograd.scala 205:19]
    out1[0] <= _T_48 @[Winograd.scala 205:19]
    out1[1] <= _T_54 @[Winograd.scala 205:19]
    out1[2] <= _T_60 @[Winograd.scala 205:19]
    out1[3] <= _T_66 @[Winograd.scala 205:19]
    wire _T_81 : SInt<9> @[Winograd.scala 208:14]
    node _T_82 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 208:14]
    node _T_83 = asSInt(_T_82) @[Winograd.scala 208:14]
    _T_81 <= _T_83 @[Winograd.scala 208:14]
    wire _T_87 : SInt<9> @[Winograd.scala 208:14]
    node _T_88 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 208:14]
    node _T_89 = asSInt(_T_88) @[Winograd.scala 208:14]
    _T_87 <= _T_89 @[Winograd.scala 208:14]
    wire _T_93 : SInt<9> @[Winograd.scala 208:14]
    node _T_94 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 208:14]
    node _T_95 = asSInt(_T_94) @[Winograd.scala 208:14]
    _T_93 <= _T_95 @[Winograd.scala 208:14]
    wire _T_99 : SInt<9> @[Winograd.scala 208:14]
    node _T_100 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 208:14]
    node _T_101 = asSInt(_T_100) @[Winograd.scala 208:14]
    _T_99 <= _T_101 @[Winograd.scala 208:14]
    wire out2 : SInt<9>[4] @[Winograd.scala 207:19]
    out2[0] <= _T_81 @[Winograd.scala 207:19]
    out2[1] <= _T_87 @[Winograd.scala 207:19]
    out2[2] <= _T_93 @[Winograd.scala 207:19]
    out2[3] <= _T_99 @[Winograd.scala 207:19]
    wire _T_114 : SInt<9> @[Winograd.scala 210:14]
    node _T_115 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 210:14]
    node _T_116 = asSInt(_T_115) @[Winograd.scala 210:14]
    _T_114 <= _T_116 @[Winograd.scala 210:14]
    wire _T_120 : SInt<9> @[Winograd.scala 210:14]
    node _T_121 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 210:14]
    node _T_122 = asSInt(_T_121) @[Winograd.scala 210:14]
    _T_120 <= _T_122 @[Winograd.scala 210:14]
    wire _T_126 : SInt<9> @[Winograd.scala 210:14]
    node _T_127 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 210:14]
    node _T_128 = asSInt(_T_127) @[Winograd.scala 210:14]
    _T_126 <= _T_128 @[Winograd.scala 210:14]
    wire _T_132 : SInt<9> @[Winograd.scala 210:14]
    node _T_133 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 210:14]
    node _T_134 = asSInt(_T_133) @[Winograd.scala 210:14]
    _T_132 <= _T_134 @[Winograd.scala 210:14]
    wire out3 : SInt<9>[4] @[Winograd.scala 209:19]
    out3[0] <= _T_114 @[Winograd.scala 209:19]
    out3[1] <= _T_120 @[Winograd.scala 209:19]
    out3[2] <= _T_126 @[Winograd.scala 209:19]
    out3[3] <= _T_132 @[Winograd.scala 209:19]
    wire _T_147 : SInt<9> @[Winograd.scala 212:14]
    node _T_148 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 212:14]
    node _T_149 = asSInt(_T_148) @[Winograd.scala 212:14]
    _T_147 <= _T_149 @[Winograd.scala 212:14]
    wire _T_153 : SInt<9> @[Winograd.scala 212:14]
    node _T_154 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 212:14]
    node _T_155 = asSInt(_T_154) @[Winograd.scala 212:14]
    _T_153 <= _T_155 @[Winograd.scala 212:14]
    wire _T_159 : SInt<9> @[Winograd.scala 212:14]
    node _T_160 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 212:14]
    node _T_161 = asSInt(_T_160) @[Winograd.scala 212:14]
    _T_159 <= _T_161 @[Winograd.scala 212:14]
    wire _T_165 : SInt<9> @[Winograd.scala 212:14]
    node _T_166 = asUInt(asSInt(UInt<9>("h00"))) @[Winograd.scala 212:14]
    node _T_167 = asSInt(_T_166) @[Winograd.scala 212:14]
    _T_165 <= _T_167 @[Winograd.scala 212:14]
    wire out4 : SInt<9>[4] @[Winograd.scala 211:19]
    out4[0] <= _T_147 @[Winograd.scala 211:19]
    out4[1] <= _T_153 @[Winograd.scala 211:19]
    out4[2] <= _T_159 @[Winograd.scala 211:19]
    out4[3] <= _T_165 @[Winograd.scala 211:19]
    reg value : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Counter.scala 26:33]
    when io.mac_in_valid : @[Counter.scala 63:17]
      node _T_180 = eq(value, UInt<2>("h03")) @[Counter.scala 34:24]
      node _T_182 = add(value, UInt<1>("h01")) @[Counter.scala 35:22]
      node _T_183 = tail(_T_182, 1) @[Counter.scala 35:22]
      value <= _T_183 @[Counter.scala 35:13]
      skip @[Counter.scala 63:17]
    node cnt_EN = and(io.mac_in_valid, _T_180) @[Counter.scala 64:20]
    out1[0] <= m_BT.io.dOut1 @[Winograd.scala 216:10]
    reg _T_186 : SInt<9>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_186 <= m_BT.io.dOut2 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    out2[0] <= _T_186 @[Winograd.scala 217:10]
    reg _T_189 : SInt<9>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_189 <= m_BT.io.dOut3 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_191 : SInt<9>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_191 <= _T_189 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    out3[0] <= _T_191 @[Winograd.scala 218:10]
    reg _T_194 : SInt<9>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_194 <= m_BT.io.dOut4 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_196 : SInt<9>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_196 <= _T_194 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_198 : SInt<9>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_198 <= _T_196 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    out4[0] <= _T_198 @[Winograd.scala 219:10]
    reg _T_200 : SInt, clock @[Winograd.scala 221:21]
    _T_200 <= out1[0] @[Winograd.scala 221:21]
    out1[1] <= _T_200 @[Winograd.scala 221:12]
    reg _T_202 : SInt, clock @[Winograd.scala 222:21]
    _T_202 <= out2[0] @[Winograd.scala 222:21]
    out2[1] <= _T_202 @[Winograd.scala 222:12]
    reg _T_204 : SInt, clock @[Winograd.scala 223:21]
    _T_204 <= out3[0] @[Winograd.scala 223:21]
    out3[1] <= _T_204 @[Winograd.scala 223:12]
    reg _T_206 : SInt, clock @[Winograd.scala 224:21]
    _T_206 <= out4[0] @[Winograd.scala 224:21]
    out4[1] <= _T_206 @[Winograd.scala 224:12]
    reg _T_208 : SInt, clock @[Winograd.scala 221:21]
    _T_208 <= out1[1] @[Winograd.scala 221:21]
    out1[2] <= _T_208 @[Winograd.scala 221:12]
    reg _T_210 : SInt, clock @[Winograd.scala 222:21]
    _T_210 <= out2[1] @[Winograd.scala 222:21]
    out2[2] <= _T_210 @[Winograd.scala 222:12]
    reg _T_212 : SInt, clock @[Winograd.scala 223:21]
    _T_212 <= out3[1] @[Winograd.scala 223:21]
    out3[2] <= _T_212 @[Winograd.scala 223:12]
    reg _T_214 : SInt, clock @[Winograd.scala 224:21]
    _T_214 <= out4[1] @[Winograd.scala 224:21]
    out4[2] <= _T_214 @[Winograd.scala 224:12]
    reg _T_216 : SInt, clock @[Winograd.scala 221:21]
    _T_216 <= out1[2] @[Winograd.scala 221:21]
    out1[3] <= _T_216 @[Winograd.scala 221:12]
    reg _T_218 : SInt, clock @[Winograd.scala 222:21]
    _T_218 <= out2[2] @[Winograd.scala 222:21]
    out2[3] <= _T_218 @[Winograd.scala 222:12]
    reg _T_220 : SInt, clock @[Winograd.scala 223:21]
    _T_220 <= out3[2] @[Winograd.scala 223:21]
    out3[3] <= _T_220 @[Winograd.scala 223:12]
    reg _T_222 : SInt, clock @[Winograd.scala 224:21]
    _T_222 <= out4[2] @[Winograd.scala 224:21]
    out4[3] <= _T_222 @[Winograd.scala 224:12]
    node _T_224 = eq(value, UInt<1>("h00")) @[Winograd.scala 227:11]
    when _T_224 : @[Winograd.scala 227:19]
      io.dOut[0] <= out1[0] @[Winograd.scala 228:16]
      io.dOut[1] <= out1[1] @[Winograd.scala 229:16]
      io.dOut[2] <= out1[2] @[Winograd.scala 230:16]
      io.dOut[3] <= out1[3] @[Winograd.scala 231:16]
      skip @[Winograd.scala 227:19]
    else : @[Winograd.scala 232:25]
      node _T_226 = eq(value, UInt<1>("h01")) @[Winograd.scala 232:17]
      when _T_226 : @[Winograd.scala 232:25]
        io.dOut[0] <= out2[0] @[Winograd.scala 233:16]
        io.dOut[1] <= out2[1] @[Winograd.scala 234:16]
        io.dOut[2] <= out2[2] @[Winograd.scala 235:16]
        io.dOut[3] <= out2[3] @[Winograd.scala 236:16]
        skip @[Winograd.scala 232:25]
      else : @[Winograd.scala 237:24]
        node _T_228 = eq(value, UInt<2>("h02")) @[Winograd.scala 237:17]
        when _T_228 : @[Winograd.scala 237:24]
          io.dOut[0] <= out3[0] @[Winograd.scala 238:16]
          io.dOut[1] <= out3[1] @[Winograd.scala 239:16]
          io.dOut[2] <= out3[2] @[Winograd.scala 240:16]
          io.dOut[3] <= out3[3] @[Winograd.scala 241:16]
          skip @[Winograd.scala 237:24]
        else : @[Winograd.scala 242:24]
          node _T_230 = eq(value, UInt<2>("h03")) @[Winograd.scala 242:17]
          when _T_230 : @[Winograd.scala 242:24]
            io.dOut[0] <= out4[0] @[Winograd.scala 243:16]
            io.dOut[1] <= out4[1] @[Winograd.scala 244:16]
            io.dOut[2] <= out4[2] @[Winograd.scala 245:16]
            io.dOut[3] <= out4[3] @[Winograd.scala 246:16]
            skip @[Winograd.scala 242:24]
          else : @[Winograd.scala 247:14]
            io.dOut[0] <= asSInt(UInt<1>("h00")) @[Winograd.scala 248:16]
            io.dOut[1] <= asSInt(UInt<1>("h00")) @[Winograd.scala 249:15]
            io.dOut[2] <= asSInt(UInt<1>("h00")) @[Winograd.scala 250:16]
            io.dOut[3] <= asSInt(UInt<1>("h00")) @[Winograd.scala 251:16]
            skip @[Winograd.scala 247:14]
    reg _T_237 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_237 <= io.mac_in_valid @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_239 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_239 <= _T_237 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_241 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_241 <= _T_239 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_243 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_243 <= _T_241 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.out_valid <= _T_243 @[Winograd.scala 253:15]
    
  extmodule Add_9in_10out : 
    input CLK : Clock
    output S : SInt<10>
    input B : SInt<9>
    input A : SInt<9>
    
    defname = Add_9in_10out
    
    
  extmodule Add_9in_10out_1 : 
    input CLK : Clock
    output S : SInt<10>
    input B : SInt<9>
    input A : SInt<9>
    
    defname = Add_9in_10out
    
    
  extmodule Add_9in_10out_2 : 
    input CLK : Clock
    output S : SInt<10>
    input B : SInt<9>
    input A : SInt<9>
    
    defname = Add_9in_10out
    
    
  extmodule Add_9in_10out_3 : 
    input CLK : Clock
    output S : SInt<10>
    input B : SInt<9>
    input A : SInt<9>
    
    defname = Add_9in_10out
    
    
  module B : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip dIn : SInt<9>[4], dOut : SInt<10>[4]}
    
    node _T_42 = sub(asSInt(UInt<1>("h00")), io.dIn[1]) @[Winograd.scala 38:39]
    node _T_43 = tail(_T_42, 1) @[Winograd.scala 38:39]
    node _T_44 = asSInt(_T_43) @[Winograd.scala 38:39]
    inst Add_9in_10out of Add_9in_10out @[Winograd.scala 22:22]
    Add_9in_10out.CLK is invalid
    Add_9in_10out.S is invalid
    Add_9in_10out.B is invalid
    Add_9in_10out.A is invalid
    Add_9in_10out.A <= io.dIn[3] @[Winograd.scala 23:15]
    Add_9in_10out.B <= _T_44 @[Winograd.scala 24:15]
    Add_9in_10out.CLK <= clock @[Winograd.scala 25:16]
    io.dOut[0] <= Add_9in_10out.S @[Winograd.scala 38:13]
    inst Add_9in_10out_1 of Add_9in_10out_1 @[Winograd.scala 22:22]
    Add_9in_10out_1.CLK is invalid
    Add_9in_10out_1.S is invalid
    Add_9in_10out_1.B is invalid
    Add_9in_10out_1.A is invalid
    Add_9in_10out_1.A <= io.dIn[2] @[Winograd.scala 23:15]
    Add_9in_10out_1.B <= io.dIn[1] @[Winograd.scala 24:15]
    Add_9in_10out_1.CLK <= clock @[Winograd.scala 25:16]
    io.dOut[1] <= Add_9in_10out_1.S @[Winograd.scala 39:13]
    node _T_46 = sub(asSInt(UInt<1>("h00")), io.dIn[2]) @[Winograd.scala 40:39]
    node _T_47 = tail(_T_46, 1) @[Winograd.scala 40:39]
    node _T_48 = asSInt(_T_47) @[Winograd.scala 40:39]
    inst Add_9in_10out_2 of Add_9in_10out_2 @[Winograd.scala 22:22]
    Add_9in_10out_2.CLK is invalid
    Add_9in_10out_2.S is invalid
    Add_9in_10out_2.B is invalid
    Add_9in_10out_2.A is invalid
    Add_9in_10out_2.A <= io.dIn[1] @[Winograd.scala 23:15]
    Add_9in_10out_2.B <= _T_48 @[Winograd.scala 24:15]
    Add_9in_10out_2.CLK <= clock @[Winograd.scala 25:16]
    io.dOut[2] <= Add_9in_10out_2.S @[Winograd.scala 40:13]
    node _T_50 = sub(asSInt(UInt<1>("h00")), io.dIn[0]) @[Winograd.scala 41:39]
    node _T_51 = tail(_T_50, 1) @[Winograd.scala 41:39]
    node _T_52 = asSInt(_T_51) @[Winograd.scala 41:39]
    inst Add_9in_10out_3 of Add_9in_10out_3 @[Winograd.scala 22:22]
    Add_9in_10out_3.CLK is invalid
    Add_9in_10out_3.S is invalid
    Add_9in_10out_3.B is invalid
    Add_9in_10out_3.A is invalid
    Add_9in_10out_3.A <= io.dIn[2] @[Winograd.scala 23:15]
    Add_9in_10out_3.B <= _T_52 @[Winograd.scala 24:15]
    Add_9in_10out_3.CLK <= clock @[Winograd.scala 25:16]
    io.dOut[3] <= Add_9in_10out_3.S @[Winograd.scala 41:13]
    
  module B_module : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip mac_in_valid : UInt<1>, flip dIn : SInt<9>[4], dOut : SInt<10>[4], out_valid : UInt<1>}
    
    inst m_B of B @[Winograd.scala 55:17]
    m_B.clock <= clock
    m_B.reset <= reset
    m_B.io.dIn[0] <= io.dIn[0] @[Winograd.scala 57:16]
    m_B.io.dIn[1] <= io.dIn[1] @[Winograd.scala 58:16]
    m_B.io.dIn[2] <= io.dIn[2] @[Winograd.scala 59:16]
    m_B.io.dIn[3] <= io.dIn[3] @[Winograd.scala 60:16]
    wire _T_48 : SInt<10> @[Winograd.scala 66:14]
    node _T_49 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 66:14]
    node _T_50 = asSInt(_T_49) @[Winograd.scala 66:14]
    _T_48 <= _T_50 @[Winograd.scala 66:14]
    wire _T_54 : SInt<10> @[Winograd.scala 66:14]
    node _T_55 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 66:14]
    node _T_56 = asSInt(_T_55) @[Winograd.scala 66:14]
    _T_54 <= _T_56 @[Winograd.scala 66:14]
    wire _T_60 : SInt<10> @[Winograd.scala 66:14]
    node _T_61 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 66:14]
    node _T_62 = asSInt(_T_61) @[Winograd.scala 66:14]
    _T_60 <= _T_62 @[Winograd.scala 66:14]
    wire _T_66 : SInt<10> @[Winograd.scala 66:14]
    node _T_67 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 66:14]
    node _T_68 = asSInt(_T_67) @[Winograd.scala 66:14]
    _T_66 <= _T_68 @[Winograd.scala 66:14]
    wire out1 : SInt<10>[4] @[Winograd.scala 65:19]
    out1[0] <= _T_48 @[Winograd.scala 65:19]
    out1[1] <= _T_54 @[Winograd.scala 65:19]
    out1[2] <= _T_60 @[Winograd.scala 65:19]
    out1[3] <= _T_66 @[Winograd.scala 65:19]
    wire _T_81 : SInt<10> @[Winograd.scala 68:14]
    node _T_82 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 68:14]
    node _T_83 = asSInt(_T_82) @[Winograd.scala 68:14]
    _T_81 <= _T_83 @[Winograd.scala 68:14]
    wire _T_87 : SInt<10> @[Winograd.scala 68:14]
    node _T_88 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 68:14]
    node _T_89 = asSInt(_T_88) @[Winograd.scala 68:14]
    _T_87 <= _T_89 @[Winograd.scala 68:14]
    wire _T_93 : SInt<10> @[Winograd.scala 68:14]
    node _T_94 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 68:14]
    node _T_95 = asSInt(_T_94) @[Winograd.scala 68:14]
    _T_93 <= _T_95 @[Winograd.scala 68:14]
    wire _T_99 : SInt<10> @[Winograd.scala 68:14]
    node _T_100 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 68:14]
    node _T_101 = asSInt(_T_100) @[Winograd.scala 68:14]
    _T_99 <= _T_101 @[Winograd.scala 68:14]
    wire out2 : SInt<10>[4] @[Winograd.scala 67:19]
    out2[0] <= _T_81 @[Winograd.scala 67:19]
    out2[1] <= _T_87 @[Winograd.scala 67:19]
    out2[2] <= _T_93 @[Winograd.scala 67:19]
    out2[3] <= _T_99 @[Winograd.scala 67:19]
    wire _T_114 : SInt<10> @[Winograd.scala 70:14]
    node _T_115 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 70:14]
    node _T_116 = asSInt(_T_115) @[Winograd.scala 70:14]
    _T_114 <= _T_116 @[Winograd.scala 70:14]
    wire _T_120 : SInt<10> @[Winograd.scala 70:14]
    node _T_121 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 70:14]
    node _T_122 = asSInt(_T_121) @[Winograd.scala 70:14]
    _T_120 <= _T_122 @[Winograd.scala 70:14]
    wire _T_126 : SInt<10> @[Winograd.scala 70:14]
    node _T_127 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 70:14]
    node _T_128 = asSInt(_T_127) @[Winograd.scala 70:14]
    _T_126 <= _T_128 @[Winograd.scala 70:14]
    wire _T_132 : SInt<10> @[Winograd.scala 70:14]
    node _T_133 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 70:14]
    node _T_134 = asSInt(_T_133) @[Winograd.scala 70:14]
    _T_132 <= _T_134 @[Winograd.scala 70:14]
    wire out3 : SInt<10>[4] @[Winograd.scala 69:19]
    out3[0] <= _T_114 @[Winograd.scala 69:19]
    out3[1] <= _T_120 @[Winograd.scala 69:19]
    out3[2] <= _T_126 @[Winograd.scala 69:19]
    out3[3] <= _T_132 @[Winograd.scala 69:19]
    wire _T_147 : SInt<10> @[Winograd.scala 72:14]
    node _T_148 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 72:14]
    node _T_149 = asSInt(_T_148) @[Winograd.scala 72:14]
    _T_147 <= _T_149 @[Winograd.scala 72:14]
    wire _T_153 : SInt<10> @[Winograd.scala 72:14]
    node _T_154 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 72:14]
    node _T_155 = asSInt(_T_154) @[Winograd.scala 72:14]
    _T_153 <= _T_155 @[Winograd.scala 72:14]
    wire _T_159 : SInt<10> @[Winograd.scala 72:14]
    node _T_160 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 72:14]
    node _T_161 = asSInt(_T_160) @[Winograd.scala 72:14]
    _T_159 <= _T_161 @[Winograd.scala 72:14]
    wire _T_165 : SInt<10> @[Winograd.scala 72:14]
    node _T_166 = asUInt(asSInt(UInt<10>("h00"))) @[Winograd.scala 72:14]
    node _T_167 = asSInt(_T_166) @[Winograd.scala 72:14]
    _T_165 <= _T_167 @[Winograd.scala 72:14]
    wire out4 : SInt<10>[4] @[Winograd.scala 71:19]
    out4[0] <= _T_147 @[Winograd.scala 71:19]
    out4[1] <= _T_153 @[Winograd.scala 71:19]
    out4[2] <= _T_159 @[Winograd.scala 71:19]
    out4[3] <= _T_165 @[Winograd.scala 71:19]
    reg value : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Counter.scala 26:33]
    when io.mac_in_valid : @[Counter.scala 63:17]
      node _T_180 = eq(value, UInt<2>("h03")) @[Counter.scala 34:24]
      node _T_182 = add(value, UInt<1>("h01")) @[Counter.scala 35:22]
      node _T_183 = tail(_T_182, 1) @[Counter.scala 35:22]
      value <= _T_183 @[Counter.scala 35:13]
      skip @[Counter.scala 63:17]
    node cnt_EN = and(io.mac_in_valid, _T_180) @[Counter.scala 64:20]
    out1[0] <= m_B.io.dOut[0] @[Winograd.scala 90:10]
    reg _T_186 : SInt<10>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_186 <= m_B.io.dOut[1] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    out2[0] <= _T_186 @[Winograd.scala 91:10]
    reg _T_189 : SInt<10>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_189 <= m_B.io.dOut[2] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_191 : SInt<10>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_191 <= _T_189 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    out3[0] <= _T_191 @[Winograd.scala 92:10]
    reg _T_194 : SInt<10>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_194 <= m_B.io.dOut[3] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_196 : SInt<10>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_196 <= _T_194 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_198 : SInt<10>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_198 <= _T_196 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    out4[0] <= _T_198 @[Winograd.scala 93:10]
    reg _T_200 : SInt, clock @[Winograd.scala 96:21]
    _T_200 <= out1[0] @[Winograd.scala 96:21]
    out1[1] <= _T_200 @[Winograd.scala 96:12]
    reg _T_202 : SInt, clock @[Winograd.scala 97:21]
    _T_202 <= out2[0] @[Winograd.scala 97:21]
    out2[1] <= _T_202 @[Winograd.scala 97:12]
    reg _T_204 : SInt, clock @[Winograd.scala 98:21]
    _T_204 <= out3[0] @[Winograd.scala 98:21]
    out3[1] <= _T_204 @[Winograd.scala 98:12]
    reg _T_206 : SInt, clock @[Winograd.scala 99:21]
    _T_206 <= out4[0] @[Winograd.scala 99:21]
    out4[1] <= _T_206 @[Winograd.scala 99:12]
    reg _T_208 : SInt, clock @[Winograd.scala 96:21]
    _T_208 <= out1[1] @[Winograd.scala 96:21]
    out1[2] <= _T_208 @[Winograd.scala 96:12]
    reg _T_210 : SInt, clock @[Winograd.scala 97:21]
    _T_210 <= out2[1] @[Winograd.scala 97:21]
    out2[2] <= _T_210 @[Winograd.scala 97:12]
    reg _T_212 : SInt, clock @[Winograd.scala 98:21]
    _T_212 <= out3[1] @[Winograd.scala 98:21]
    out3[2] <= _T_212 @[Winograd.scala 98:12]
    reg _T_214 : SInt, clock @[Winograd.scala 99:21]
    _T_214 <= out4[1] @[Winograd.scala 99:21]
    out4[2] <= _T_214 @[Winograd.scala 99:12]
    reg _T_216 : SInt, clock @[Winograd.scala 96:21]
    _T_216 <= out1[2] @[Winograd.scala 96:21]
    out1[3] <= _T_216 @[Winograd.scala 96:12]
    reg _T_218 : SInt, clock @[Winograd.scala 97:21]
    _T_218 <= out2[2] @[Winograd.scala 97:21]
    out2[3] <= _T_218 @[Winograd.scala 97:12]
    reg _T_220 : SInt, clock @[Winograd.scala 98:21]
    _T_220 <= out3[2] @[Winograd.scala 98:21]
    out3[3] <= _T_220 @[Winograd.scala 98:12]
    reg _T_222 : SInt, clock @[Winograd.scala 99:21]
    _T_222 <= out4[2] @[Winograd.scala 99:21]
    out4[3] <= _T_222 @[Winograd.scala 99:12]
    node _T_224 = eq(value, UInt<1>("h00")) @[Winograd.scala 102:11]
    when _T_224 : @[Winograd.scala 102:19]
      io.dOut[0] <= out1[0] @[Winograd.scala 103:16]
      io.dOut[1] <= out1[1] @[Winograd.scala 104:16]
      io.dOut[2] <= out1[2] @[Winograd.scala 105:16]
      io.dOut[3] <= out1[3] @[Winograd.scala 106:16]
      skip @[Winograd.scala 102:19]
    else : @[Winograd.scala 107:25]
      node _T_226 = eq(value, UInt<1>("h01")) @[Winograd.scala 107:17]
      when _T_226 : @[Winograd.scala 107:25]
        io.dOut[0] <= out2[0] @[Winograd.scala 108:16]
        io.dOut[1] <= out2[1] @[Winograd.scala 109:16]
        io.dOut[2] <= out2[2] @[Winograd.scala 110:16]
        io.dOut[3] <= out2[3] @[Winograd.scala 111:16]
        skip @[Winograd.scala 107:25]
      else : @[Winograd.scala 113:24]
        node _T_228 = eq(value, UInt<2>("h02")) @[Winograd.scala 113:17]
        when _T_228 : @[Winograd.scala 113:24]
          io.dOut[0] <= out3[0] @[Winograd.scala 114:16]
          io.dOut[1] <= out3[1] @[Winograd.scala 115:16]
          io.dOut[2] <= out3[2] @[Winograd.scala 116:16]
          io.dOut[3] <= out3[3] @[Winograd.scala 117:16]
          skip @[Winograd.scala 113:24]
        else : @[Winograd.scala 118:24]
          node _T_230 = eq(value, UInt<2>("h03")) @[Winograd.scala 118:17]
          when _T_230 : @[Winograd.scala 118:24]
            io.dOut[0] <= out4[0] @[Winograd.scala 119:16]
            io.dOut[1] <= out4[1] @[Winograd.scala 120:16]
            io.dOut[2] <= out4[2] @[Winograd.scala 121:16]
            io.dOut[3] <= out4[3] @[Winograd.scala 122:16]
            skip @[Winograd.scala 118:24]
          else : @[Winograd.scala 123:14]
            io.dOut[0] <= asSInt(UInt<1>("h00")) @[Winograd.scala 124:16]
            io.dOut[1] <= asSInt(UInt<1>("h00")) @[Winograd.scala 125:15]
            io.dOut[2] <= asSInt(UInt<1>("h00")) @[Winograd.scala 126:15]
            io.dOut[3] <= asSInt(UInt<1>("h00")) @[Winograd.scala 127:15]
            skip @[Winograd.scala 123:14]
    reg _T_237 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_237 <= io.mac_in_valid @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_239 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_239 <= _T_237 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_241 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_241 <= _T_239 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_243 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_243 <= _T_241 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.out_valid <= _T_243 @[Winograd.scala 129:15]
    
  extmodule Mul_8in_16out : 
    input CLK : Clock
    output P : SInt<20>
    input B : SInt<10>
    input A : SInt<10>
    
    defname = Mul_8in_16out
    
    
  extmodule Mul_8in_16out_1 : 
    input CLK : Clock
    output P : SInt<20>
    input B : SInt<10>
    input A : SInt<10>
    
    defname = Mul_8in_16out
    
    
  extmodule Mul_8in_16out_2 : 
    input CLK : Clock
    output P : SInt<20>
    input B : SInt<10>
    input A : SInt<10>
    
    defname = Mul_8in_16out
    
    
  extmodule Mul_8in_16out_3 : 
    input CLK : Clock
    output P : SInt<20>
    input B : SInt<10>
    input A : SInt<10>
    
    defname = Mul_8in_16out
    
    
  module MUL : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip dIn_B : SInt<10>[4], flip dIn_G : SInt<10>[4], dOut : SInt<20>[4]}
    
    inst Mul_8in_16out of Mul_8in_16out @[Winograd.scala 282:22]
    Mul_8in_16out.CLK is invalid
    Mul_8in_16out.P is invalid
    Mul_8in_16out.B is invalid
    Mul_8in_16out.A is invalid
    Mul_8in_16out.A <= io.dIn_B[0] @[Winograd.scala 283:15]
    Mul_8in_16out.B <= io.dIn_G[0] @[Winograd.scala 284:15]
    Mul_8in_16out.CLK <= clock @[Winograd.scala 285:16]
    io.dOut[0] <= Mul_8in_16out.P @[Winograd.scala 306:15]
    inst Mul_8in_16out_1 of Mul_8in_16out_1 @[Winograd.scala 282:22]
    Mul_8in_16out_1.CLK is invalid
    Mul_8in_16out_1.P is invalid
    Mul_8in_16out_1.B is invalid
    Mul_8in_16out_1.A is invalid
    Mul_8in_16out_1.A <= io.dIn_B[1] @[Winograd.scala 283:15]
    Mul_8in_16out_1.B <= io.dIn_G[1] @[Winograd.scala 284:15]
    Mul_8in_16out_1.CLK <= clock @[Winograd.scala 285:16]
    io.dOut[1] <= Mul_8in_16out_1.P @[Winograd.scala 306:15]
    inst Mul_8in_16out_2 of Mul_8in_16out_2 @[Winograd.scala 282:22]
    Mul_8in_16out_2.CLK is invalid
    Mul_8in_16out_2.P is invalid
    Mul_8in_16out_2.B is invalid
    Mul_8in_16out_2.A is invalid
    Mul_8in_16out_2.A <= io.dIn_B[2] @[Winograd.scala 283:15]
    Mul_8in_16out_2.B <= io.dIn_G[2] @[Winograd.scala 284:15]
    Mul_8in_16out_2.CLK <= clock @[Winograd.scala 285:16]
    io.dOut[2] <= Mul_8in_16out_2.P @[Winograd.scala 306:15]
    inst Mul_8in_16out_3 of Mul_8in_16out_3 @[Winograd.scala 282:22]
    Mul_8in_16out_3.CLK is invalid
    Mul_8in_16out_3.P is invalid
    Mul_8in_16out_3.B is invalid
    Mul_8in_16out_3.A is invalid
    Mul_8in_16out_3.A <= io.dIn_B[3] @[Winograd.scala 283:15]
    Mul_8in_16out_3.B <= io.dIn_G[3] @[Winograd.scala 284:15]
    Mul_8in_16out_3.CLK <= clock @[Winograd.scala 285:16]
    io.dOut[3] <= Mul_8in_16out_3.P @[Winograd.scala 306:15]
    
  module MUL_module : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip mac_in_valid : UInt<1>, flip dIn_B : SInt<10>[4], flip dIn_G : SInt<10>[4], dOut : SInt<20>[4], out_valid : UInt<1>}
    
    inst m_MUL of MUL @[Winograd.scala 320:19]
    m_MUL.clock <= clock
    m_MUL.reset <= reset
    m_MUL.io.dIn_G[0] <= io.dIn_G[0] @[Winograd.scala 324:22]
    m_MUL.io.dIn_B[0] <= io.dIn_B[0] @[Winograd.scala 325:22]
    reg _T_65 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_65 <= m_MUL.io.dOut[0] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_67 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_67 <= _T_65 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_69 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_69 <= _T_67 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[0] <= _T_69 @[Winograd.scala 326:15]
    m_MUL.io.dIn_G[1] <= io.dIn_G[1] @[Winograd.scala 324:22]
    m_MUL.io.dIn_B[1] <= io.dIn_B[1] @[Winograd.scala 325:22]
    reg _T_72 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_72 <= m_MUL.io.dOut[1] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_74 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_74 <= _T_72 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_76 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_76 <= _T_74 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[1] <= _T_76 @[Winograd.scala 326:15]
    m_MUL.io.dIn_G[2] <= io.dIn_G[2] @[Winograd.scala 324:22]
    m_MUL.io.dIn_B[2] <= io.dIn_B[2] @[Winograd.scala 325:22]
    reg _T_79 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_79 <= m_MUL.io.dOut[2] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_81 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_81 <= _T_79 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_83 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_83 <= _T_81 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[2] <= _T_83 @[Winograd.scala 326:15]
    m_MUL.io.dIn_G[3] <= io.dIn_G[3] @[Winograd.scala 324:22]
    m_MUL.io.dIn_B[3] <= io.dIn_B[3] @[Winograd.scala 325:22]
    reg _T_86 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_86 <= m_MUL.io.dOut[3] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_88 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_88 <= _T_86 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_90 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_90 <= _T_88 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[3] <= _T_90 @[Winograd.scala 326:15]
    reg _T_93 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_93 <= io.mac_in_valid @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_95 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_95 <= _T_93 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_97 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_97 <= _T_95 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_99 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_99 <= _T_97 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.out_valid <= _T_99 @[Winograd.scala 386:15]
    
  extmodule Add_20in_21out : 
    input CLK : Clock
    output S : SInt<21>
    input B : SInt<20>
    input A : SInt<20>
    
    defname = Add_20in_21out
    
    
  extmodule Add_20in_21out_1 : 
    input CLK : Clock
    output S : SInt<21>
    input B : SInt<20>
    input A : SInt<20>
    
    defname = Add_20in_21out
    
    
  extmodule Add_20in_21out_2 : 
    input CLK : Clock
    output S : SInt<21>
    input B : SInt<20>
    input A : SInt<20>
    
    defname = Add_20in_21out
    
    
  extmodule Add_20in_21out_3 : 
    input CLK : Clock
    output S : SInt<21>
    input B : SInt<20>
    input A : SInt<20>
    
    defname = Add_20in_21out
    
    
  module AT : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip dIn : SInt<20>[4], dOut : SInt<22>[2]}
    
    inst Add_20in_21out of Add_20in_21out @[Winograd.scala 418:22]
    Add_20in_21out.CLK is invalid
    Add_20in_21out.S is invalid
    Add_20in_21out.B is invalid
    Add_20in_21out.A is invalid
    Add_20in_21out.A <= io.dIn[1] @[Winograd.scala 419:15]
    Add_20in_21out.B <= io.dIn[2] @[Winograd.scala 420:15]
    Add_20in_21out.CLK <= clock @[Winograd.scala 421:16]
    reg _T_39 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_39 <= io.dIn[3] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    inst Add_20in_21out_1 of Add_20in_21out_1 @[Winograd.scala 418:22]
    Add_20in_21out_1.CLK is invalid
    Add_20in_21out_1.S is invalid
    Add_20in_21out_1.B is invalid
    Add_20in_21out_1.A is invalid
    Add_20in_21out_1.A <= Add_20in_21out.S @[Winograd.scala 419:15]
    Add_20in_21out_1.B <= _T_39 @[Winograd.scala 420:15]
    Add_20in_21out_1.CLK <= clock @[Winograd.scala 421:16]
    io.dOut[0] <= Add_20in_21out_1.S @[Winograd.scala 441:13]
    node _T_41 = sub(asSInt(UInt<1>("h00")), io.dIn[1]) @[Winograd.scala 442:55]
    node _T_42 = tail(_T_41, 1) @[Winograd.scala 442:55]
    node _T_43 = asSInt(_T_42) @[Winograd.scala 442:55]
    inst Add_20in_21out_2 of Add_20in_21out_2 @[Winograd.scala 418:22]
    Add_20in_21out_2.CLK is invalid
    Add_20in_21out_2.S is invalid
    Add_20in_21out_2.B is invalid
    Add_20in_21out_2.A is invalid
    Add_20in_21out_2.A <= io.dIn[2] @[Winograd.scala 419:15]
    Add_20in_21out_2.B <= _T_43 @[Winograd.scala 420:15]
    Add_20in_21out_2.CLK <= clock @[Winograd.scala 421:16]
    reg _T_46 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_46 <= io.dIn[0] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    node _T_48 = sub(asSInt(UInt<1>("h00")), _T_46) @[Winograd.scala 442:67]
    node _T_49 = tail(_T_48, 1) @[Winograd.scala 442:67]
    node _T_50 = asSInt(_T_49) @[Winograd.scala 442:67]
    inst Add_20in_21out_3 of Add_20in_21out_3 @[Winograd.scala 418:22]
    Add_20in_21out_3.CLK is invalid
    Add_20in_21out_3.S is invalid
    Add_20in_21out_3.B is invalid
    Add_20in_21out_3.A is invalid
    Add_20in_21out_3.A <= Add_20in_21out_2.S @[Winograd.scala 419:15]
    Add_20in_21out_3.B <= _T_50 @[Winograd.scala 420:15]
    Add_20in_21out_3.CLK <= clock @[Winograd.scala 421:16]
    io.dOut[1] <= Add_20in_21out_3.S @[Winograd.scala 442:13]
    
  module AT_module : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip mac_in_valid : UInt<1>, flip dIn : SInt<20>[4], dOut : SInt<22>[4], out_valid : UInt<1>}
    
    inst m_AT of AT @[Winograd.scala 454:18]
    m_AT.clock <= clock
    m_AT.reset <= reset
    m_AT.io.dIn[0] <= io.dIn[0] @[Winograd.scala 458:19]
    m_AT.io.dIn[1] <= io.dIn[1] @[Winograd.scala 458:19]
    m_AT.io.dIn[2] <= io.dIn[2] @[Winograd.scala 458:19]
    m_AT.io.dIn[3] <= io.dIn[3] @[Winograd.scala 458:19]
    reg cnt : SInt<3>, clock with : (reset => (reset, asSInt(UInt<3>("h00")))) @[Winograd.scala 466:19]
    reg cnt_EN : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Winograd.scala 467:21]
    wire _T_52 : SInt<22> @[Winograd.scala 470:14]
    node _T_53 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 470:14]
    node _T_54 = asSInt(_T_53) @[Winograd.scala 470:14]
    _T_52 <= _T_54 @[Winograd.scala 470:14]
    wire _T_58 : SInt<22> @[Winograd.scala 470:14]
    node _T_59 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 470:14]
    node _T_60 = asSInt(_T_59) @[Winograd.scala 470:14]
    _T_58 <= _T_60 @[Winograd.scala 470:14]
    wire _T_64 : SInt<22> @[Winograd.scala 470:14]
    node _T_65 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 470:14]
    node _T_66 = asSInt(_T_65) @[Winograd.scala 470:14]
    _T_64 <= _T_66 @[Winograd.scala 470:14]
    wire _T_70 : SInt<22> @[Winograd.scala 470:14]
    node _T_71 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 470:14]
    node _T_72 = asSInt(_T_71) @[Winograd.scala 470:14]
    _T_70 <= _T_72 @[Winograd.scala 470:14]
    wire out1 : SInt<22>[4] @[Winograd.scala 469:19]
    out1[0] <= _T_52 @[Winograd.scala 469:19]
    out1[1] <= _T_58 @[Winograd.scala 469:19]
    out1[2] <= _T_64 @[Winograd.scala 469:19]
    out1[3] <= _T_70 @[Winograd.scala 469:19]
    wire _T_85 : SInt<22> @[Winograd.scala 472:14]
    node _T_86 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 472:14]
    node _T_87 = asSInt(_T_86) @[Winograd.scala 472:14]
    _T_85 <= _T_87 @[Winograd.scala 472:14]
    wire _T_91 : SInt<22> @[Winograd.scala 472:14]
    node _T_92 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 472:14]
    node _T_93 = asSInt(_T_92) @[Winograd.scala 472:14]
    _T_91 <= _T_93 @[Winograd.scala 472:14]
    wire _T_97 : SInt<22> @[Winograd.scala 472:14]
    node _T_98 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 472:14]
    node _T_99 = asSInt(_T_98) @[Winograd.scala 472:14]
    _T_97 <= _T_99 @[Winograd.scala 472:14]
    wire _T_103 : SInt<22> @[Winograd.scala 472:14]
    node _T_104 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 472:14]
    node _T_105 = asSInt(_T_104) @[Winograd.scala 472:14]
    _T_103 <= _T_105 @[Winograd.scala 472:14]
    wire out2 : SInt<22>[4] @[Winograd.scala 471:19]
    out2[0] <= _T_85 @[Winograd.scala 471:19]
    out2[1] <= _T_91 @[Winograd.scala 471:19]
    out2[2] <= _T_97 @[Winograd.scala 471:19]
    out2[3] <= _T_103 @[Winograd.scala 471:19]
    wire _T_118 : SInt<22> @[Winograd.scala 474:14]
    node _T_119 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 474:14]
    node _T_120 = asSInt(_T_119) @[Winograd.scala 474:14]
    _T_118 <= _T_120 @[Winograd.scala 474:14]
    wire _T_124 : SInt<22> @[Winograd.scala 474:14]
    node _T_125 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 474:14]
    node _T_126 = asSInt(_T_125) @[Winograd.scala 474:14]
    _T_124 <= _T_126 @[Winograd.scala 474:14]
    wire _T_130 : SInt<22> @[Winograd.scala 474:14]
    node _T_131 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 474:14]
    node _T_132 = asSInt(_T_131) @[Winograd.scala 474:14]
    _T_130 <= _T_132 @[Winograd.scala 474:14]
    wire _T_136 : SInt<22> @[Winograd.scala 474:14]
    node _T_137 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 474:14]
    node _T_138 = asSInt(_T_137) @[Winograd.scala 474:14]
    _T_136 <= _T_138 @[Winograd.scala 474:14]
    wire out_temp : SInt<22>[4] @[Winograd.scala 473:23]
    out_temp[0] <= _T_118 @[Winograd.scala 473:23]
    out_temp[1] <= _T_124 @[Winograd.scala 473:23]
    out_temp[2] <= _T_130 @[Winograd.scala 473:23]
    out_temp[3] <= _T_136 @[Winograd.scala 473:23]
    reg _T_150 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_150 <= io.mac_in_valid @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_152 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_152 <= _T_150 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_154 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_154 <= _T_152 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_156 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_156 <= _T_154 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg value : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Counter.scala 26:33]
    when _T_156 : @[Counter.scala 63:17]
      node _T_160 = eq(value, UInt<2>("h03")) @[Counter.scala 34:24]
      node _T_162 = add(value, UInt<1>("h01")) @[Counter.scala 35:22]
      node _T_163 = tail(_T_162, 1) @[Counter.scala 35:22]
      value <= _T_163 @[Counter.scala 35:13]
      skip @[Counter.scala 63:17]
    node cnt_valid = and(_T_156, _T_160) @[Counter.scala 64:20]
    out1[0] <= m_AT.io.dOut[0] @[Winograd.scala 482:10]
    reg _T_166 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_166 <= m_AT.io.dOut[1] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    out2[0] <= _T_166 @[Winograd.scala 483:10]
    reg _T_168 : SInt, clock @[Winograd.scala 485:21]
    _T_168 <= out1[0] @[Winograd.scala 485:21]
    out1[1] <= _T_168 @[Winograd.scala 485:12]
    reg _T_170 : SInt, clock @[Winograd.scala 486:21]
    _T_170 <= out2[0] @[Winograd.scala 486:21]
    out2[1] <= _T_170 @[Winograd.scala 486:12]
    reg _T_172 : SInt, clock @[Winograd.scala 485:21]
    _T_172 <= out1[1] @[Winograd.scala 485:21]
    out1[2] <= _T_172 @[Winograd.scala 485:12]
    reg _T_174 : SInt, clock @[Winograd.scala 486:21]
    _T_174 <= out2[1] @[Winograd.scala 486:21]
    out2[2] <= _T_174 @[Winograd.scala 486:12]
    reg _T_176 : SInt, clock @[Winograd.scala 485:21]
    _T_176 <= out1[2] @[Winograd.scala 485:21]
    out1[3] <= _T_176 @[Winograd.scala 485:12]
    reg _T_178 : SInt, clock @[Winograd.scala 486:21]
    _T_178 <= out2[2] @[Winograd.scala 486:21]
    out2[3] <= _T_178 @[Winograd.scala 486:12]
    node _T_180 = eq(value, UInt<1>("h01")) @[Winograd.scala 489:14]
    when _T_180 : @[Winograd.scala 489:22]
      out_temp[0] <= out1[0] @[Winograd.scala 490:17]
      out_temp[1] <= out1[1] @[Winograd.scala 491:17]
      out_temp[2] <= out1[2] @[Winograd.scala 492:17]
      out_temp[3] <= out1[3] @[Winograd.scala 493:17]
      skip @[Winograd.scala 489:22]
    else : @[Winograd.scala 494:28]
      node _T_182 = eq(value, UInt<2>("h02")) @[Winograd.scala 494:20]
      when _T_182 : @[Winograd.scala 494:28]
        out_temp[0] <= out2[0] @[Winograd.scala 495:17]
        out_temp[1] <= out2[1] @[Winograd.scala 496:17]
        out_temp[2] <= out2[2] @[Winograd.scala 497:17]
        out_temp[3] <= out2[3] @[Winograd.scala 498:17]
        skip @[Winograd.scala 494:28]
      else : @[Winograd.scala 499:14]
        out_temp[0] <= asSInt(UInt<1>("h00")) @[Winograd.scala 500:17]
        out_temp[1] <= asSInt(UInt<1>("h00")) @[Winograd.scala 501:16]
        out_temp[2] <= asSInt(UInt<1>("h00")) @[Winograd.scala 502:17]
        out_temp[3] <= asSInt(UInt<1>("h00")) @[Winograd.scala 503:17]
        skip @[Winograd.scala 499:14]
    reg _T_189 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_189 <= out_temp[0] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_191 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_191 <= _T_189 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_193 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_193 <= _T_191 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[0] <= _T_193 @[Winograd.scala 506:15]
    reg _T_196 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_196 <= out_temp[1] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_198 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_198 <= _T_196 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_200 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_200 <= _T_198 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[1] <= _T_200 @[Winograd.scala 506:15]
    reg _T_203 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_203 <= out_temp[2] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_205 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_205 <= _T_203 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_207 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_207 <= _T_205 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[2] <= _T_207 @[Winograd.scala 506:15]
    reg _T_210 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_210 <= out_temp[3] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_212 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_212 <= _T_210 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_214 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_214 <= _T_212 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[3] <= _T_214 @[Winograd.scala 506:15]
    reg _T_217 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_217 <= io.mac_in_valid @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_219 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_219 <= _T_217 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_221 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_221 <= _T_219 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_223 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_223 <= _T_221 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_225 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_225 <= _T_223 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_227 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_227 <= _T_225 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_229 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_229 <= _T_227 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_231 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_231 <= _T_229 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.out_valid <= _T_231 @[Winograd.scala 510:15]
    
  extmodule Add_20in_21out_4 : 
    input CLK : Clock
    output S : SInt<21>
    input B : SInt<20>
    input A : SInt<20>
    
    defname = Add_20in_21out
    
    
  extmodule Add_20in_21out_5 : 
    input CLK : Clock
    output S : SInt<21>
    input B : SInt<20>
    input A : SInt<20>
    
    defname = Add_20in_21out
    
    
  extmodule Add_20in_21out_6 : 
    input CLK : Clock
    output S : SInt<21>
    input B : SInt<20>
    input A : SInt<20>
    
    defname = Add_20in_21out
    
    
  extmodule Add_20in_21out_7 : 
    input CLK : Clock
    output S : SInt<21>
    input B : SInt<20>
    input A : SInt<20>
    
    defname = Add_20in_21out
    
    
  module AT_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip dIn : SInt<20>[4], dOut : SInt<22>[2]}
    
    inst Add_20in_21out of Add_20in_21out_4 @[Winograd.scala 418:22]
    Add_20in_21out.CLK is invalid
    Add_20in_21out.S is invalid
    Add_20in_21out.B is invalid
    Add_20in_21out.A is invalid
    Add_20in_21out.A <= io.dIn[1] @[Winograd.scala 419:15]
    Add_20in_21out.B <= io.dIn[2] @[Winograd.scala 420:15]
    Add_20in_21out.CLK <= clock @[Winograd.scala 421:16]
    reg _T_39 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_39 <= io.dIn[3] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    inst Add_20in_21out_1 of Add_20in_21out_5 @[Winograd.scala 418:22]
    Add_20in_21out_1.CLK is invalid
    Add_20in_21out_1.S is invalid
    Add_20in_21out_1.B is invalid
    Add_20in_21out_1.A is invalid
    Add_20in_21out_1.A <= Add_20in_21out.S @[Winograd.scala 419:15]
    Add_20in_21out_1.B <= _T_39 @[Winograd.scala 420:15]
    Add_20in_21out_1.CLK <= clock @[Winograd.scala 421:16]
    io.dOut[0] <= Add_20in_21out_1.S @[Winograd.scala 441:13]
    node _T_41 = sub(asSInt(UInt<1>("h00")), io.dIn[1]) @[Winograd.scala 442:55]
    node _T_42 = tail(_T_41, 1) @[Winograd.scala 442:55]
    node _T_43 = asSInt(_T_42) @[Winograd.scala 442:55]
    inst Add_20in_21out_2 of Add_20in_21out_6 @[Winograd.scala 418:22]
    Add_20in_21out_2.CLK is invalid
    Add_20in_21out_2.S is invalid
    Add_20in_21out_2.B is invalid
    Add_20in_21out_2.A is invalid
    Add_20in_21out_2.A <= io.dIn[2] @[Winograd.scala 419:15]
    Add_20in_21out_2.B <= _T_43 @[Winograd.scala 420:15]
    Add_20in_21out_2.CLK <= clock @[Winograd.scala 421:16]
    reg _T_46 : SInt<20>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_46 <= io.dIn[0] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    node _T_48 = sub(asSInt(UInt<1>("h00")), _T_46) @[Winograd.scala 442:67]
    node _T_49 = tail(_T_48, 1) @[Winograd.scala 442:67]
    node _T_50 = asSInt(_T_49) @[Winograd.scala 442:67]
    inst Add_20in_21out_3 of Add_20in_21out_7 @[Winograd.scala 418:22]
    Add_20in_21out_3.CLK is invalid
    Add_20in_21out_3.S is invalid
    Add_20in_21out_3.B is invalid
    Add_20in_21out_3.A is invalid
    Add_20in_21out_3.A <= Add_20in_21out_2.S @[Winograd.scala 419:15]
    Add_20in_21out_3.B <= _T_50 @[Winograd.scala 420:15]
    Add_20in_21out_3.CLK <= clock @[Winograd.scala 421:16]
    io.dOut[1] <= Add_20in_21out_3.S @[Winograd.scala 442:13]
    
  module AT_module_1 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip mac_in_valid : UInt<1>, flip dIn : SInt<20>[4], dOut : SInt<22>[4], out_valid : UInt<1>}
    
    inst m_AT of AT_1 @[Winograd.scala 454:18]
    m_AT.clock <= clock
    m_AT.reset <= reset
    m_AT.io.dIn[0] <= io.dIn[0] @[Winograd.scala 458:19]
    m_AT.io.dIn[1] <= io.dIn[1] @[Winograd.scala 458:19]
    m_AT.io.dIn[2] <= io.dIn[2] @[Winograd.scala 458:19]
    m_AT.io.dIn[3] <= io.dIn[3] @[Winograd.scala 458:19]
    reg cnt : SInt<3>, clock with : (reset => (reset, asSInt(UInt<3>("h00")))) @[Winograd.scala 466:19]
    reg cnt_EN : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[Winograd.scala 467:21]
    wire _T_52 : SInt<22> @[Winograd.scala 470:14]
    node _T_53 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 470:14]
    node _T_54 = asSInt(_T_53) @[Winograd.scala 470:14]
    _T_52 <= _T_54 @[Winograd.scala 470:14]
    wire _T_58 : SInt<22> @[Winograd.scala 470:14]
    node _T_59 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 470:14]
    node _T_60 = asSInt(_T_59) @[Winograd.scala 470:14]
    _T_58 <= _T_60 @[Winograd.scala 470:14]
    wire _T_64 : SInt<22> @[Winograd.scala 470:14]
    node _T_65 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 470:14]
    node _T_66 = asSInt(_T_65) @[Winograd.scala 470:14]
    _T_64 <= _T_66 @[Winograd.scala 470:14]
    wire _T_70 : SInt<22> @[Winograd.scala 470:14]
    node _T_71 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 470:14]
    node _T_72 = asSInt(_T_71) @[Winograd.scala 470:14]
    _T_70 <= _T_72 @[Winograd.scala 470:14]
    wire out1 : SInt<22>[4] @[Winograd.scala 469:19]
    out1[0] <= _T_52 @[Winograd.scala 469:19]
    out1[1] <= _T_58 @[Winograd.scala 469:19]
    out1[2] <= _T_64 @[Winograd.scala 469:19]
    out1[3] <= _T_70 @[Winograd.scala 469:19]
    wire _T_85 : SInt<22> @[Winograd.scala 472:14]
    node _T_86 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 472:14]
    node _T_87 = asSInt(_T_86) @[Winograd.scala 472:14]
    _T_85 <= _T_87 @[Winograd.scala 472:14]
    wire _T_91 : SInt<22> @[Winograd.scala 472:14]
    node _T_92 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 472:14]
    node _T_93 = asSInt(_T_92) @[Winograd.scala 472:14]
    _T_91 <= _T_93 @[Winograd.scala 472:14]
    wire _T_97 : SInt<22> @[Winograd.scala 472:14]
    node _T_98 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 472:14]
    node _T_99 = asSInt(_T_98) @[Winograd.scala 472:14]
    _T_97 <= _T_99 @[Winograd.scala 472:14]
    wire _T_103 : SInt<22> @[Winograd.scala 472:14]
    node _T_104 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 472:14]
    node _T_105 = asSInt(_T_104) @[Winograd.scala 472:14]
    _T_103 <= _T_105 @[Winograd.scala 472:14]
    wire out2 : SInt<22>[4] @[Winograd.scala 471:19]
    out2[0] <= _T_85 @[Winograd.scala 471:19]
    out2[1] <= _T_91 @[Winograd.scala 471:19]
    out2[2] <= _T_97 @[Winograd.scala 471:19]
    out2[3] <= _T_103 @[Winograd.scala 471:19]
    wire _T_118 : SInt<22> @[Winograd.scala 474:14]
    node _T_119 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 474:14]
    node _T_120 = asSInt(_T_119) @[Winograd.scala 474:14]
    _T_118 <= _T_120 @[Winograd.scala 474:14]
    wire _T_124 : SInt<22> @[Winograd.scala 474:14]
    node _T_125 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 474:14]
    node _T_126 = asSInt(_T_125) @[Winograd.scala 474:14]
    _T_124 <= _T_126 @[Winograd.scala 474:14]
    wire _T_130 : SInt<22> @[Winograd.scala 474:14]
    node _T_131 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 474:14]
    node _T_132 = asSInt(_T_131) @[Winograd.scala 474:14]
    _T_130 <= _T_132 @[Winograd.scala 474:14]
    wire _T_136 : SInt<22> @[Winograd.scala 474:14]
    node _T_137 = asUInt(asSInt(UInt<22>("h00"))) @[Winograd.scala 474:14]
    node _T_138 = asSInt(_T_137) @[Winograd.scala 474:14]
    _T_136 <= _T_138 @[Winograd.scala 474:14]
    wire out_temp : SInt<22>[4] @[Winograd.scala 473:23]
    out_temp[0] <= _T_118 @[Winograd.scala 473:23]
    out_temp[1] <= _T_124 @[Winograd.scala 473:23]
    out_temp[2] <= _T_130 @[Winograd.scala 473:23]
    out_temp[3] <= _T_136 @[Winograd.scala 473:23]
    reg _T_150 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_150 <= io.mac_in_valid @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_152 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_152 <= _T_150 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_154 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_154 <= _T_152 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_156 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_156 <= _T_154 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg value : UInt<2>, clock with : (reset => (reset, UInt<2>("h00"))) @[Counter.scala 26:33]
    when _T_156 : @[Counter.scala 63:17]
      node _T_160 = eq(value, UInt<2>("h03")) @[Counter.scala 34:24]
      node _T_162 = add(value, UInt<1>("h01")) @[Counter.scala 35:22]
      node _T_163 = tail(_T_162, 1) @[Counter.scala 35:22]
      value <= _T_163 @[Counter.scala 35:13]
      skip @[Counter.scala 63:17]
    node cnt_valid = and(_T_156, _T_160) @[Counter.scala 64:20]
    out1[0] <= m_AT.io.dOut[0] @[Winograd.scala 482:10]
    reg _T_166 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_166 <= m_AT.io.dOut[1] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    out2[0] <= _T_166 @[Winograd.scala 483:10]
    reg _T_168 : SInt, clock @[Winograd.scala 485:21]
    _T_168 <= out1[0] @[Winograd.scala 485:21]
    out1[1] <= _T_168 @[Winograd.scala 485:12]
    reg _T_170 : SInt, clock @[Winograd.scala 486:21]
    _T_170 <= out2[0] @[Winograd.scala 486:21]
    out2[1] <= _T_170 @[Winograd.scala 486:12]
    reg _T_172 : SInt, clock @[Winograd.scala 485:21]
    _T_172 <= out1[1] @[Winograd.scala 485:21]
    out1[2] <= _T_172 @[Winograd.scala 485:12]
    reg _T_174 : SInt, clock @[Winograd.scala 486:21]
    _T_174 <= out2[1] @[Winograd.scala 486:21]
    out2[2] <= _T_174 @[Winograd.scala 486:12]
    reg _T_176 : SInt, clock @[Winograd.scala 485:21]
    _T_176 <= out1[2] @[Winograd.scala 485:21]
    out1[3] <= _T_176 @[Winograd.scala 485:12]
    reg _T_178 : SInt, clock @[Winograd.scala 486:21]
    _T_178 <= out2[2] @[Winograd.scala 486:21]
    out2[3] <= _T_178 @[Winograd.scala 486:12]
    node _T_180 = eq(value, UInt<1>("h01")) @[Winograd.scala 489:14]
    when _T_180 : @[Winograd.scala 489:22]
      out_temp[0] <= out1[0] @[Winograd.scala 490:17]
      out_temp[1] <= out1[1] @[Winograd.scala 491:17]
      out_temp[2] <= out1[2] @[Winograd.scala 492:17]
      out_temp[3] <= out1[3] @[Winograd.scala 493:17]
      skip @[Winograd.scala 489:22]
    else : @[Winograd.scala 494:28]
      node _T_182 = eq(value, UInt<2>("h02")) @[Winograd.scala 494:20]
      when _T_182 : @[Winograd.scala 494:28]
        out_temp[0] <= out2[0] @[Winograd.scala 495:17]
        out_temp[1] <= out2[1] @[Winograd.scala 496:17]
        out_temp[2] <= out2[2] @[Winograd.scala 497:17]
        out_temp[3] <= out2[3] @[Winograd.scala 498:17]
        skip @[Winograd.scala 494:28]
      else : @[Winograd.scala 499:14]
        out_temp[0] <= asSInt(UInt<1>("h00")) @[Winograd.scala 500:17]
        out_temp[1] <= asSInt(UInt<1>("h00")) @[Winograd.scala 501:16]
        out_temp[2] <= asSInt(UInt<1>("h00")) @[Winograd.scala 502:17]
        out_temp[3] <= asSInt(UInt<1>("h00")) @[Winograd.scala 503:17]
        skip @[Winograd.scala 499:14]
    reg _T_189 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_189 <= out_temp[0] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_191 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_191 <= _T_189 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_193 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_193 <= _T_191 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[0] <= _T_193 @[Winograd.scala 506:15]
    reg _T_196 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_196 <= out_temp[1] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_198 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_198 <= _T_196 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_200 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_200 <= _T_198 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[1] <= _T_200 @[Winograd.scala 506:15]
    reg _T_203 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_203 <= out_temp[2] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_205 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_205 <= _T_203 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_207 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_207 <= _T_205 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[2] <= _T_207 @[Winograd.scala 506:15]
    reg _T_210 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_210 <= out_temp[3] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_212 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_212 <= _T_210 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_214 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_214 <= _T_212 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.dOut[3] <= _T_214 @[Winograd.scala 506:15]
    reg _T_217 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_217 <= io.mac_in_valid @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_219 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_219 <= _T_217 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_221 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_221 <= _T_219 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_223 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_223 <= _T_221 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_225 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_225 <= _T_223 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_227 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_227 <= _T_225 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_229 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_229 <= _T_227 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    reg _T_231 : UInt<1>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_231 <= _T_229 @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    io.out_valid <= _T_231 @[Winograd.scala 510:15]
    
  module Winograd : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip mac_in_valid : UInt<1>, flip dIn : SInt<8>[4], flip dIn_G : SInt<10>[4], dOut : SInt<22>, out_valid : UInt<1>}
    
    reg out : SInt<22>, clock with : (reset => (reset, asSInt(UInt<22>("h00")))) @[Winograd.scala 549:18]
    inst BT_module of BT_module @[Winograd.scala 258:22]
    BT_module.clock <= clock
    BT_module.reset <= reset
    BT_module.io.mac_in_valid <= io.mac_in_valid @[Winograd.scala 259:25]
    BT_module.io.dIn[0] <= io.dIn[0] @[Winograd.scala 261:22]
    BT_module.io.dIn[1] <= io.dIn[1] @[Winograd.scala 261:22]
    BT_module.io.dIn[2] <= io.dIn[2] @[Winograd.scala 261:22]
    BT_module.io.dIn[3] <= io.dIn[3] @[Winograd.scala 261:22]
    inst B_module of B_module @[Winograd.scala 134:22]
    B_module.clock <= clock
    B_module.reset <= reset
    B_module.io.mac_in_valid <= BT_module.io.out_valid @[Winograd.scala 135:25]
    B_module.io.dIn[0] <= BT_module.io.dOut[0] @[Winograd.scala 137:22]
    B_module.io.dIn[1] <= BT_module.io.dOut[1] @[Winograd.scala 137:22]
    B_module.io.dIn[2] <= BT_module.io.dOut[2] @[Winograd.scala 137:22]
    B_module.io.dIn[3] <= BT_module.io.dOut[3] @[Winograd.scala 137:22]
    inst MUL_module of MUL_module @[Winograd.scala 391:22]
    MUL_module.clock <= clock
    MUL_module.reset <= reset
    MUL_module.io.mac_in_valid <= B_module.io.out_valid @[Winograd.scala 392:25]
    MUL_module.io.dIn_B[0] <= B_module.io.dOut[0] @[Winograd.scala 394:24]
    MUL_module.io.dIn_G[0] <= io.dIn_G[0] @[Winograd.scala 395:24]
    MUL_module.io.dIn_B[1] <= B_module.io.dOut[1] @[Winograd.scala 394:24]
    MUL_module.io.dIn_G[1] <= io.dIn_G[1] @[Winograd.scala 395:24]
    MUL_module.io.dIn_B[2] <= B_module.io.dOut[2] @[Winograd.scala 394:24]
    MUL_module.io.dIn_G[2] <= io.dIn_G[2] @[Winograd.scala 395:24]
    MUL_module.io.dIn_B[3] <= B_module.io.dOut[3] @[Winograd.scala 394:24]
    MUL_module.io.dIn_G[3] <= io.dIn_G[3] @[Winograd.scala 395:24]
    inst AT_module of AT_module @[Winograd.scala 515:22]
    AT_module.clock <= clock
    AT_module.reset <= reset
    AT_module.io.mac_in_valid <= MUL_module.io.out_valid @[Winograd.scala 516:25]
    AT_module.io.dIn[0] <= MUL_module.io.dOut[0] @[Winograd.scala 518:22]
    AT_module.io.dIn[1] <= MUL_module.io.dOut[1] @[Winograd.scala 518:22]
    AT_module.io.dIn[2] <= MUL_module.io.dOut[2] @[Winograd.scala 518:22]
    AT_module.io.dIn[3] <= MUL_module.io.dOut[3] @[Winograd.scala 518:22]
    inst AT_module_1 of AT_module_1 @[Winograd.scala 515:22]
    AT_module_1.clock <= clock
    AT_module_1.reset <= reset
    AT_module_1.io.mac_in_valid <= AT_module.io.out_valid @[Winograd.scala 516:25]
    AT_module_1.io.dIn[0] <= AT_module.io.dOut[0] @[Winograd.scala 518:22]
    AT_module_1.io.dIn[1] <= AT_module.io.dOut[1] @[Winograd.scala 518:22]
    AT_module_1.io.dIn[2] <= AT_module.io.dOut[2] @[Winograd.scala 518:22]
    AT_module_1.io.dIn[3] <= AT_module.io.dOut[3] @[Winograd.scala 518:22]
    io.out_valid <= AT_module_1.io.out_valid @[Winograd.scala 560:15]
    reg _T_51 : SInt<22>, clock @[Reg.scala 11:16]
    when UInt<1>("h01") : @[Reg.scala 12:19]
      _T_51 <= AT_module_1.io.dOut[2] @[Reg.scala 12:23]
      skip @[Reg.scala 12:19]
    out <= _T_51 @[Winograd.scala 561:6]
    node _T_53 = eq(AT_module_1.io.dOut[3], asSInt(UInt<1>("h00"))) @[Winograd.scala 562:29]
    node _T_54 = mux(_T_53, out, AT_module_1.io.dOut[3]) @[Winograd.scala 562:15]
    io.dOut <= _T_54 @[Winograd.scala 562:10]
    
