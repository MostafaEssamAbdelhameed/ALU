`timescale 1ns / 1ps

module Shift_Unit #(parameter width = 16)(
    input [width - 1:0] A,
    input [width - 1:0] B,
    input [1:0] ALU_FUN,
    input clk,rst,
    input Shift_Enable,
    output reg [width - 1:0] Shift_OUT,
    output reg Shift_Flag
    );
always@(posedge clk or negedge rst) begin
        if (!rst) begin
            Shift_OUT <= 0;
            Shift_Flag <= 0;
        end
        else if (Shift_Enable) begin
            Shift_OUT <= 0;
            Shift_Flag <= 1;
            case (ALU_FUN)
                2'b00:
                begin
                    Shift_OUT <= A>>1;
                end
                2'b01:
                begin
                    Shift_OUT <= A<<1;
                end
                2'b10:
                begin
                    Shift_OUT <= B>>1;
                end                
                2'b11:
                begin
                    Shift_OUT <= B<<1;
                end                
            endcase
        end
        else begin
            Shift_OUT <= 0;
            Shift_Flag <= 0;
        end
    end
    
endmodule
