`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2025 02:58:01 PM
// Design Name: 
// Module Name: TopMod
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

module TopMod(
    input clk,
    output Hsync, 
    output Vsync,
    output [4:0] Red,
    output [4:0] Blue,
    output [5:0] Green
    );

    wire v_en, div;
    wire [15:0] vcnt_wire;
    wire [15:0] hcnt_wire;
    wire [15:0] pixel_data;

    // Pixel address calculation
    wire [15:0] pixel_addr;
    wire pixel_active;
    
    // Check if the current pixel is within the image boundaries
    assign pixel_active = (hcnt_wire < 429 && vcnt_wire < 320 && hcnt_wire > 144 && vcnt_wire > 35);

    // Calculate the memory address for active pixels
    assign pixel_addr = (vcnt_wire - 35 ) * 285 + hcnt_wire -144;

    // Clock division
    clkdiv v1 (clk, div);

    // Horizontal and vertical counters
    Hcnt v2 (div, v_en, hcnt_wire);
    Vcnt v3 (div, v_en, vcnt_wire);

    // Memory block instantiation
    VGAMemory vmem (
        .clk(div),
        .addr(pixel_addr),
        .pixel_data(pixel_data)
    );

    // Generate Hsync and Vsync signals
    assign Hsync = (hcnt_wire < 96) ? 1'b1 : 1'b0;
    assign Vsync = (vcnt_wire < 2) ? 1'b1 : 1'b0;

    // Color assignment: Display image in the top-left corner
    assign Red   = (pixel_active) ? pixel_data[15:11] : 5'b00000;
    assign Green = (pixel_active) ? pixel_data[10:5]  : 6'b000000;
    assign Blue  = (pixel_active) ? pixel_data[4:0]   : 5'b00000;

endmodule

 