`timescale 1ns / 1ps

module Logic_Unit #(parameter width = 16)(
    input [width - 1:0] A,
    input [width - 1:0] B,
    input [1:0] ALU_FUN,
    input clk,rst,
    input Logic_Enable,
    output reg [width - 1:0] Logic_OUT,
    output reg Logic_Flag
    );
 always@(posedge clk or negedge rst) begin
        if (!rst) begin
            Logic_OUT <= 0;
            Logic_Flag <= 0;
        end
        else if (Logic_Enable) begin
            Logic_OUT <= 0;
            Logic_Flag <= 1;
            case (ALU_FUN)
                2'b00:
                begin
                    Logic_OUT <= A&B;
                end
                2'b01:
                begin
                    Logic_OUT <= A|B;
                end
                2'b10:
                begin
                    Logic_OUT <= ~(A&B);
                end                
                2'b11:
                begin
                    Logic_OUT <= ~(A|B);
                end                
            endcase
        end
        else begin
            Logic_OUT <= 0;
            Logic_Flag <= 0;
        end
    end
    
endmodule
