`timescale 1ns / 1ps

module approx_comparator_16_bit (
  input [15:0] A, B,
  output reg EQ, GT, LT
);

  wire [15:0] xor_result;
  wire [14:0] majority;
  wire [14:0]C = A;
  wire [14:0]D = B;
  // Calculate XOR and majority for each pair of bits
  assign xor_result = A ^ B;
  assign majority = (xor_result[15] & (|xor_result[14:0])) |
                    (~xor_result[15] & (&(xor_result[14:12]) | &(xor_result[11:8]) | &(xor_result[7:4]) | &(xor_result[3:0])));

  // Determine EQ, GT, and LT based on majority voting
  always @* begin
    EQ = majority;
    GT = majority & ~|((A[15:12] & ~B[15:12]) | (A[11:8] & ~B[11:8]) | (A[7:4] & ~B[7:4]) | (A[3:0] & ~B[3:0]));
    LT = majority & ~|((~A[15:12] & B[15:12]) | (~A[11:8] & B[11:8]) | (~A[7:4] & B[7:4]) | (~A[3:0] & B[3:0]));
  end
   
    
endmodule

