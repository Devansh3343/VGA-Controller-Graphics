`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2025 05:00:32 PM
// Design Name: 
// Module Name: VGAMemory
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


module VGAMemory (
    input clk,
    input [15:0] addr,
    output reg [15:0] pixel_data
    );
    
    reg [15:0] memory [0:91200]; // 364 x 142 = 51688

    initial begin
        $readmemh("MemoryFile.mem", memory); // Load .mem file
    end

    always @(posedge clk) begin
        if (addr < 912000) // Ensure address is within valid range
            pixel_data <= memory[addr];
        else
            pixel_data <= 16'b0; // Default to black if out of bounds
    end
endmodule
