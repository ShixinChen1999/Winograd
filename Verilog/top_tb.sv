`timescale 1ns / 1ps






module tb_top;

localparam CONV_DW = 8;
localparam MAC_WIDTH = 4;
localparam KERNEL_SIZE = 16;
localparam IN_DECIMAL_BIT = 14;
localparam WT_DECIMAL_BIT = 13;
localparam OUT_DECIMAL_BIT = 14;     // TBD




reg clk;
reg clk_x2;
reg rst;
reg mac_in_valid;
wire [MAC_WIDTH * CONV_DW-1:0] mac_in;
reg [KERNEL_SIZE * (CONV_DW+1)-1:0] mac_out;
reg wgt_valid;
wire [KERNEL_SIZE *2* CONV_DW-1:0] wgt1;
wire [KERNEL_SIZE *2* CONV_DW-1:0] wgt2;
wire  [2*CONV_DW+1:0] mac_result1;
wire  [2*CONV_DW+1:0] mac_result2;
wire  [2*CONV_DW+1:0] mac_result3;
wire  [2*CONV_DW+1:0] mac_result4;
wire mac_result_valid;

wire wgt_mux;
wire [47:0]Res1_temp;
wire [47:0]Res2_temp;

wire [2*(CONV_DW+2)+1:0]dOut ;


reg [CONV_DW-1:0] mac_in_n [MAC_WIDTH-1:0];
reg [CONV_DW-1:0] mac_rand;
reg [CONV_DW+1:0] dIn_G [MAC_WIDTH-1:0];

reg [CONV_DW+1:0] dIn_G1 [MAC_WIDTH-1:0];
reg [CONV_DW+1:0] dIn_G2 [MAC_WIDTH-1:0];
reg [CONV_DW+1:0] dIn_G3 [MAC_WIDTH-1:0];
reg [CONV_DW+1:0] dIn_G4 [MAC_WIDTH-1:0];

reg out_valid;
reg send_valid;


reg  [9 :0] address_a ;
reg  [15:0] dina      ;
reg  [9 :0] address_b ;
wire  [7:0] doutb     ;



//////////////////////////test for the behavior of SRAM
/*  
DualPortRAM sram( // @[:@16.2]
  .clock          (   clk              ), // @[:@17.4]
  .reset          (   rst              ), // @[:@18.4]
  .io_in_addr     (   address_a        ), // @[:@19.4]
  .io_dataIn      (   dina             ), // @[:@19.4]
  .io_input_valid (   send_valid       ), // @[:@19.4]
  .io_output_addr (   address_b        ), // @[:@19.4]
  .io_output_valid(   out_valid       ), // @[:@19.4]
  .io_dataOut     (   doutb            ) // @[:@19.4]
);*/

reg  [7:0] data_out ;
wire [7:0] data_dOut [3:0];
wire [23:0] result;
data_trans U_data_trans( // @[:@183.2]
  .clock                    (   clk                ), // @[:@184.4]
  .reset                    (   rst                ), // @[:@185.4]
  .io_input_valid           (   send_valid         ), // @[:@186.4]
  .io_Data_in               (   data_out           ),
  .io_output_valid          (   mac_result_valid   ), // @[:@186.4]
  .io_RAM_OUT_0             (   data_dOut[0]       ), // @[:@186.4]
  .io_RAM_OUT_1             (   data_dOut[1]       ), // @[:@186.4]
  .io_RAM_OUT_2             (   data_dOut[2]       ), // @[:@186.4]
  .io_RAM_OUT_3             (   data_dOut[3]       ),// @[:@186.4]
  .io_result                (   result             ) // @[:@2469.4]
//  .io_RAM_OUT_4             (   data_dOut[4]       ), // @[:@186.4]
//  .io_RAM_OUT_5             (   data_dOut[5]       ), // @[:@186.4]
//  .io_RAM_OUT_6             (   data_dOut[6]       ), // @[:@186.4]
//  .io_RAM_OUT_7             (   data_dOut[7]       )// @[:@186.4]
 
);


















always @ (posedge clk) begin
    if (rst) begin
        wgt_valid <= 1'b0;
        address_a <= 10'b0;
        dina <=16'b0;
    end
    
    else if(send_valid) begin
           address_a<=address_a+10'd1;
           dina <= dina+16'd2;
        end
        else begin
          address_a<=10'b0;
        end
       
end

always @ (posedge clk) begin
    if (rst) begin
        address_b <= 10'b0;   
    end
    else if(out_valid) begin
           address_b<=address_b+10'd1;
        end
        else begin
          address_b<=10'b0;
        end
end

initial begin
    clk = 1'b0;
    clk_x2 = 1'b1;
    rst = 1'b0;
    mac_in_valid = 1'b0;
    out_valid = 1'b0;
end



//simulation setting

string input_file_local = "D:/vivado/SRAM/input.txt";
string input_file_server = "D:/vivado/SRAM/input.txt";

reg  [7:0] mem [0:360*640];
reg  [19:0] addr ;

initial
begin
#10
  $readmemh("D:/vivado/SRAM/input.txt",mem);
  addr  = 20'd0;
end


always  @(posedge clk) //begin#20
begin
  if(addr<360*640&&send_valid)begin
  data_out  =  mem[addr][7:0];
   $display("%x", data_out );
  addr = addr + 20'd1;
  end
  else begin
    data_out = 8'b0;
      //$stop;
  end
  
end


string output_file_local = "D:/vivado/SRAM/file.txt";
string output_file_server = "D:/vivado/SRAM/file.txt";

integer Write_Out_File;
integer Write_In_File;
string localtime;
initial begin 
           Write_Out_File = $fopen(output_file_local);
           Write_In_File = $fopen(output_file_local);
           //$system("date > localtime");
           //$fwrite(Write_Out_File,"%s",localtime);
           //$fwrite(Write_Out_File,"always @(posedge clk) if(conv_out_channel_valid)\n");
           $fclose(Write_Out_File);
           $fclose(Write_In_File);
end

integer OUTPUT_CN=360*640;
always @(posedge clk) begin
    if(mac_result_valid) begin //& bias_or_rpt
           Write_Out_File = $fopen(output_file_local,"a");
           //for(int write_cnt = OUTPUT_CN;write_cnt > 0;write_cnt = write_cnt - 1) begin
               $fwrite(Write_Out_File,"%d ",result);
               $display("%x",result );
           //end
           $fwrite(Write_Out_File,"\n");            
           $fclose(Write_Out_File);
        end
end


//integer fp_w;
//integer i;
//reg [9:0] memory [0:2047];//声明有2048个10位的数据
//reg [9:0]datain;

//initial begin
////读取存储器文件yuzhen.dat到存储器中的给定地址
//$readmemb ("yuzhen.txt",memory);
////打开待写入数据文件夹
//fp_w = $fopen("D:/vivado/SRAM/file.txt", "w");
////显示存储器中的内容
//repeat(1)

//    #77590
    
//    for (i=0;i<10*2048;i=i+1)
    
//    # 20 begin
//    //$display("Memory[%d]=%d",i,result);
//    //memory[i]=result;
//    $display("%d",result );
//    $fwrite(fp_w, "%d\n",result);
//    end
//    $fclose(fp_w);
//    #30 $stop;
    

//end


//integer handle;

//initial
//        handle = $fopen("D:/vivado/SRAM/file.txt","w");
//        $fwrite(handle,"%d\n",result);//按照十进制格式写入数据到handle对应文件中，只能逐个写入（即data不能是数组）
       
//        $fclose(handle);//关闭文件，至此文件操作结束

//end

initial begin 
    rst = 1'b1;
   
    #30 rst = 1'b0;
       send_valid = 1'b1;
 

    
    #10 mac_in_valid = 1'b1;
    #120 out_valid = 1'b1;
    //#625000  send_valid = 1'b0;
    #4700000  send_valid = 1'b0;
end

always #10 clk = ~clk;
always #5 clk_x2 = ~clk_x2;

endmodule






