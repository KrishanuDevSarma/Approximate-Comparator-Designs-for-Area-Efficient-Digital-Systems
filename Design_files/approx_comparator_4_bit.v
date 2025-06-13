module approx_comparator_4_bit (
  input [3:0] A, B,
  output reg EQ, GT, LT
);

  wire [3:0] xor_result;
  wire [2:0] majority;

  assign xor_result = A ^ B;
  assign majority = (xor_result[3] & (xor_result[2] | xor_result[1] | xor_result[0])) |
                    (~xor_result[3] & ((xor_result[2] & xor_result[1]) | (xor_result[2] & xor_result[0]) | (xor_result[1] & xor_result[0])));

  always @* begin
    EQ = majority;
    GT = majority & (~A[3] | B[3]) & (~A[2] | B[2]) & (~A[1] | B[1]) & (~A[0] | B[0]);
    LT = majority & (A[3] | ~B[3]) & (A[2] | ~B[2]) & (A[1] | ~B[1]) & (A[0] | ~B[0]);
  end

endmodule
