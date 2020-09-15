`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 08:55:33 PM
// Design Name: 
// Module Name: ZERO_TEST
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


module ZERO_TEST(

    );
    reg [3:0] IN1;
    wire [3:0] OUT;
    wire Z;
    NOT U1(IN1,OUT,Z,CF);
    initial begin
    IN1 = 4'b0000;
    #100;
    IN1 = 4'b0001;
    #100;
    IN1 = 4'b0011;
    #100;
    IN1 = 4'b0111;
    #100;
    IN1 = 4'b1001;
    #100;
    IN1 = 4'b1111;
    #100;
    end
endmodule
