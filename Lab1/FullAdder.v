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

module FullAdder(
    input a,
    input b,
    input cin,
    output s,
    input cout
    );

 

wire w1, w2, w3;             //These wires will act as connections between our logic AND + OR gates

 

//determine what our carry out will be
and(w1,a,b);                 // a AND b attach output to w1
and(w2,a,cin);               // a AND cin attach output to w2
and(w3,b,cin);               // b AND cin attach output to w3
or(cout, w1,w2,w3);          // w1 OR w2 OR w3 attach output to cout

 

//determine what our sum is
xor(s,a,b,cin);

 

endmodule