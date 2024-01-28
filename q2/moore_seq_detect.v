`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2024 21:54:50
// Design Name: 
// Module Name: moore_seq_detect
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


module moore_seq_detect(
input x,clk,reset,
output reg z
    );
reg [3:0]PS,NS;
parameter S0=4'b000,S1=4'b001,S2=4'b010,S3=4'b011;
parameter S4=4'b100,S5=4'b101,S6=4'b110,S7=4'b111,S8=4'b1000;
always@(posedge clk or reset)
begin
if(reset)
PS<=S0;
else
PS<=NS;
end
always@(posedge clk or PS)
begin
case(PS)
S0:begin NS<=x?S1:S2;z=0;end
S1:begin NS<=x?S1:S6;z=0;end
S2:begin NS<=x?S3:S2;z=0;end
S3:begin NS<=x?S1:S4;z=0;end
S4:begin NS<=x?S3:S5;z=0;end
S5:begin NS<=x?S8:S2;z=1; end
S6:begin NS<=x?S3:S7;z=0;end
S7:begin NS<=x?S8:S2;z=0;end
S8:begin NS<=x?S1:S4;z=1;end
default:NS<=S0;
endcase
end
endmodule
