`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2025 06:11:37 AM
// Design Name: 
// Module Name: Hcnt
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


module Hcnt(
    input clk,
    output reg v_en = 0,
    output reg [15:0] hcnt =0
    );
always @ ( posedge clk )

begin
    if(hcnt < 799)begin 
    hcnt <= hcnt + 1;
    v_en <= 1'b0;

    end 
    else begin 
        hcnt <= 0;
        v_en <= 1'b1;
    end 
end 
endmodule
