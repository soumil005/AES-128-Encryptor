`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2025 18:22:53
// Design Name: 
// Module Name: shiftRows
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


module shiftRows(in, out);
    
    input logic [7:0] in [0:3] [0:3];
    output logic [7:0] out [0:3] [0:3];
    
    always_comb begin
        
        for(int i = 0; i < 4; i++) begin
            out[0][i] = in[0][i];
        end
        
        for(int i = 0; i < 4; i++) begin
            out[1][i] = in[1][(i + 1) % 4];
        end
        
        for(int i = 0; i < 4; i++) begin
            out[2][i] = in[2][(i + 2) % 4];
        end
        
        
        for(int i = 0; i < 4; i++) begin
            out[3][i] = in[3][(i + 3) % 4];
        end
        
    end
    

endmodule
