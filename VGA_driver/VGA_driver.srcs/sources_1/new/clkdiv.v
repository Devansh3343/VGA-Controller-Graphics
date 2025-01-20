`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2025 04:34:50 AM
// Design Name: 
// Module Name: clkdiv
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


module clkdiv(
    input clk,          // Input clock (50 MHz)
    output reg clk_out  // Output clock (approximately 25.175 MHz)
);
    
    reg [15:0] counter;       // Counter for fractional clock divider
    reg [7:0] fraction_counter; // Fractional part counter
    
    // Fractional divider: Integer part (divide by 2) and fractional part (handle 0.175)
    always @(posedge clk) begin
        if (counter < 1) begin
            counter <= counter + 1;
            clk_out <= ~clk_out;  // Toggle output clock for every 2 input clock cycles
        end
        else begin
            counter <= 0;
            if (fraction_counter < 140) begin // Handle fractional part (0.175 as 140/1024)
                fraction_counter <= fraction_counter + 1;
            end
            else begin
                fraction_counter <= 0;
            end
        end
    end
endmodule

