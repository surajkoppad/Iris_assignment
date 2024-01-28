`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.01.2024 20:54:57
// Design Name: 
// Module Name: mealy_seq_detect
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


module mealy_seq_detect(
input x,clk,reset,
output reg z
    );
reg [2:0]PS,NS;
parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011;
parameter S4=3'b100,S5=3'b101,S6=3'b110;
always@(posedge clk or reset)
begin
if(reset)
PS<=S0;
else
PS<=NS;
end
always@(PS or x)
begin
case(PS)
S0:begin NS<=x?S1:S2;z=0;end
S1:begin NS<=x?S1:S6;z=0;end
S2:begin NS<=x?S3:S2;z=0;end
S3:begin NS<=x?S1:S4;z=0;end
S4:begin NS<=x?S3:S5;z=x?0:1;end
S5:begin NS<=x?S3:S2;z=x?1:0; end
S6:begin NS<=x?S3:S5;z=0;end
default:NS<=S0;
endcase
end
endmodule
