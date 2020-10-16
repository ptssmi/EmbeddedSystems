`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2020 08:03:35 PM
// Design Name: 
// Module Name: MainTB
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


module MainTB(

    );
    reg clk;
    reg inp;
    reg cash;
    reg credit;
    reg done;
    reg quarters;
    reg dollars;
    reg  [7:0] item;
    wire change;
    wire [3:0] state;
    wire emptystatus;
    wire notenoughmoney;
    wire vend;
    wire changeflag;
    wire delayCount;

    
    Main U1(clk,inp,cash,credit,done,quarters,dollars,item,change,state,emptystatus,notenoughmoney,vend,changeflag,delayCount);

    always
      begin
        clk = 1'b0;
        #10;
        clk = 1'b1;
        #10;
      end

    initial begin

      inp = 0;
      cash = 0;
      credit = 0;
      done = 0;
      quarters = 0;
      dollars = 0;
      item = 8'b00000000;


        //CREDIT TEST
        credit = 1;
        #1000;
        credit = 0;
        #100
        item=8'b00000001;
        #100;
         item=8'b00000010;
        #100;

        //CASH TEST for exact change
        cash = 1;
        #1000;
        cash = 0;
        #100;
        quarters = 1;
        #100;
        quarters = 0;
        #100;
        quarters = 1;
        #100;
        quarters = 0;
        #100;
        done = 1;
        #100;
        done = 0;
        #100;
        item=8'b00000001; //empty item
        #100;
        item=8'b00000010; //not empty item

        //cash test for more than exact change 
        cash = 1;
        #1000;
        cash = 0;
        #100;
        quarters = 1;
        #100;
        quarters = 0;
        #100;
        quarters = 1;
        #100;
        quarters = 0;
        #100;
        quarters = 1;
        #100;
        quarters = 0;
        #100;
        done = 1;
        #100;
        done = 0;
        #100;
        item=8'b00000001; //empty item
        #1000;
        item=8'b00000010; //not empty item

    end


endmodule
