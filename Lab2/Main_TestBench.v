`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 09:53:42 PM
// Design Name: 
// Module Name: Main_TestBench
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


module Main_TestBench(

    );
    reg [3:0] IN1;
    reg [3:0] IN2;
    wire  [3:0] OUT;
    wire  CF;
    wire  Z;
    reg [1:0] CTRL;
    reg TOGGLE;
    wire CLK;
    
    Main U1(IN1,IN2,OUT,CF,Z,CTRL,TOGGLE,CLK);
    
    
    
    initial begin
    //ADD 
    CTRL=2'b00;   
    IN1 = 4'b0000;
    IN2= 4'b0000;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1111;
    IN2= 4'b0000;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b0000;
    IN2= 4'b1111;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1100;
    IN2= 4'b0011;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1001;
    IN2= 4'b0011;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b0100;
    IN2= 4'b1111;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1111;
    IN2= 4'b1111;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    
    //AND
    CTRL=2'b01;
    IN1 = 4'b0000;
    IN2 = 4'b0000;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1111;
    IN2= 4'b0000;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b0000;
    IN2= 4'b1111;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1100;
    IN2= 4'b0011;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1001;
    IN2= 4'b0011;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b0100;
    IN2= 4'b1111;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1111;
    IN2= 4'b1111;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    
    //NOT
    CTRL=2'b10;
    IN1 = 4'b0000;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b0001;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b0011;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b0111;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1001;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1111;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    
    //ZERO
    CTRL=2'b11;
    IN1 = 4'b0000;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b0001;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b0011;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b0111;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1001;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    IN1 = 4'b1111;
    TOGGLE = 1'b1;
    #10;
    TOGGLE = 1'b0;
    #100;
    
    end
endmodule
