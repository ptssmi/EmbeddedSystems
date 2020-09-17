`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 07:01:50 PM
// Design Name: 
// Module Name: AND_TEST
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


module AND_TEST(

    

    );
        reg [3:0] IN1;
        reg [3:0] IN2;
        wire [3:0] OUT;
        wire Z;
        AND U1(IN1,IN2,OUT,Z,CF);
        initial begin
        IN1 = 4'b0000;
        IN2= 4'b0000;
        #100;
        IN1 = 4'b1111;
        IN2= 4'b0000;
        #100;
        IN1 = 4'b0000;
        IN2= 4'b1111;
        #100;
        IN1 = 4'b1100;
        IN2= 4'b0011;
        #100;
        IN1 = 4'b1001;
        IN2= 4'b0011;
        #100;
        IN1 = 4'b0100;
        IN2= 4'b1111;
        #100;
        IN1 = 4'b1111;
        IN2= 4'b1111;
        end
endmodule
