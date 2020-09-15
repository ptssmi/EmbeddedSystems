`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 06:41:45 PM
// Design Name: 
// Module Name: AND
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


module AND(
    input wire[3:0] IN1,
    input wire [3:0] IN2,
    output wire [3:0] OUT,
    output wire Z,
    output wire CF
    );
    
    assign OUT = IN1 & IN2;
    assign Z = (IN1 | IN2);
    assign CF = 0;
    
endmodule
