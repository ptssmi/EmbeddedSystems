  
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
    input LeftTurn,
    input clk,
    output reg [2:0] Light1,
    output reg [2:0] Light2,
    output reg TurnLight,
    output reg [3:0] state
    );
   reg divclk ;
   integer delayCount;
   integer delayCount2;
    initial begin
        state = 4'b0001;
        delayCount = 0;
        delayCount2 = 0;
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
                   Light1 = 3'b100; //red
                   Light2 = 3'b001; //green
					
					if(delayCount == 300000000)begin
                       delayCount = 0;
					   state = 4'b0010; 
					end
		            
		            else begin
		               if(Emergency == 1'b1)begin
					        delayCount = 0;
                            Light1 = 3'b100; //red
                            Light2 = 3'b100; //red                            
							state = 4'b1100; //goes to emergency state
					   end
						else if(PowerOutage == 1'b1) begin
					        delayCount = 0;
                            Light1 = 3'b010; //yellow
                            Light2 = 3'b010; //yellow
							state = 4'b1011; //goes to poweroutage state
						end
						else if(Pedestrian == 1'b1)begin
					        delayCount = 0;
							state = 4'b0011; //goes to pedestrain state
						end
                        else if(LeftTurn == 1'b1)begin
					        delayCount = 0;
							state = 4'b1101; //goes to leftturn state
						end

						delayCount = delayCount +1;                   
		            end    
		               
				end
        
           4'b0010: //state 2
            begin
                Light1 = 3'b100; //red
                Light2 = 3'b010; //yellow
                if(delayCount == 50000000)begin
                    delayCount = 0;
                    state = 4'b0100; //state 4
                end
                delayCount = delayCount+1;
            end
            
            4'b0011: //state 3
            begin
                Light1 = 3'b100; //red
                Light2 = 3'b010; //yellow
                if(delayCount == 50000000)begin
                    delayCount = 0;
                    state = 4'b0101; //state 5
                end
                delayCount = delayCount+1;
            end
            4'b0100: //state 4
            begin 
                Light1 = 3'b100; //red
                Light2 = 3'b100; //red
                if(delayCount ==25000000)begin
                    delayCount = 0;
                    state = 4'b0110; //state 6
                end
                delayCount = delayCount+1;
            end
            4'b0101: //state 5
            begin
                Light1 = 3'b100; //red
                Light2 = 3'b100; //red
               
                if(delayCount ==600000000)begin
                    delayCount = 0;
                    state = 4'b0110; //state 6
                end
                delayCount = delayCount+1;
            end
            4'b0110: //state 6
              begin
                    Light1 = 3'b001; //green
                    Light2 = 3'b100; //red
                    
                    if(delayCount == 300000000)begin
                        delayCount = 0;
                        state = 4'b0111; //state 7
                    end
                    
                    if(Emergency == 1'b1)
                    begin
                        delayCount = 0;
                        state = 4'b1100; //goes to emergency state
                    end
                    else if(PowerOutage == 1'b1)
                    begin
                        delayCount =0;
                        state = 4'b1011;; //goes to poweroutage state
                    end
                    else if(Pedestrian == 1'b1)
                    begin
                        delayCount = 0;
                        state = 4'b0011; //goes to pedestrain state
                    end                   
                    
                    delayCount = delayCount +1;
                end
            4'b0111: //state 7
            begin
                Light1 = 3'b010; //yellow
                Light2 = 3'b100; //red
                if(delayCount == 50000000)begin
                    delayCount =0;
                    state = 4'b1001; //state 9
                end
                delayCount = delayCount+1;
            end
            4'b1000: //state 8
            begin
                Light1 = 3'b010; //yellow
                Light2 = 3'b100; //red
                if(delayCount == 50000000)begin
                    delayCount = 0;
                    state = 4'b1010; //state 10
                end
                delayCount = delayCount+1;
            end
            4'b1001: //state 9
            begin
                Light1 = 3'b100; //red
                Light2 = 3'b100; //red
                if(delayCount == 25000000)begin
                    delayCount =0;
                    state = 4'b0001; //state 1
                end
                delayCount = delayCount+1;
            end
            4'b1010: //state 10
            begin
                Light1 = 3'b100; //red
                Light2 = 3'b100; //red
                if(delayCount == 600000000)begin
                    delayCount = 0;
                    state = 4'b0001; //state 1
                end
                delayCount = delayCount+1;
            end
            4'b1011: //state 11
            begin
                if(PowerOutage == 1)
                begin

                    if(delayCount == 50000000)
                    begin
                        Light1[1] = ~Light1[1];
                        Light2[1] = ~Light2[1];
                        delayCount = 0;
                    end
                    else
                    begin
                        delayCount = delayCount + 1;
                    end
                        
                end
                else
                begin
                    delayCount = 0;
                    state = 4'b0001; //state 1
                end
            end

            4'b1100: //state 12
            begin
                if(delayCount2 == 300000000)
                begin
                    delayCount = 0;
                    delayCount2 = 0;
                    state = 4'b0001; //state 1
                end
                else
                begin
                    delayCount2 = delayCount2 + 1;
                    if(delayCount == 50000000)
                    begin
                        Light1[3] = ~Light1[3];
                        Light2[3] = ~Light2[3];
                        delayCount = 0;
                    end
                    else
                    begin
                        delayCount = delayCount + 1;
                    end
                end
            
            4'b1101: //state 13
            begin 
                if(delayCount == 50000000)
                begin
                    delayCount = 0;
                    state = 4'b1110; //state 14
                end
                else
                begin
                    Light1 = 3'b100; //red
                    Light2 = 3'b010; //yellow
                    
                    delayCount = delayCount + 1;
                end
            end
            
            4'b1110: //state 14
            begin 
                if(delayCount == 300000000)
                begin
                    delayCount = 0;
                    state = 4'b0110; //state 6
                    TurnLight = 1'b0; //off
                end
                else
                begin
                    Light1 = 3'b100; //red
                    Light2 = 3'b100; //red
                    TurnLight = 1'b1; //on
                    
                    delayCount = delayCount + 1;
                end
            end

            default: state = 4'b0001; // catch other possibilities
            
        endcase
    end
    
endmodule