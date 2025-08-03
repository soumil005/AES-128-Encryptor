`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2025 19:11:07
// Design Name: 
// Module Name: addRoundKey
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


module addRoundKey(in, key, out);

    input logic [7:0] in [0:3][0:3];
    input logic [7:0] key [0:3][0:3];
    output logic [7:0] out [0:3][0:3];
    
    always_comb begin
        for(int i = 0; i < 4; i++) begin
            for(int j = 0; j < 4; j++) begin
                out[i][j] = in[i][j] ^ key[i][j];
            end
        end
    end

endmodule
