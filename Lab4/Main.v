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
    input [7:0] item,
    output reg change,
    output reg [3:0] state,
    output reg emptystatus,
    output reg notenoughmoney,
    output reg vend,
    output reg changeflag,
    output integer delayCount

    );
    
    integer quartercount;
    integer dollarcount;
    integer dollartotal;
    integer quartertotal;
    integer cashtotal;
    integer itemprice;
    integer integerchange;
    integer changecounter;
    //integer delayCount;
    
    reg TotalFullfilled;
    reg divclk;
    
    initial begin
        state = 4'b0001;
        quartercount = 0;
        dollarcount = 0;
        dollartotal = 0;
        quartertotal = 0;
        cashtotal = 0;
        delayCount = 0;
        vend = 0;
        divclk = 1'b0;
        notenoughmoney = 0;
        vend = 0;
        change = 3'b000;
        emptystatus = 0;
        notenoughmoney = 0;
        vend = 0;
        changeflag = 0;
        integerchange = 0;
        changecounter = 0;
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
                    state = 4'b1010; //state 10
                end
            end
            4'b0010: //state 2
            begin
                if(quarters == 1)
                begin
                    quartercount = quartercount + 1;
                end
                else if(dollars == 1)
                begin
                    dollarcount = dollarcount + 1;
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
                        state = 4'b0100; //state 4
                    end
                    8'b00000010:
                    begin
                        state = 4'b0101; //state 5
                    end
                    8'b00000100:
                    begin
                       state = 4'b0100; //state 4
                    end
                    8'b00001000:
                    begin
                        state = 4'b0101; //state 5
                    end
                    8'b00010000:
                    begin
                        state = 4'b0100; //state 4
                    end
                    8'b00100000:
                    begin
                       state = 4'b0101; //state 5
                    end
                    8'b01000000:
                    begin
                        state = 4'b0100; //state 4
                    end
                    8'b10000000:
                    begin
                      state = 4'b0101; //state 5
                    end
                endcase
            end
            4'b0100: //state 4
            begin
                emptystatus = 1;
                if(delayCount ==25)begin
                    delayCount = 0;
                    emptystatus = 0;
                    state = 4'b0011; //state 3
                end
                delayCount = delayCount+1;
            end
            4'b0101: //state 5
            begin
                case(item)
                        8'b00000001:
                            begin
                                itemprice = 2;
                                if(cashtotal == 2) //$0.50
                                begin
                                    changeflag = 0;
                                    state = 4'b0110; // state 6
                                end
                                else if(cashtotal > 2)
                                begin
                                    changeflag = 1;
                                    state = 4'b0110; // state 6
                                end
                                else
                                begin
                                    changeflag = 0;
                                    state = 4'b0111; //state 7
                                end
                            end
                        8'b00000010:
                            begin
                                itemprice = 2;
                                if(cashtotal == 2) //$0.50
                                begin
                                    changeflag = 0;
                                    state = 4'b0110; // state 6
                                end
                                else if(cashtotal > 2)
                                begin
                                    changeflag = 1;
                                    state = 4'b0110; // state 6
                                end
                                else
                                begin
                                    changeflag = 0;
                                    state = 4'b0111; //state 7
                                end
                            end
                        8'b00000100:
                            begin
                                itemprice = 3;
                                if(cashtotal == 3) //$0.75
                                begin
                                    changeflag = 0;
                                    state = 4'b0110; // state 6
                                end
                                else if(cashtotal > 3)
                                begin
                                    changeflag = 1;
                                    state = 4'b0110; // state 6
                                end
                                else
                                begin
                                    changeflag = 0;
                                    state = 4'b0111; //state 7
                                end
                            end
                        8'b00001000:
                            begin
                                itemprice = 3;
                                if(cashtotal == 3) //$0.75
                                begin
                                    changeflag = 0;
                                    state = 4'b0110; // state 6
                                end
                                else if(cashtotal > 3)
                                begin
                                    changeflag = 1;
                                    state = 4'b0110; // state 6
                                end
                                else
                                begin
                                    changeflag = 0;
                                    state = 4'b0111; //state 7
                                end
                            end
                        8'b00010000:
                            begin
                                itemprice = 5;
                                if(cashtotal == 5) //$1.25
                                begin
                                    changeflag = 0;
                                    state = 4'b0110; // state 6
                                end
                                else if(cashtotal > 5)
                                begin
                                    changeflag = 1;
                                    state = 4'b0110; // state 6
                                end
                                else
                                begin
                                    changeflag = 0;
                                    state = 4'b0111; //state 7
                                end
                            end
                        8'b00100000:
                            begin
                                itemprice = 5;
                                if(cashtotal == 5) //$1.25
                                begin
                                    changeflag = 0;
                                    state = 4'b0110; // state 6
                                end
                                else if(cashtotal > 5)
                                begin
                                    changeflag = 1;
                                    state = 4'b0110; // state 6
                                end
                                else
                                begin
                                    changeflag = 0;
                                    state = 4'b0111; //state 7
                                end
                            end
                        8'b01000000:
                            begin
                                itemprice = 5;
                                if(cashtotal == 5) //$1.25
                                begin
                                    changeflag = 0;
                                    state = 4'b0110; // state 6
                                end
                                else if(cashtotal > 5)
                                begin
                                    changeflag = 1;
                                    state = 4'b0110; // state 6
                                end
                                else
                                begin
                                    changeflag = 0;
                                    state = 4'b0111; //state 7
                                end
                            end
                        8'b10000000:
                            begin
                                itemprice = 5;
                                if(cashtotal == 5) //$1.25
                                begin
                                    changeflag = 0;
                                    state = 4'b0110; // state 6
                                end
                                else if(cashtotal > 5)
                                begin
                                    changeflag = 1;
                                    state = 4'b0110; // state 6
                                end
                                else
                                begin
                                    changeflag = 0;
                                    state = 4'b0111; //state 7
                                end
                            end
                endcase
            end
            
            4'b0110: //state 6
            begin
                vend = 1;
                if(delayCount == 25)begin
                    delayCount = 0;
                    vend = 0;
                    if(changeflag == 1)
                    begin
                        state = 4'b1000; //state 8
                    end
                    else
                    begin
                        state = 4'b0000; //state 0
                    end  
                end
                delayCount = delayCount+1;

                
            end
            
            4'b0111: //state 7
            begin
                notenoughmoney = 1;
                //delay
                notenoughmoney = 0;
                state = 4'b0010; //state 2
            end
            
            4'b1000: //state 8
            begin
                if(cashtotal > itemprice)
                begin
                    integerchange = cashtotal - itemprice;
                    itemprice = 0;
                    if (integerchange == changecounter)
                    begin
                        changecounter = 0;
                        integerchange = 0;
                        state = 4'b0001;
                    end
                    else
                        changecounter = changecounter + 1;
                        change = 1;
                        #100;
                        change = 0;
                    
                end
            end

            
            4'b1010: //state 10
            begin 
                case(item)
                    8'b00000001:
                        begin
                            state = 4'b1011; //state 11
                        end
                    8'b00000010:
                        begin
                            state = 4'b1100; //state 12
                        end
                    8'b00000100:
                        begin
                            state = 4'b1011; //state 11
                        end
                    8'b00001000:
                        begin
                            state = 4'b1100; //state 12
                        end
                    8'b00010000:
                        begin
                            state = 4'b1011; //state 11
                        end
                    8'b00100000:
                        begin
                            state = 4'b1100; //state 12
                        end
                    8'b01000000:
                        begin
                            state = 4'b1011; //state 11
                        end
                    8'b10000000:
                        begin
                            state = 4'b1100; //state 12
                        end
                endcase
            end
            
            4'b1011: //state 11
            begin 
                emptystatus = 1;
                if(delayCount ==25)begin
                    delayCount = 0;
                    emptystatus = 0;
                    state = 4'b1010; //state 10
                end
                delayCount = delayCount+1;
               
            end 
            
            4'b1100: //state 12
            begin
                vend = 1;
                if(delayCount ==25)begin
                    delayCount = 0;
                    vend = 0;
                    state = 4'b0001; //state 1
                end
                delayCount = delayCount+1;
            end
            
    endcase
    end

endmodule
