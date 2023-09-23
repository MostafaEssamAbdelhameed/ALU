`timescale 1ns / 1ps


module CMP_Unit #(parameter width = 16)(
    input [width - 1:0] A,
    input [width - 1:0] B,
    input [1:0] ALU_FUN,
    input clk,rst,
    input CMP_Enable,
    output reg [width - 1:0] CMP_OUT,
    output reg CMP_Flag
    );
always@(posedge clk or negedge rst) begin
        if (!rst) begin
            CMP_OUT <= 0;
            CMP_Flag <= 0;
        end
        else if (CMP_Enable) begin
            CMP_OUT <= 0;
            CMP_Flag <= 1;
            case (ALU_FUN)
                2'b00:
                begin
                    CMP_OUT <= 0;
                end
                2'b01:
                begin
                    CMP_OUT <= (A==B);
                end
                2'b10:
                begin
                    CMP_OUT <= (A>B)? 2:0;
                end                
                2'b11:
                begin
                    CMP_OUT <= (A<B)? 3:0;
                end                
            endcase
        end
        else begin
            CMP_OUT <= 0;
            CMP_Flag <= 0;
        end
    end
    
endmodule
