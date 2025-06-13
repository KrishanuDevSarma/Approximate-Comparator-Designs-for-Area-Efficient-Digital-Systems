// 8-bit Approximate Comparator
// Outputs:
//   AeqB = 1 if a == b (approximate equality)
//   AgtB = 1 if a > b (approximate)
//   AltB = 1 if a < b (approximate)

module approx_comparator_8_bit (
    input [7:0] a,
    input [7:0] b,
    output AeqB,
    output AgtB,
    output AltB
);

  // Internal wires for bit-wise comparison
  wire [7:0] xnor_ab;
  wire [7:0] a_gt_b;
  wire [7:0] a_lt_b;

  // Bitwise equality using XNOR gates
  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) begin : xnor_loop
      assign xnor_ab[i] = ~(a[i] ^ b[i]);
    end
  endgenerate

  // Approximate Equality: check if most significant 6 bits match
  wire eq_upper6;
  assign eq_upper6 = &xnor_ab[7:2]; // Approximate equality on top 6 bits
  assign AeqB = eq_upper6;

  // Approximate Greater Than and Less Than Logic
  // Priority encoder-like logic (approximate)
  assign a_gt_b[7] = a[7] & ~b[7];
  assign a_lt_b[7] = ~a[7] & b[7];

  assign a_gt_b[6] = ~(a_gt_b[7] | a_lt_b[7]) & a[6] & ~b[6];
  assign a_lt_b[6] = ~(a_gt_b[7] | a_lt_b[7]) & ~a[6] & b[6];

  assign a_gt_b[5] = ~(a_gt_b[7] | a_lt_b[7] | a_gt_b[6] | a_lt_b[6]) & a[5] & ~b[5];
  assign a_lt_b[5] = ~(a_gt_b[7] | a_lt_b[7] | a_gt_b[6] | a_lt_b[6]) & ~a[5] & b[5];

  assign a_gt_b[4] = ~(a_gt_b[7] | a_lt_b[7] | a_gt_b[6] | a_lt_b[6] | a_gt_b[5] | a_lt_b[5]) & a[4] & ~b[4];
  assign a_lt_b[4] = ~(a_gt_b[7] | a_lt_b[7] | a_gt_b[6] | a_lt_b[6] | a_gt_b[5] | a_lt_b[5]) & ~a[4] & b[4];

  // Combine priority result for final decision
  assign AgtB = |a_gt_b[7:4];
  assign AltB = |a_lt_b[7:4];

endmodule
