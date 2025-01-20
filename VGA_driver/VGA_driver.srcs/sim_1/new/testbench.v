//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2025 04:29:30 PM
// Design Name: 
// Module Name: testbench
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

`timescale 1ns / 1ps

module testbench;

    // Testbench signals
    reg clk;                   // Clock signal
    wire Hsync, Vsync;         // Sync signals
    wire [4:0] Red, Blue;      // Red and Blue color signals
    wire [5:0] Green;          // Green color signal

    // Instantiate the TopMod module
    TopMod uut (
        .clk(clk),
        .Hsync(Hsync),
        .Vsync(Vsync),
        .Red(Red),
        .Blue(Blue),
        .Green(Green)
    );

    // Clock generation
    initial begin
        clk = 0;               // Initialize clk
        forever #10 clk = ~clk; // Toggle clk every 10 ns
    end

endmodule
