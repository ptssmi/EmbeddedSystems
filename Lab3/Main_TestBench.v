`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 07:48:33 PM
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
     reg Emergency;
     reg PowerOutage;
     reg Pedestrian;
     reg clk;
     wire [3:0] state;
     wire [2:0] Light1;
     wire [2:0] Light2;
     
      Main U1(Emergency,PowerOutage,Pedestrian,clk,Light1,Light2,state);
      
      always
      begin
        clk = 1'b0;
        #10;
        clk = 1'b1;
        #10;
      end
          
      initial begin
      Emergency=0;
      PowerOutage=0;
      Pedestrian=0;
      //#100
      //Pedestrian=1;
      //#100
      //Pedestrian=0;
      //#100
      //Emergency=1;
      //#100
      //Emergency=0;
      //#100
      //PowerOutage=1;
      //#100
      //PowerOutage=0;
      
      end
      
endmodule
