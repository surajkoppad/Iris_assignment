`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2024 18:41:11
// Design Name: 
// Module Name: ror
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


module ror(
input [3:0]A,[1:0]n,
output reg [3:0]Y
 );
wire [3:0]K;
wire x0,x1,x2,x3;
wire s1=n[1];
wire s0=n[0];
mux dut1(A[0],A[2],s1,K[0]);
mux dut2(A[1],A[3],s1,K[1]);
mux dut3(A[2],A[0],s1,K[2]);
mux dut4(A[3],A[1],s1,K[3]);
mux dut5(K[0],K[1],s0,x0);
mux dut6(K[1],K[2],s0,x1);
mux dut7(K[2],K[3],s0,x2);
mux dut8(K[3],K[0],s0,x3);
always@(A,n)
begin
assign Y={x0,x1,x2,x3};
end
endmodule

module mux(
input I0,I1,s,
output reg y
);
always@(I0,I1,s)
begin
assign y=s?I1:I0;
end
endmodule


