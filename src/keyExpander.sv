`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2025 20:31:37
// Design Name: 
// Module Name: keyExpander
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


module keyExpander(key, key0, key1, key2, key3, key4, key5, key6, key7, key8, key9, key10);
        
    input logic [127:0] key;
    output logic [7:0] key0      [0:3][0:3];
    output logic [7:0] key1      [0:3][0:3];
    output logic [7:0] key2      [0:3][0:3];
    output logic [7:0] key3      [0:3][0:3];
    output logic [7:0] key4      [0:3][0:3];
    output logic [7:0] key5      [0:3][0:3];
    output logic [7:0] key6      [0:3][0:3];
    output logic [7:0] key7      [0:3][0:3];
    output logic [7:0] key8      [0:3][0:3];
    output logic [7:0] key9      [0:3][0:3];
    output logic [7:0] key10      [0:3][0:3];
    
    int round;
    
    logic [31:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20;
    logic [31:0] w21, w22, w23, w24, w25, w26, w27, w28, w29;
    logic [31:0] w30, w31, w32, w33, w34, w35, w36, w37, w38, w39;
    logic [31:0] w40, w41, w42, w43;
    
    
    logic [31:0] w_r1, w_r2, w_r3, w_r4, w_r5, w_r6, w_r7, w_r8, w_r9, w_r10;
    logic [31:0] w [0:3];
    
    gfunc r1(.round(1), .w(w3), .w_out(w_r1));
    gfunc r2(.round(2), .w(w7), .w_out(w_r2));
    gfunc r3(.round(3), .w(w11), .w_out(w_r3));
    gfunc r4(.round(4), .w(w15), .w_out(w_r4));
    gfunc r5(.round(5), .w(w19), .w_out(w_r5));
    gfunc r6(.round(6), .w(w23), .w_out(w_r6));
    gfunc r7(.round(7), .w(w27), .w_out(w_r7));
    gfunc r8(.round(8), .w(w31), .w_out(w_r8));
    gfunc r9(.round(9), .w(w35), .w_out(w_r9));
    gfunc r10(.round(10), .w(w39), .w_out(w_r10));

    always_comb begin
        for(int col = 0; col < 4; col++) begin
            for(int row = 0; row < 4; row++) begin
                automatic int byte_index = 8 * (4 * col + row);
                key0[row][col] = key[127 - byte_index -: 8];
            end
        end
        
        w0 = {key0[0][0], key0[1][0], key0[2][0], key0[3][0]};
        w1 = {key0[0][1], key0[1][1], key0[2][1], key0[3][1]};
        w2 = {key0[0][2], key0[1][2], key0[2][2], key0[3][2]};
        w3 = {key0[0][3], key0[1][3], key0[2][3], key0[3][3]};
        
        w4 = w0 ^ w_r1;
        w5 = w4 ^ w1;
        w6 = w5 ^ w2;
        w7 = w6 ^ w3;
        
        w[0] = w4;
        w[1] = w5;
        w[2] = w6;
        w[3] = w7;
        for (int col = 0; col < 4; col++) begin
            for (int row = 0; row < 4; row++) begin
                key1[row][col] = w[col][31 - 8*row -: 8];
            end
        end
        
        w8 = w4 ^ w_r2;
        w9 = w8 ^ w5;
        w10 = w9 ^ w6;
        w11 = w10 ^ w7;
        

        w[0] = w8;
        w[1] = w9;
        w[2] = w10;
        w[3] = w11;
        for (int col = 0; col < 4; col++) begin
            for (int row = 0; row < 4; row++) begin
                key2[row][col] = w[col][31 - 8*row -: 8];
            end
        end
        
        w12 = w8 ^ w_r3;
        w13 = w12 ^ w9;
        w14 = w13 ^ w10;
        w15 = w14 ^ w11;
        

        w[0] = w12;
        w[1] = w13;
        w[2] = w14;
        w[3] = w15;
        for (int col = 0; col < 4; col++) begin
            for (int row = 0; row < 4; row++) begin
                key3[row][col] = w[col][31 - 8*row -: 8];
            end
        end
        
        w16 = w12 ^ w_r4;
        w17 = w13 ^ w16;
        w18 = w14 ^ w17;
        w19 = w15 ^ w18;
        

        w[0] = w16;
        w[1] = w17;
        w[2] = w18;
        w[3] = w19;
        
        for (int col = 0; col < 4; col++) begin
            for (int row = 0; row < 4; row++) begin
                key4[row][col] = w[col][31 - 8*row -: 8];
            end
        end
        
        
        w20 = w16 ^ w_r5;
        w21 = w17 ^ w20;
        w22 = w18 ^ w21;
        w23 = w19 ^ w22;
        

        w[0] = w20;
        w[1] = w21;
        w[2] = w22;
        w[3] = w23;
        for (int col = 0; col < 4; col++) begin
            for (int row = 0; row < 4; row++) begin
                key5[row][col] = w[col][31 - 8*row -: 8];
            end
        end
        
        
        w24 = w20 ^ w_r6;
        w25 = w21 ^ w24;
        w26 = w22 ^ w25;
        w27 = w23 ^ w26;
        

        w[0] = w24;
        w[1] = w25;
        w[2] = w26;
        w[3] = w27;
        for (int col = 0; col < 4; col++) begin
            for (int row = 0; row < 4; row++) begin
                key6[row][col] = w[col][31 - 8*row -: 8];
            end
        end
        
        w28 = w24 ^ w_r7;
        w29 = w25 ^ w28;
        w30 = w26 ^ w29;
        w31 = w27 ^ w30;
        

        w[0] = w28;
        w[1] = w29;
        w[2] = w30;
        w[3] = w31;
        for (int col = 0; col < 4; col++) begin
            for (int row = 0; row < 4; row++) begin
                key7[row][col] = w[col][31 - 8*row -: 8];
            end
        end
        
        w32 = w28 ^ w_r8;
        w33 = w29 ^ w32;
        w34 = w30 ^ w33;
        w35 = w31 ^ w34;
        
      
        w[0] = w32;
        w[1] = w33;
        w[2] = w34;
        w[3] = w35;
        
        for (int col = 0; col < 4; col++) begin
            for (int row = 0; row < 4; row++) begin
                key8[row][col] = w[col][31 - 8*row -: 8];
            end
        end
        
        w36 = w32 ^ w_r9;
        w37 = w33 ^ w36;
        w38 = w34 ^ w37;
        w39 = w35 ^ w38;
        
        w[0] = w36;
        w[1] = w37;
        w[2] = w38;
        w[3] = w39;
        for (int col = 0; col < 4; col++) begin
            for (int row = 0; row < 4; row++) begin
                key9[row][col] = w[col][31 - 8*row -: 8];
            end
        end
        
        w40 = w36 ^ w_r10;
        w41 = w37 ^ w40;
        w42 = w38 ^ w41;
        w43 = w39 ^ w42;
        
        w[0] = w40;
        w[1] = w41;
        w[2] = w42;
        w[3] = w43;
        for (int col = 0; col < 4; col++) begin
            for (int row = 0; row < 4; row++) begin
                key10[row][col] = w[col][31 - 8*row -: 8];
            end
        end

    end
    
endmodule
