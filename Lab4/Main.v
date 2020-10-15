`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 01:58:30 PM
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
    input clk, 
    input inp,
    input cash,
    input credit,
    input done,
    input quarters,
    input dollars,
    input empty,
    input reg [7:0] item,
    output reg [3:0] change,
    output reg [3:0] state,
    output reg emptystatus,
    output reg notenoughmoney,
    output reg vend
   
    );
    
    integer quartercount;
    integer dollarcount;
    integer dollartotal;
    integer quartertotal;
    integer cashtotal;
    integer itemprice;
    
    reg TotalFullfilled;
    
    initial begin
        state = 4'b0001;
        quartercount = 0;
        dollarcount = 0;
        dollartotal = 0;
        quartertotal = 0;
        cashtotal = 0;
        divclk = 1'b0;
    end
    
    always@(posedge clk)begin
        divclk = ~divclk;
    end
    
    always @(posedge divclk)
    begin
        case(state)
            4'b0001: //state 1
            begin
                if(cash == 1)
                begin
                    state = 4'b0010; //state 2
                end
                else if(credit == 1)
                begin
                    state = 4'b1001; //state 9
                end
            end
            4'b0010: //state 2
            begin
                if(quarters == 1)
                begin
                    quartercount = quartercount + 1
                end
                else if(dollars == 1)
                begin
                    dollarcount = dollarcount + 1
                end
                else if(done == 1)
                begin
                    dollartotal = dollarcount * 4;
                    quartertotal = quartercount;
                    cashtotal = dollartotal + quartertotal;
                    quartercount = 0;
                    dollarcount = 0;
                    state = 4'b0011;
                end
            end
            4'b0011: //state 3
            begin
                case(item)
                    8'b00000001:
                    begin
                        if(Empty == 1)
                        begin
                            state = 4'b0100; //state 4
                        end
                        else
                            state = 4'b0101; //state 5
                        end
                    end
                    8'b00000010:
                    begin
                        if(Empty == 1)
                        begin
                            state = 4'b0100; //state 4
                        end
                        else
                            state = 4'b0101; //state 5
                        end
                    end
                    8'b00000100:
                    begin
                        if(Empty == 1)
                        begin
                            state = 4'b0100; //state 4
                        end
                        else
                            state = 4'b0101; //state 5
                        end
                    end
                    8'b00001000:
                    begin
                        if(Empty == 1)
                        begin
                            state = 4'b0100; //state 4
                        end
                        else
                            state = 4'b0101; //state 5
                        end
                    end
                    8'b00010000:
                    begin
                        if(Empty == 1)
                        begin
                            state = 4'b0100; //state 4
                        end
                        else
                            state = 4'b0101; //state 5
                        end
                    end
                    8'b00100000:
                    begin
                        if(Empty == 1)
                        begin
                            state = 4'b0100; //state 4
                        end
                        else
                            state = 4'b0101; //state 5
                        end
                    end
                    8'b01000000:
                    begin
                        if(Empty == 1)
                        begin
                            state = 4'b0100; //state 4
                        end
                        else
                            state = 4'b0101; //state 5
                        end
                    end
                    8'b10000000:
                    begin
                        if(Empty == 1)
                        begin
                            state = 4'b0100; //state 4
                        end
                        else
                            state = 4'b0101; //state 5
                        end
                    end
                endcase
            end
            4'b0100: //state 4
            begin
                emptystatus = 1;
                //input delay
                emptystatus = 0;
                state = 4'b0011; //state 3
            end
            4'b0101: //state 5
            begin
                case(item)
                    begin
                        8'b00000001:
                            begin
                                if(cashtotal >= 2) //$0.50
                                begin
                                    TotalFullfilled = 1;
                                end
                                else
                                begin
                                    TotalFullfilled = 0;
                                end
                            end
                        8'b00000010:
                            begin
                                if(cashtotal >= 2) //$0.50
                                begin
                                    TotalFullfilled = 1;
                                end
                                else
                                begin
                                    TotalFullfilled = 0;
                                end
                            end
                        8'b00000100:
                            begin
                                if(cashtotal >= 3) //$0.75
                                begin
                                    TotalFullfilled = 1;
                                end
                                else
                                begin
                                    TotalFullfilled = 0;
                                end
                            end
                        8'b00001000:
                            begin
                                if(cashtotal >= 3) //$0.75
                                begin
                                    TotalFullfilled = 1;
                                end
                                else
                                begin
                                    TotalFullfilled = 0;
                                end
                            end
                        8'b00010000:
                            begin
                                if(cashtotal >= 5) //$1.25
                                begin
                                    TotalFullfilled = 1;
                                    itemprice = 5;
                                end
                                else
                                begin
                                    TotalFullfilled = 0;
                                end
                            end
                        8'b00100000:
                            begin
                                if(cashtotal >= 5) //$1.25
                                begin
                                    TotalFullfilled = 1;
                                end
                                else
                                begin
                                    TotalFullfilled = 0;
                                end
                            end
                        8'b01000000:
                            begin
                                if(cashtotal >= 5) //$1.25
                                begin
                                    TotalFullfilled = 1;
                                end
                                else
                                begin
                                    TotalFullfilled = 0;
                                end
                            end
                        8'b10000000:
                            begin
                                if(cashtotal >= 5) //$1.25
                                begin
                                    TotalFullfilled = 1;
                                end
                                else
                                begin
                                    TotalFullfilled = 0;
                                end
                            end

                endcase
            
                if(TotalFullfilled == 1)
                begin
                    state = 4'b0110; // state 6
                end
                else
                    state = 4'b0111; //state 7
                end
            end
            
            4'b0110: //state 6
            begin
                vend = 1;
                //delay
                vend = 0;
                if(change == 1)
                begin
                    state = 4'b1000; //state 8
                else
                begin
                    state = 4'b0000; //state 0
                end  
            end
            
            4'b0111: //state 7
            begin
                notenoughmoney = 1;
                //delay
                notenoughmoney = 0;
                state = 4'b0101; //state 5
            end
            
            4'b1000: //state 8
            begin
                if(cashtotal > itemprice)
                begin
                    change = cashtotal - itemprice;
                end
                //display change somehow
                
            
            end
            
            4'b1010: //state 10
            begin 
                if(empty == 0)
                begin
                    state = 4'b1100;
                end
                else
                    state = 4'b1011;
                end;
            end
            
            4'b1011: //state 11
            begin 
               emptystatus = 1;
               //delay
               emptystatus = 0;
               state = 4'b1010;
            end 
            
            4'b1100: //state 12
            begin
                vend = 1;
                //delay
                vend = 0;
                state = 4'b0001;
            end
            
    endcase
               
          
                        
                        
                        
                        
                        
                        
                        
                        
                        

            
                
            
endmodule
