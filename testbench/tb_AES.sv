`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2025 14:36:52
// Design Name: 
// Module Name: tb_AES
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


module tb_AES;

    logic clk, reset;
    logic [127:0] in;
    logic [127:0] key;
    logic [127:0] ciphertext;

    // Instantiate AES top module
    aes dut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .key(key),
        .ciphertext(ciphertext)
    );

    // Clock generation
    always #5 clk = ~clk; // 100MHz

    initial begin
        // Initial values
        clk = 0;
        reset = 1;

        // AES Known Plaintext and Key Example (NIST FIPS-197)
        // Plaintext: 
        in = 128'h00112233445566778899aabbccddeeff;
        // Key:       
        key = 128'h000102030405060708090a0b0c0d0e0f;
        
        #10 reset = 0;
        #110;
        $finish;
        
    end
endmodule
