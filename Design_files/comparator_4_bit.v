module comparator_4_bit (
  input [3:0] A, B,
  output reg EQ, GT, LT
);

  wire [3:0] xor_result;

  assign xor_result = A ^ B;

  always @* begin
    EQ = (|xor_result);
    GT = (&(~A[3] & B[3])) | (~A[3] & (A[2] ^ B[2])) | ((~A[3] & ~A[2]) & (A[1] ^ B[1])) | ((~A[3] & ~A[2] & ~A[1]) & (A[0] ^ B[0]));
    LT = (&(A[3] & ~B[3])) | (A[3] & (~A[2] ^ B[2])) | ((A[3] & A[2]) & (~A[1] ^ B[1])) | ((A[3] & A[2] & A[1]) & (~A[0] ^ B[0]));
  end

endmodule
