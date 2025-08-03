`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.08.2025 18:56:51
// Design Name: 
// Module Name: mixColumns
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


module mixColumns(in,out);
                  
    input logic [7:0] in [0:3][0:3];
    output logic [7:0] out[0:3][0:3];
    logic [7:0] a0, a1, a2, a3;
    
    // Function to multiply by 2 in GF(2^8)
    function logic [7:0] xtime(input logic [7:0] b);
        xtime = (b[7]) ? ((b << 1) ^ 8'h1b) : (b << 1);
    endfunction

    // Function to multiply in GF(2^8) by {01,02,03}
    function logic [7:0] gmul(input logic [7:0] a, input logic [7:0] b);
        case (b)
            8'h01: gmul = a;
            8'h02: gmul = xtime(a);
            8'h03: gmul = xtime(a) ^ a;
            default: gmul = 8'h00; // Not used in standard AES MixColumns
        endcase
    endfunction

    always_comb begin
        for (int col = 0; col < 4; col++) begin
            a0 = in[0][col];
            a1 = in[1][col];
            a2 = in[2][col];
            a3 = in[3][col];

            out[0][col] = gmul(a0, 8'h02) ^ gmul(a1, 8'h03) ^ a2 ^ a3;
            out[1][col] = a0 ^ gmul(a1, 8'h02) ^ gmul(a2, 8'h03) ^ a3;
            out[2][col] = a0 ^ a1 ^ gmul(a2, 8'h02) ^ gmul(a3, 8'h03);
            out[3][col] = gmul(a0, 8'h03) ^ a1 ^ a2 ^ gmul(a3, 8'h02);
        end
    end

endmodule

