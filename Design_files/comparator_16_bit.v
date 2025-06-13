module comparator_16_bit (
  input [15:0] A, B,
  output  EQ, GT, LT
);

  wire [15:0] xor_result;

  assign xor_result = A ^ B;

  // Calculate equality
  assign EQ = ~(|xor_result);

  // Calculate greater than (GT) - Explicitly define outputs for all bits
  wire GT_0, GT_1, GT_2, GT_3, GT_4, GT_5, GT_6, GT_7,
      GT_8, GT_9, GT_10, GT_11, GT_12, GT_13, GT_14, GT_15;

  // Compare MSB (Most Significant Bit)
  assign GT_15 = (~A[15] & B[15]);

  // Compare remaining bits (14 to 0)
  assign GT_14 = ~A[15] & (A[14] ^ B[14]);
  assign GT_13 = (~A[15] & ~A[14]) & (A[13] ^ B[13]);
  assign GT_12 = (~A[15] & ~A[14] & ~A[13]) & (A[12] ^ B[12]);
  assign GT_11 = (~A[15] & ~A[14] & ~A[13] & ~A[12]) & (A[11] ^ B[11]);
  assign GT_10 = (~A[15] & ~A[14] & ~A[13] & ~A[12] & ~A[11]) & (A[10] ^ B[10]);
  assign GT_9 = (~A[15] & ~A[14] & ~A[13] & ~A[12] & ~A[11] & ~A[10]) & (A[9] ^ B[9]);
  assign GT_8 = (~A[15] & ~A[14] & ~A[13] & ~A[12] & ~A[11] & ~A[10] & ~A[9]) & (A[8] ^ B[8]);
  assign GT_7 = (~A[15] & ~A[14] & ~A[13] & ~A[12] & ~A[11] & ~A[10] & ~A[9] & ~A[8]) & (A[7] ^ B[7]);
  assign GT_6 = (~A[15] & ~A[14] & ~A[13] & ~A[12] & ~A[11] & ~A[10] & ~A[9] & ~A[8] & ~A[7]) & (A[6] ^ B[6]);
  assign GT_5 = (~A[15] & ~A[14] & ~A[13] & ~A[12] & ~A[11] & ~A[10] & ~A[9] & ~A[8] & ~A[7] & ~A[6]) & (A[5] ^ B[5]);
  assign GT_4 = (~A[15] & ~A[14] & ~A[13] & ~A[12] & ~A[11] & ~A[10] & ~A[9] & ~A[8] & ~A[7] & ~A[6] & ~A[5]) & (A[4] ^ B[4]);
  assign GT_3 = (~A[15] & ~A[14] & ~A[13] & ~A[12] & ~A[11] & ~A[10] & ~A[9] & ~A[8] & ~A[7] & ~A[6] & ~A[5] & ~A[4]) & (A[3] ^ B[3]);
  assign GT_2 = (~A[15] & ~A[14] & ~A[13] & ~A[12] & ~A[11] & ~A[10] & ~A[9] & ~A[8] & ~A[7] & ~A[6] & ~A[5] & ~A[4] & ~A[3]) & (A[2] ^ B[2]);
  assign GT_1 = (~A[15] & ~A[14] & ~A[13] & ~A[12] & ~A[11] & ~A[10] & ~A[9] & ~A[8] & ~A[7] & ~A[6] & ~A[5] & ~A[4] & ~A[3] & ~A[2]) & (A[1] ^ B[1]);
  assign GT_0 = (~A[15] & ~A[14] & ~A[13] & ~A[12] & ~A[11] & ~A[10] & ~A[9] & ~A[8] & ~A[7] & ~A[6] & ~A[5] & ~A[4] & ~A[3] & ~A[2] & ~A[1]) & (A[0] ^ B[0]);
  // ... continue assigning GT_11, GT_10, ..., GT_0 similarly

  // Assign GT output based on individual bit comparisons
  assign GT = GT_0 | GT_1 | GT_2 | GT_3 | GT_4 | GT_5 | GT_6 | GT_7 |
              GT_8 | GT_9 | GT_10 | GT_11 | GT_12 | GT_13 | GT_14 | GT_15;

  // Calculate less than (LT) - Similar logic as GT, but using opposite logic for A and B
  wire LT_0, LT_1, LT_2, LT_3, LT_4, LT_5, LT_6, LT_7,
      LT_8, LT_9, LT_10, LT_11, LT_12, LT_13, LT_14, LT_15;

  // Compare MSB
  assign LT_15 = (A[15] & ~B[15]);

  // Compare remaining bits
  assign LT_14 = A[15] & (A[14] ^ B[14]);
  assign LT_13 = (A[15] & A[14]) & (~A[13] ^ B[13]);
  assign LT_12 = (A[15] & A[14] & A[13]) & (~A[12] ^ B[12]);
  assign LT_11 = (A[15] & A[14] & A[13] & A[12]) & (~A[11] ^ B[11]);
  assign LT_10 = (A[15] & A[14] & A[13] & A[12] & A[11]) & (~A[10] ^ B[10]);
  assign LT_9 = (A[15] & A[14] & A[13] & A[12] & A[11] & A[10]) & (~A[9] ^ B[9]);
  assign LT_8 = (A[15] & A[14] & A[13] & A[12] & A[11] & A[10] & A[9]) & (~A[8] ^ B[8]);
  assign LT_7 = (A[15] & A[14] & A[13] & A[12] & A[11] & A[10] & A[9] & A[8]) & (~A[7] ^ B[7]);
  assign LT_6 = (A[15] & A[14] & A[13] & A[12] & A[11] & A[10] & A[9] & A[8] & A[7]) & (~A[6] ^ B[6]);
  assign LT_5 = (A[15] & A[14] & A[13] & A[12] & A[11] & A[10] & A[9] & A[8] & A[7] & A[6]) & (~A[5] ^ B[5]);
  assign LT_4 = (A[15] & A[14] & A[13] & A[12] & A[11] & A[10] & A[9] & A[8] & A[7] & A[6] & A[5]) & (~A[4] ^ B[4]);
  assign LT_3 = (A[15] & A[14] & A[13] & A[12] & A[11] & A[10] & A[9] & A[8] & A[7] & A[6] & A[5] & A[4]) & (~A[3] ^ B[3]);
  assign LT_2 = (A[15] & A[14] & A[13] & A[12] & A[11] & A[10] & A[9] & A[8] & A[7] & A[6] & A[5] & A[4] & A[3]) & (~A[2] ^ B[2]);
  assign LT_1 = (A[15] & A[14] & A[13] & A[12] & A[11] & A[10] & A[9] & A[8] & A[7] & A[6] & A[5] & A[4] & A[3] & A[2]) & (~A[1] ^ B[1]);
  assign LT_0 = (A[15] & A[14] & A[13] & A[12] & A[11] & A[10] & A[9] & A[8] & A[7] & A[6] & A[5] & A[4] & A[3] & A[2] & A[1]) & (~A[0] ^ B[0]);
  // ... continue assigning LT_12, LT_11, ..., LT_0 similarly

  // Assign LT output based on individual bit comparisons
  assign LT = LT_0 | LT_1 | LT_2 | LT_3 | LT_4 | LT_5 | LT_6 | LT_7 |
              LT_8 | LT_9 | LT_10 | LT_11 | LT_12 | LT_13 | LT_14 | LT_15;

endmodule

