`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2020 06:43:10 PM
// Design Name: 
// Module Name: NOT
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


module NOT(
    input wire[3:0] IN1,
    output wire [3:0] OUT,
    output reg Z,
    output wire CF
    );
    
    assign OUT = ~IN1;
    assign CF = 0;
    
    always@*
    begin
        if(OUT == 4'b0000)
            begin
            Z = 1'b0;
            end
        else
            begin
            Z = 1'b1;
            end
    end
    
    
endmodule
