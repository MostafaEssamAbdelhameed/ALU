`timescale 1ns / 1ps


module ARITHMATIC_UNIT #(parameter width = 16)(
    input [width - 1:0] A,
    input [width - 1:0] B,
    input [1:0] ALU_FUN,
    input clk,rst,
    input Arith_Enable,
    output reg [width - 1:0] Arith_OUT,
    output reg Carry_OUT,
    output reg Arith_Flag
    );
    always@(posedge clk or negedge rst) begin
        if (!rst) begin
            Arith_OUT <= 0;
            Arith_Flag <= 0;
            Carry_OUT <= 0;        
        end
        else if (Arith_Enable) begin
            Arith_OUT <= 0;
            Carry_OUT <= 0;
            Arith_Flag <= 1;
            case (ALU_FUN)
                2'b00:
                begin
                    {Carry_OUT,Arith_OUT} <= A+B;
                end
                2'b01:
                begin
                    {Carry_OUT,Arith_OUT} <= A-B;
                end
                2'b10:
                begin
                    {Carry_OUT,Arith_OUT} <= A*B;
                end                
                2'b11:
                begin
                    {Carry_OUT,Arith_OUT} <= A/B;
                end                
            endcase
        end
        else begin
            Arith_OUT <= 0;
            Arith_Flag <= 0;
            Carry_OUT <= 0;            
        end
    end
    
endmodule
