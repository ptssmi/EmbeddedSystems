`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 09:32:53 PM
// Design Name: 
// Module Name: Main
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


module Main(
    input [3:0] IN1,
    input [3:0] IN2,
    output reg [3:0] OUT,
    output reg CF,
    output reg Z,
    input [1:0] CTRL,
    input TOGGLE,
    output reg CLK
    );
    
    
    wire [3:0] OUTADD;
    wire [3:0] OUTAND;
    wire [3:0] OUTZERO;
    wire [3:0] OUTNOT;
    
    wire CFADD;
    wire CFAND;
    wire CFZERO;
    wire CFNOT;
    
    wire ZADD;
    wire ZAND;
    wire ZZERO;
    wire ZNOT;
    
    always
    begin
        CLK = 1'b0;
        #10;
        CLK = 1'b1;
        #10;
    end
    
    FourBitAdder s0(IN1,IN2,OUTADD,CFADD,ZADD);
    AND          s1(IN1,IN2,OUTAND,ZAND,CFAND);
    NOT          s2(IN1,OUTNOT,ZNOT,CFNOT);
    ZERO         s3(IN1,OUTZERO,ZZERO,CFZERO);

    always@*
    begin 
        if(CLK == 1'b1)
        begin
            if(TOGGLE == 1'b1)
            begin
                case(CTRL)
                    2'b00: 
                           begin
                           OUT = OUTADD;
                           CF = CFADD;
                           Z = ZADD;
                           end
                    2'b01:
                           begin
                           OUT = OUTAND;
                           CF = CFAND;
                           Z = ZAND;
                           end
                    2'b10:
                           begin
                           OUT = OUTNOT;
                           CF = CFNOT;
                           Z = ZNOT;
                           end
                    2'b11:
                           begin
                           OUT = OUTZERO;
                           CF = CFZERO;
                           Z = ZZERO;
                           end
                endcase
            end
        end
    end    
endmodule
