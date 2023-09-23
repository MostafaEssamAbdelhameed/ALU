`timescale 1ns / 1ps


module decoder(
    input [1:0] in,
    output reg [3:0] out
    );
    
    always @(*) begin
        case(in)
            2'b00: out = 4'b1000;
            2'b01: out = 4'b0100;
            2'b10: out = 4'b0010;
            2'b11: out = 4'b0001;
        endcase
    end
/*    assign out = (in == 2'b00)? 4'b1000 : 0;
    assign out = (in == 2'b01)? 4'b0100 : 0;
    assign out = (in == 2'b10)? 4'b0010 : 0;
    assign out = (in == 2'b11)? 4'b0001 : 0;*/

endmodule
