`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 09:29:19 PM
// Design Name: 
// Module Name: FourBitAdder_TestBench
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 07:57:51 PM
// Design Name: 
// Module Name: FourBitAdder_TestBench
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


module FourBitAdder_TestBench(

    );
    reg [3:0]aa,bb;
    wire[3:0] out;
    wire carry;
    wire z;
    
    FourBitAdder u1(aa,bb,out,carry,z);
    initial begin
    aa=4'b0000;
    bb=4'b0000;
    #100;
    
    aa=4'b1111;
    bb=4'b0000;
    #100;

    aa=4'b0000;
    bb=4'b1010;
    #100;

    aa=4'b1111;
    bb=4'b1111;
    #100;

    aa=4'b0100;
    bb=4'b1111;
    
    aa=4'b0100;
    bb=4'b0011;
    #100;


    end
    
endmodule