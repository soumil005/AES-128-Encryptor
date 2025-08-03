`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2025 13:18:45
// Design Name: 
// Module Name: operations
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


module operations(in, key, out);

    input [7:0] in [0:3][0:3];
    input [7:0] key [0:3][0:3];
    output logic [7:0] out [0:3][0:3];
    
    logic [7:0] state_sb [0:3][0:3];
    logic [7:0] state_sr [0:3][0:3];
    logic [7:0] state_mc [0:3][0:3];
    logic [7:0] state_ark [0:3][0:3];
    
    subBytes SB(.in(in), .out(state_sb));
    shiftRows SR(.in(state_sb), .out(state_sr));
    mixColumns MC(.in(state_sr), .out(state_mc));
    addRoundKey ARK(.in(state_mc), .key(key), .out(state_ark));
    
    always_comb begin
    
        foreach(out[i,j])
           out[i][j] = state_ark[i][j];    
    
    end
    
endmodule
