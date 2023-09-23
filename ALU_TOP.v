`timescale 1ns / 1ps

module ALU_TOP #(parameter width = 16)(
    input [width - 1:0] A,
    input [width - 1:0] B,
    input [3:0] ALU_FUN,
    input clk,rst,
    output  [width - 1:0] Arith_OUT,
    output  Carry_OUT,
    output  Arith_Flag,
    output  [width - 1:0] Logic_OUT,
    output  Logic_Flag,
    output  [width - 1:0] CMP_OUT,
    output  CMP_Flag,
    output  [width - 1:0] Shift_OUT,
    output  Shift_Flag
    );
wire [3:0] enables;

decoder d0 (ALU_FUN[3:2],enables);
ARITHMATIC_UNIT #(width) d1 (A,B,ALU_FUN[1:0],clk,rst,enables[3],Arith_OUT,Carry_OUT,Arith_Flag);
Logic_Unit #(width) d2 (A,B,ALU_FUN[1:0],clk,rst,enables[2],Logic_OUT,Logic_Flag);
CMP_Unit #(width) d3 (A,B,ALU_FUN[1:0],clk,rst,enables[1],CMP_OUT,CMP_Flag);
Shift_Unit #(width) d4 (A,B,ALU_FUN[1:0],clk,rst,enables[0],Shift_OUT,Shift_Flag);

endmodule
