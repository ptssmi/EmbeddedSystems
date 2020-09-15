`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 09:26:16 PM
// Design Name: 
// Module Name: FourBitAdder
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


module FourBitAdder(
    input [3:0] a,
    input [3:0] b,
    output [3:0] sum,
    output carry,
    output reg z
    );
    wire cin;                       //serves as the carry in for the lsb of our adder
    
    assign cin=1'b0;                //assign zero to the wire
    FullAdder s0( .a( a[0] ), .b( b[0]), .cin( cin ), .s( sum[0]), .cout( ripple0 ) );
    FullAdder s1( .a( a[1] ), .b( b[1]), .cin( ripple0 ), .s( sum[1]), .cout( ripple1 ) );
    FullAdder s2( .a( a[2] ), .b( b[2]), .cin( ripple1 ), .s( sum[2]), .cout( ripple2 ) );
    FullAdder s3( .a( a[3] ), .b( b[3]), .cin( ripple2 ), .s( sum[3]), .cout( carry ) );
    
    always@*
    begin
       if(sum == 4'b0000)
       begin
           if(carry == 1'b0)
           begin
               z=1'b1;
           end
       end
       else
       begin
        z=1'b0;
       end
    end
endmodule
