import chisel3._
import chisel3.util._

class SinglePortRAM extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(10.W))
    val dataIn = Input(UInt(32.W))
    val en = Input(Bool())
    val we = Input(Bool())
    val dataOut = Output(UInt(32.W))
  })
  val syncRAM = SyncReadMem(1024, UInt(32.W))
  when(io.en) {
    when(io.we) {
      syncRAM.write(io.addr, io.dataIn)
      io.dataOut := DontCare
    } .otherwise {
      io.dataOut := syncRAM.read(io.addr)
    }
  } .otherwise {
    io.dataOut := DontCare
  }
}

trait Config {
  val IN_HIGHT=360//12*16
  val IN_WIDTH=640////16
  val PADDING=2//左右各一个
  val IN_BIT_WIDTH=8
  val OUT_BIT_WIDTH=8
  val ADDR_WIDTH=10
  val RAM_NUM=2
  val RAM_GRP=3
  val OUT_NUM=4
  val LATANCY=4*IN_WIDTH

  val BT_WIDTH=8
  val BT_WIDTH_1=8
  val B_WIDTH=9
  val MUL_WIDTH=10
  val CONW=8
  val MAC_WIDTH=4
  val KERNEL_SIZE=MAC_WIDTH*MAC_WIDTH

  /////////////long_2_short
  val DIN_W=26
  val DOUT_W=8
  val DIN_DECIMAL=14
  val DOUT_DECIMAL=7
}



class Transfer_IO extends Bundle with Config {
  val clock=Input(Clock())
  val reset=Input(Bool())
  val io_dIn=Input(SInt(IN_BIT_WIDTH.W))
  val io_dIn_addr=Input(SInt(ADDR_WIDTH.W))
  val io_input_valid=Input(Bool())//输入有效，低电平则为无效
  //val row_finish=Input(Bool())//行结束信号，意味着需要切换RAM,在知道图片大小的情况下，可以忽略这一层
  val io_RAM_OUT_0=Output(SInt(OUT_BIT_WIDTH.W))
  val io_RAM_OUT_1=Output(SInt(OUT_BIT_WIDTH.W))
  val io_RAM_OUT_2=Output(SInt(OUT_BIT_WIDTH.W))
  val io_RAM_OUT_3=Output(SInt(OUT_BIT_WIDTH.W))
  val io_RAM_OUT_4=Output(SInt(OUT_BIT_WIDTH.W))
  val io_RAM_OUT_5=Output(SInt(OUT_BIT_WIDTH.W))
  val io_out_valid=Output(Bool())


  //val io_out_temp=Output(Vec(OUT_NUM,SInt(OUT_BIT_WIDTH.W)))
  //val io_RAM_OUT=Output(Vec(OUT_NUM+2,SInt(OUT_BIT_WIDTH.W)))
}

class Transfer extends BlackBox with Config {
  val io = IO(new Transfer_IO)
}

class data_gen_IO extends Bundle with Config{
  val input_valid=Input(Bool())
  val dOut=Output(SInt(IN_BIT_WIDTH.W))
  val dOut_addr=Output(SInt(ADDR_WIDTH.W))
  val dOut_valid=Output(Bool())
}

class data_gen(IN_HIGHT:Int,IN_WIDTH:Int) extends Module with Config {
  val io=IO(new data_gen_IO)
  val temp=RegInit(0.S(IN_BIT_WIDTH.W))

  //val random_data= for(i <-0 until (IN_HIGHT*IN_WIDTH)) yield (random*i).round.toInt

  val (cnt,cnt_valid)=Counter(io.input_valid,(IN_HIGHT*IN_WIDTH))//a 代表计数，b代表计数完成信号
  val (cnt_end,cnt_end_valid)=Conter_pause(io.input_valid,2.U,cnt_valid)//a 代表计数，b代表计数完成信号


  when(cnt_end===0.U){
    io.dOut_valid:=true.B//ShiftRegister(io.input_valid,1)//TODO:the end of picture transfer needs a signal to symbolize different pictures
    io.dOut_addr:=cnt.asSInt()
  }.otherwise{
    io.dOut_valid:=false.B
    io.dOut_addr:=0.S(ADDR_WIDTH.W)
  }

  when(io.dOut_valid){
    for(i <- 0 until (IN_HIGHT*IN_WIDTH)){
      //temp:=random.toInt.U
      temp:=scala.util.Random.nextInt(127).S
     // temp:=(cnt%128.S).asSInt()//(cnt.asSInt*100.S)%(128.S)+1.S
    }
  }.otherwise{
    temp:=0.S(IN_BIT_WIDTH.W)
  }
  io.dOut:=temp
}


class Padding extends Module with Config{
  val io=IO(new Bundle{
    val dIn=Input(SInt(IN_BIT_WIDTH.W))
    val in_valid=Input(Bool())
    val dOut=Output(SInt(IN_BIT_WIDTH.W))
    val out_vaild=Output(Bool())
  })



  //定义一个循环移位的模块
  val LENGTH=2*IN_HIGHT+2*IN_WIDTH+4
  //val Buffer=VecInit(Seq.fill(LENGTH)(0.S(IN_BIT_WIDTH.W)))
  val Buffer=Reg(Vec(LENGTH,SInt(IN_BIT_WIDTH.W)))





  //定义一个存储空间，这个空间至少要达到图片的一个宽度大小，

  val (cnt,cnt_valid)=Counter(RegNext(io.in_valid),IN_WIDTH)
  val (cnt_col,cnt_col_valid)=Conter_pause(RegNext(io.in_valid),(IN_HIGHT+2).U,cnt_valid)
  for(i <- 0 until LENGTH){
    Buffer(i):=0.S
  }



  when(ShiftRegister(io.in_valid,1)){
    for(i<- 1 until LENGTH){
      Buffer(i):=Buffer(i-1)
    }
  }




  val (cnt_out,cnt_out_valid)=Counter(RegNext(io.in_valid),(IN_WIDTH+2)*(IN_HIGHT+2))
  val (cnt_end,cnt_end_valid)=Conter_pause(RegNext(io.in_valid),3.U,cnt_out_valid)

  when(RegNext(io.in_valid)&&cnt_end===0.U){
    io.out_vaild:=true.B
  }.otherwise{
    io.out_vaild:=false.B
  }

  val addr=RegInit(LENGTH.U-IN_WIDTH.U-3.U)
  val temp=RegInit(0.S(8.W))

//    when(io.in_valid&&cnt===0.U){
//    when(cnt_col===0.U||cnt_col===(IN_HIGHT+1).U){
//      addr:=LENGTH.U-IN_WIDTH.U-3.U
//    }.otherwise{
//      addr:=addr-2.U
//    }
//  }


  when(io.in_valid&&(cnt_col===0.U)){
    when(cnt===0.U){
      addr:=LENGTH.U-IN_WIDTH.U-3.U
    }.elsewhen(cnt===(IN_WIDTH-2).U){
      addr:=addr-2.U
    }
  }.elsewhen(io.in_valid&&(cnt_col===(IN_HIGHT-1).U)){
    when(cnt===(IN_WIDTH-1).U) {
      addr := addr - IN_WIDTH.U - 3.U
    }
  }.elsewhen(io.in_valid){
    when(cnt===(IN_WIDTH-1).U){
      addr:=addr-2.U
    }
  }


  when(cnt_col===0.U&&io.in_valid){
      temp:=Buffer(LENGTH-1)
      Buffer(addr):=io.dIn
  }.elsewhen(cnt_col=/=0.U&&io.in_valid){
      when(cnt===(IN_WIDTH-1).U){
        temp:=Buffer(LENGTH-1)
        Buffer(addr-2.U):=io.dIn
      }.otherwise{
        temp:=Buffer(LENGTH-1)
        Buffer(addr):=io.dIn
      }
  }.otherwise{
    temp:=0.S
  }

//  when(io.out_vaild&&cnt===0.U){
//        temp:=Buffer(LENGTH-1)
//        when(cnt_col===0.U){
//          Buffer(addr):=io.dIn
//        }.otherwise{
//          Buffer(addr-2.U):=io.dIn
//        }
//        when(addr===0.U){
//          addr:=0.U
//        }
//      }.otherwise{
//        temp:=Buffer(LENGTH-1)
//        Buffer(addr):=io.dIn
//      }

    io.dOut:=temp

//  when(io.out_vaild){
//    when(io.out_vaild&&cnt===0.U){
//        when(cnt_col===0.U||cnt_col===(IN_HIGHT).U){
//          addr:=addr-IN_WIDTH.U-2.U
//        }.otherwise{
//            addr:=addr-2.U
//        }
//      io.dOut:=Buffer(LENGTH-1)
//      Buffer(addr-2.U):=io.dIn
//      when(addr===0.U){
//        addr:=0.U//(LENGTH-1).U
//      }
//      //Buffer(LENGTH-1):=RegNext(Buffer(LENGTH-1))
//    }.otherwise{
//      io.dOut:=Buffer(LENGTH-1)
//      Buffer(addr):=io.dIn
//      //addr:=addr-1.U
////      when(addr===0.U){
////        addr:=(LENGTH-1).U
////      }
//    }
//  }.otherwise{
//    io.dOut:=0.U
//  }


  //一开始需要缓存一行

  //之后在固定位置加入零，新进入的元素在buffer中
  //最后达到数量之后再次输入零，每一帧图片进入实际上需要更多时间缓存



}


class G_gen extends Module with Config {
  val io=IO(new Bundle{
    val input_valid=Input(Bool())
    val dOut=Output(Vec(MAC_WIDTH,SInt(IN_BIT_WIDTH.W)))
  })
  val (cnt, cnt_valid)=Counter(io.input_valid,4)
  when(io.input_valid){
    when(cnt===0.U){
      io.dOut(3):=4.S
      io.dOut(2):=12.S
      io.dOut(1):=4.S
      io.dOut(0):=12.S
    }.elsewhen(cnt===1.U){
      io.dOut(3):=24.S
      io.dOut(2):=45.S
      io.dOut(1):=15.S
      io.dOut(0):=36.S
    }.elsewhen(cnt===2.U){
      io.dOut(3):=8.S
      io.dOut(2):=15.S
      io.dOut(1):=5.S
      io.dOut(0):=12.S
    }.elsewhen(cnt===3.U){
      io.dOut(3):=28.S
      io.dOut(2):=48.S
      io.dOut(1):=16.S
      io.dOut(0):=36.S
    }.otherwise{
      io.dOut(0):=0.S
      io.dOut(1):=0.S
      io.dOut(2):=0.S
      io.dOut(3):=0.S
    }
  }.otherwise{
    io.dOut(0):=0.S
    io.dOut(1):=0.S
    io.dOut(2):=0.S
    io.dOut(3):=0.S
  }

}

class data_trans extends Module with Config {
  val io=IO(new Bundle{
    val input_valid=Input(Bool())
    val Data_in=Input(SInt(IN_BIT_WIDTH.W))
    val output_valid=Output(Bool())
    val RAM_OUT=Output(Vec(4,SInt(OUT_BIT_WIDTH.W)))
    val result=Output(SInt((2*MUL_WIDTH+4).W))
  })


  //val data_gen=Module(new data_gen(IN_HIGHT,IN_WIDTH))//12*16
  val padding=Module(new Padding)//14*18
  val transfer=Module(new Transfer)
  val dG_in=Module(new G_gen())
  val rank_change=Module(new Rank_Change)
  val winograd=Module(new Winograd)


  //datain
  transfer.io.reset:=reset
  transfer.io.clock:=clock
  //data_gen.io.input_valid:=io.input_valid

  padding.io.in_valid:=io.input_valid//data_gen.io.dOut_valid
  padding.io.dIn:=io.Data_in

  //transfer.io.io_input_valid:=data_gen.io.dOut_valid
  //transfer.io.io_dIn:=data_gen.io.dOut


  //transfer.io.io_dIn_addr:=data_gen.io.dOut_addr

  transfer.io.io_input_valid:=padding.io.out_vaild
  transfer.io.io_dIn:=padding.io.dOut

  //reshape
  rank_change.io.input_valid:=transfer.io.io_out_valid
  rank_change.io.dIn(0):=transfer.io.io_RAM_OUT_0
  rank_change.io.dIn(1):=transfer.io.io_RAM_OUT_1
  rank_change.io.dIn(2):=transfer.io.io_RAM_OUT_2
  rank_change.io.dIn(3):=transfer.io.io_RAM_OUT_3
  rank_change.io.dIn(4):=transfer.io.io_RAM_OUT_4
  rank_change.io.dIn(5):=transfer.io.io_RAM_OUT_5

  ///////////////////winograd
  winograd.io.mac_in_valid:=ShiftRegister(transfer.io.io_out_valid,4)
  dG_in.io.input_valid:=ShiftRegister(transfer.io.io_out_valid,4+8)

  when(winograd.io.mac_in_valid){
    for(i <- 0 until(4)){
      winograd.io.dIn(i):=rank_change.io.dOut(i).asSInt()
      winograd.io.dIn_G(i):=dG_in.io.dOut(i).asSInt()
    }
  }.otherwise{
    for(i <- 0 until(4)){
      winograd.io.dIn(i):=0.S
      winograd.io.dIn_G(i):=0.S
    }
  }






  io.output_valid:=winograd.io.out_valid

  when(io.output_valid){
    io.result:=winograd.io.dOut.asSInt()
  }.otherwise{
    io.result:=0.S
  }
  io.RAM_OUT:=rank_change.io.dOut





}

object data_trans extends App{

    chisel3.Driver.emitVerilog(new data_trans())

  }


