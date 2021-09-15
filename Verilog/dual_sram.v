`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/08/20 10:22:41
// Design Name: 
// Module Name: dual_sram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


Dual_SRAM_16x960 sram1(
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [9 : 0] addra
  .dina(dina),    // input wire [15 : 0] dina
  .clkb(clkb),    // input wire clkb
  .enb(enb),      // input wire enb
  .addrb(addrb),  // input wire [9 : 0] addrb
  .doutb(doutb)  // output wire [15 : 0] doutb
);