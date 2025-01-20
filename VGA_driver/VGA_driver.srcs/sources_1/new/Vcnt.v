`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2025 02:50:51 PM
// Design Name: 
// Module Name: Vcnt
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


module Vcnt(
    input clk,
    input Ven,
    output reg [15:0] Vcnt = 0
    );

    always@(posedge clk)
    begin
        if(Ven==1'b1)begin 
            if(Vcnt<524)
                Vcnt<= Vcnt+1;
            else begin
            Vcnt<=1'b0;
            end
        end 

    end
endmodule
