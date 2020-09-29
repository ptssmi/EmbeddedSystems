`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2020 06:57:41 PM
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
    input Emergency,
    input PowerOutage,
    input Pedestrian,
    input clk,
    output reg [2:0] Light1,
    output reg [2:0] Light2,
    output reg [3:0] state
    );
    
   integer delayCount;
    initial begin
        state = 4'b0001;
    end
    
    always @(posedge clk)
    begin
        case(state)
            4'b0001: //state 1
               begin
                Light1 = 3'b100; //red
                Light2 = 3'b001; //green
            
                if(Emergency == 1'b1)
                begin
                    state = 4'b1100; //goes to emergency state
                end
                else if(PowerOutage == 1'b1)
                begin
                    state = 4'b1011;; //goes to poweroutage state
                end
                else if(Pedestrian == 1'b1)
                begin
                    state = 4'b0011; //goes to pedestrain state
                end                   
                else
                begin
                    state = 4'b0010; 
                end
                
               end
        
           4'b0010: //state 2
            begin
                Light1 = 3'b100; //red
                Light2 = 3'b101; //yellow
                state = 4'b0100; //state 4
            end
            4'b0011: //state 3
            begin
                Light1 = 3'b100; //red
                Light2 = 3'b101; //yellow
                state = 4'b0101; //state 5
            end
            4'b0100: //state 4
            begin 
                Light1 = 3'b100; //red
                Light2 = 3'b100; //red
                state = 4'b0110; //state 6
            end
            4'b0101: //state 5
            begin
                Light1 = 3'b100; //red
                Light2 = 3'b100; //red
                state = 4'b0110; //state 6
                //some sort of delay
            end
            4'b0110: //state 6
            begin
                Light1 = 3'b001; //green
                Light2 = 3'b100; //red
                
                if(Emergency == 1'b1)
                begin
                    state = 4'b1100; //goes to emergency state
                end
                else if(PowerOutage == 1'b1)
                begin
                    state = 4'b1011;; //goes to poweroutage state
                end
                else if(Pedestrian == 1'b1)
                begin
                    state = 4'b0011; //goes to pedestrain state
                end                   
                else
                begin
                    state = 4'b0111; //state 7
                end
            end
            4'b0111: //state 7
            begin
                Light1 = 3'b101; //yellow
                Light2 = 3'b100; //red
                state = 4'b1001; //state 9
            end
            4'b1000: //state 8
            begin
                Light1 = 3'b101; //yellow
                Light2 = 3'b100; //red
                state = 4'b1010; //state 10
            end
            4'b1001: //state 9
            begin
                Light1 = 3'b100; //red
                Light2 = 3'b100; //red
                state = 4'b0001; //state 1
            end
            4'b1010: //state 10
            begin
                Light1 = 3'b100; //red
                Light2 = 3'b100; //red
                state = 4'b0001; //state 1
                //some sort of delay
            end
            4'b1011: //state 11
            begin
                if(PowerOutage == 1)
                begin
                    Light1 = 3'b101; //red
                    Light2 = 3'b101; //red
                    //need to make these flash
                    //wait time 1 secondo
                    Light1 = 3'b000; //off
                    Light2 = 3'b000; //off
                    //wait time 1 second
                end
                else
                begin
                    state = 4'b0001; //state 1
                end
            end

            4'b1100: //state 12
            begin
                //for 20 seconds
                begin
                    Light1 = 3'b100; //red
                    Light2 = 3'b100; //red
                    //need to make these flash
                    //wait time 1 secondo
                    Light1 = 3'b000; //off
                    Light2 = 3'b000; //off
                    //wait time 1 second
                end
                state = 4'b0001; //state 1
            end

            
            default: state = 4'b0001; // catch other possibilities
        endcase
    end
    
endmodule