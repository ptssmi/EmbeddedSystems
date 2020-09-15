`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 06:44:06 PM
// Design Name: 
// Module Name: ZERO
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


module ZERO(
    input wire[3:0] IN1,
    output wire [3:0] OUT,
    output wire Z,
    output wire CF
    );
    
    assign OUT = 0;
    assign Z = 0;
    assign CF = 0;
endmodule
