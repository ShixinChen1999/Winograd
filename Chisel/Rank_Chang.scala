import chisel3._
import chisel3.util._



class Conter_pause extends Module{
  val io=IO(new Bundle{
    val valid=Input(Bool())
    val goal_num=Input(UInt(12.W))//可配置
    val pulse=Input(Bool())
    val cnt=Output(UInt(12.W))
    val out_valid=Output(Bool())
  })

  val cnt_temp=RegInit(0.U(12.W))
  when(io.valid) {
    when(io.pulse && (io.cnt =/= (io.goal_num - 1.U))) {
      cnt_temp := cnt_temp+ 1.U
      io.out_valid := false.B
    }.elsewhen(io.pulse && (io.cnt === (io.goal_num - 1.U))) {
      cnt_temp := 0.U
      io.out_valid := true.B
    }.otherwise{
      cnt_temp := cnt_temp
      io.out_valid := false.B
    }
  }.otherwise{
    cnt_temp := 0.U
    io.out_valid := false.B
  }

  io.cnt:=cnt_temp
}


object Conter_pause{
  def apply(valid:Bool,goal_num:UInt,pulse:Bool):(UInt,Bool)={
    val inst=Module(new Conter_pause())
    inst.io.valid:=valid
    inst.io.goal_num:=goal_num
    inst.io.pulse:=pulse
    (inst.io.cnt,inst.io.out_valid)
  }
}


class Rank_Change_IO extends Bundle with Config{
  val input_valid=Input(Bool())
  val dIn=Input(Vec(RAM_GRP*RAM_NUM,SInt(OUT_BIT_WIDTH.W)))
  val dOut=Output(Vec(4,SInt(OUT_BIT_WIDTH.W)))
  val output_valid=Output(Bool())

}

class Rank_Change extends Module with Config {
  val io=IO(new Rank_Change_IO)

  val out_temp=VecInit(Seq.fill(4)(0.S(OUT_BIT_WIDTH.W)))




  //val in_valid = io.input_valid
  //val (cnt,cnt_valid)=Counter(in_valid,IN_WIDTH*IN_HIGHT)
//  val cnt_out_1=cnt/2.U//慢速情况
//  val cnt_out=cnt_out_1-1.U
  val start=RegNext(io.input_valid)
  val (cnt1,cnt1_valid)=Counter(start,2)
  val (cnt_in, cnt_in_valid)=Conter_pause(start,(IN_WIDTH+PADDING).U,cnt1_valid)//0-17
  val (cnt_out,cnt_out_valid)=Conter_pause(start,RAM_GRP.U,cnt_in_valid)//三种模式

  //when(in_valid){
  //{
    when(cnt_out === 0.U) { //对应读取1，2，3，4 ram
      out_temp(0) := io.dIn(0)
      out_temp(1) := io.dIn(1)
      out_temp(2) := io.dIn(2)
      out_temp(3) := io.dIn(3)
    }.elsewhen(cnt_out === 1.U) {
      out_temp(0) := io.dIn(2)
      out_temp(1) := io.dIn(3)
      out_temp(2) := io.dIn(4)
      out_temp(3) := io.dIn(5)
    }.elsewhen(cnt_out === 2.U) {
      out_temp(0) := io.dIn(4)
      out_temp(1) := io.dIn(5)
      out_temp(2) := io.dIn(0)
      out_temp(3) := io.dIn(1)
    }
 // }
//        }.otherwise{
//          for(i <- 0 until(4)){
//            out_temp(i):=RegNext(out_temp(i))
//          }
//        }





//  when(io.input_valid){
//    when(cnt_out%2.U===0.U){//两拍实现一个读操作
//      when((cnt_out/IN_WIDTH.U)%6.U===0.U||(cnt_out/IN_WIDTH.U)%6.U===1.U){//对应读取1，2，3，4 ram
//        when((cnt_out)%4.U===0.U){
//          out_temp(0):=io.dIn(0)
//          out_temp(1):=io.dIn(1)
//          out_temp(2):=io.dIn(2)
//          out_temp(3):=io.dIn(3)
//        }.otherwise{//((cnt_out/IN_WIDTH.U)%2.U===1.U)
//          out_temp(0):=io.dIn(1)
//          out_temp(1):=io.dIn(0)
//          out_temp(2):=io.dIn(3)
//          out_temp(3):=io.dIn(2)
//        }
//      }.elsewhen((cnt_out/IN_WIDTH.U)%6.U===2.U||(cnt_out/IN_WIDTH.U)%6.U===3.U){
//        when((cnt_out)%4.U===0.U){
//          out_temp(0):=io.dIn(2)
//          out_temp(1):=io.dIn(3)
//          out_temp(2):=io.dIn(4)
//          out_temp(3):=io.dIn(5)
//        }.otherwise{//((cnt_out/IN_WIDTH.U)%2.U===1.U)
//          out_temp(0):=io.dIn(3)
//          out_temp(1):=io.dIn(2)
//          out_temp(2):=io.dIn(5)
//          out_temp(3):=io.dIn(4)
//        }
//      }.elsewhen((cnt_out/IN_WIDTH.U)%6.U===4.U||(cnt_out/IN_WIDTH.U)%6.U===5.U){
//        when((cnt_out)%4.U===0.U){
//          out_temp(0):=io.dIn(4)
//          out_temp(1):=io.dIn(5)
//          out_temp(2):=io.dIn(0)
//          out_temp(3):=io.dIn(1)
//
//        }.otherwise{//((cnt_out/IN_WIDTH.U)%2.U===1.U)
//          out_temp(0):=io.dIn(5)
//          out_temp(1):=io.dIn(4)
//          out_temp(2):=io.dIn(1)
//          out_temp(3):=io.dIn(0)
//        }
//      }
//    }.otherwise{
//      for(i <- 0 until(4)){
//        out_temp(i):=RegNext(out_temp(i))
//      }
//    }
//  }
//



//  val reg=VecInit(Seq.fill(4)(0.U(OUT_BIT_WIDTH.W)))
//  val reg_grp=VecInit(Seq.fill(6)(reg))//寄存器组
//  val out_valid=ShiftRegister(io.input_valid,0)/////////////////////////
//  val (cnt_1,cnt_rank_valid)=Counter(out_valid,2*IN_WIDTH*IN_HIGHT)
//  val out_temp_end=VecInit(Seq.fill(4)(0.U(OUT_BIT_WIDTH.W)))
//
//  val cnt_rank=cnt_1/2.U
//
//
//  when(out_valid){
//    for(i <- 0 until(4)){
//      reg_grp(cnt_rank%6.U)(i):=out_temp(i)
//    }
//  }.otherwise{
//    reg_grp(cnt_rank%6.U):=RegNext(reg_grp(cnt_rank%6.U))
//  }
//
//  when(out_valid){
//    when((cnt_rank/4.U)%3.U===0.U){//三种模式
//      for(i <- 0 until(4)) {//0,1,2,3   12，13，14，15   24 25 26 27
//        out_temp_end(i):=reg_grp(cnt_rank%4.U)(i)//0123
//      }
//    }.elsewhen((cnt_rank/4.U)%3.U===1.U){//4,5,6,7 16，17，18，19 1 4
//      for(i <- 0 until(4)) {
//        out_temp_end(i):=ShiftRegister(reg_grp(cnt_rank%4.U+2.U)(i),6)//2345 2 5
//      }
//    }.elsewhen((cnt_rank/4.U)%3.U===2.U){//8,9,10,11 20 21 22 23
//      for(i <- 0 until(4)) {
//        out_temp_end(i):=reg_grp((cnt_rank%4.U+4.U)%6.U)(i)//4501
//      }
//    }
//
//  }.otherwise{
//
//  }


  val (cnt_rank, cnt_rank_valid)=Conter_pause(start,2.U,cnt1_valid)
  val reg_1=VecInit(Seq.fill(4)(0.S(OUT_BIT_WIDTH.W)))
  val reg_2=VecInit(Seq.fill(4)(0.S(OUT_BIT_WIDTH.W)))
  val reg_3=VecInit(Seq.fill(4)(0.S(OUT_BIT_WIDTH.W)))
  val reg_4=VecInit(Seq.fill(4)(0.S(OUT_BIT_WIDTH.W)))
  val reg_end=VecInit(Seq.fill(8)(0.S(OUT_BIT_WIDTH.W)))




  when(start){
    when(cnt_rank===0.U){
      for(i <- 0 until(4)){
        reg_3(i):=RegNext(out_temp(i))
      }
    }.elsewhen(cnt_rank===1.U){
      for(i <- 0 until(4)){
        reg_4(i):=RegNext(out_temp(i))
      }
    }
    for(i <- 0 until(4)) {
      reg_1(i) := ShiftRegister(reg_3(i), 4)
      reg_2(i) := ShiftRegister(reg_4(i), 2)
    }
  }


  //io.output_valid:=ShiftRegister(in_valid,4)
  when(cnt_in===0.U||cnt_in===1.U){
    io.output_valid:=false.B
  }.otherwise{
    io.output_valid:=true.B
  }

  val (cnt_end,cnt_valid_2)=Counter(io.output_valid,4)

  when(io.output_valid){
    when(cnt_end===0.U){
      for(i <- 0 until 4){
        io.dOut(i):=reg_2(i)
      }
    }.elsewhen(cnt_end===1.U){
      for(i <- 0 until 4){
        io.dOut(i):=reg_2(i)
      }
    }.elsewhen(cnt_end===2.U){
      for(i <- 0 until 4){
        //io.dOut(i):=reg_3(i)
        io.dOut(i):=ShiftRegister(reg_3(i),1)
      }
    }.elsewhen(cnt_end===3.U){
      for(i <- 0 until 4){
        io.dOut(i):=reg_4(i)
      }
    }.otherwise{
      for(i <- 0 until 4){
        io.dOut(i):=0.S
      }
    }
  }.otherwise{
    for(i <- 0 until 4){
      io.dOut(i):=0.S
    }
  }

//  when(io.input_valid){
//    /*when(cnt_en===0.U){
//      for(i <- 0 until(4)){
//        reg_1(i):=out_temp(i)
//      }
//    }.elsewhen(cnt_en===1.U){
//      for(i <- 0 until(4)){
//        reg_2(i):=out_temp(i)
//      }
//    }.else*/
//    when(cnt_en%2.U===0.U){//cnt_en>=2.U&&
//
//      for(i <- 0 until(4)){
//        reg_3(i):=out_temp(i)
//        reg_1(i):=reg_3(i)
//      }
//    }.elsewhen(cnt_en%2.U===1.U){
//      for(i <- 0 until(4)){
//        reg_4(i):=out_temp(i)
//        reg_2(i):=reg_4(i)
//      }
//    }.otherwise{
//      for(i <- 0 until 4){
//        reg_1(i):=RegNext(reg_1(i))
//        reg_2(i):=RegNext(reg_2(i))
//        reg_3(i):=RegNext(reg_3(i))
//        reg_4(i):=RegNext(reg_4(i))
//      }
//    }
//  }

//  val (cnt_for_out,cnt_for_out_valid)=Counter(ShiftRegister(io.input_valid,3),2*IN_WIDTH)////
//  when(ShiftRegister(io.input_valid,3)&&cnt_for_out < (IN_WIDTH.U*2.U-4.U)){
//    io.output_valid:=true.B
//  }.otherwise{
//    io.output_valid:=false.B
//  }
//  when(io.output_valid){
//    for(i <- 0 until 4){
//      when(cnt_en%2.U===0.U){
//        reg_end(i):=reg_1(i)
//        reg_end(i+4):=reg_2(i)
//      }.otherwise{
//        reg_end(i):=reg_3(i)
//        reg_end(i+4):=reg_4(i)
//      }
//    }
//  }.otherwise{
//    for(i <- 0 until 4){
//        reg_end(i):=0.U
//        reg_end(i+4):=0.U
//    }
//  }
//
////  for(i <- 0 until(8)){
////    io.dOut(i):=reg_end(i)
////  }
//
//
//    when(cnt_2%2.U===0.U){
//      for(i <- 0 until 4){
//        io.dOut(i):=reg_end(i)
//      }
//    }.otherwise{
//      for(i <- 0 until 4){
//        io.dOut(i):=reg_end(i+4)
//      }
//    }







}



class matrix extends Module with Config {//0123 2345 4567 6789
  val io=IO(new Bundle{
    val input_valid=Input(Bool())
    val dIn=Input(Vec(4,SInt(OUT_BIT_WIDTH.W)))
    val dOut=Output(Vec(8,SInt(OUT_BIT_WIDTH.W)))
  })

  //up down两部分
  val reg_1=VecInit(Seq.fill(4)(0.S(OUT_BIT_WIDTH.W)))
  val reg_2=VecInit(Seq.fill(4)(0.S(OUT_BIT_WIDTH.W)))
  val reg_3=VecInit(Seq.fill(4)(0.S(OUT_BIT_WIDTH.W)))
  val reg_4=VecInit(Seq.fill(4)(0.S(OUT_BIT_WIDTH.W)))

  val (cnt,cnt_valid)=Counter(io.input_valid,(IN_WIDTH+PADDING)*(IN_HIGHT+PADDING))
  when(io.input_valid){
    when(cnt===0.U){
      for(i <- 0 until(4)){
        reg_1(i):=io.dIn(i)
      }
    }.elsewhen(cnt===1.U){
      for(i <- 0 until(4)){
        reg_2(i):=io.dIn(i)
      }
    }.elsewhen(cnt>=2.U&&cnt%2.U===0.U){

      for(i <- 0 until(4)){
        reg_3(i):=io.dIn(i)
        reg_1(i):=ShiftRegister(reg_3,1)
      }
    }.elsewhen(cnt>=2.U&&cnt%2.U===1.U){
      for(i <- 0 until(4)){
        reg_4(i):=io.dIn(i)
        reg_2(i):=ShiftRegister(reg_4,2)
      }
    }
  }
  for(i <- 0 until 4){
    when(cnt%2.U===0.U){
      io.dOut(i):=reg_1(i)
      io.dOut(i+4):=reg_3(i)
    }.otherwise{
      io.dOut(i):=reg_2(i)
      io.dOut(i+4):=reg_4(i)
    }
  }
}

object Rank_Change extends App{

  chisel3.Driver.emitVerilog(new Rank_Change())

}
