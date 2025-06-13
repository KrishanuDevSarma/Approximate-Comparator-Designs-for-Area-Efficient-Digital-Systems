// 8-bit Comparator in Verilog

module comparator_8_bit (
    input [7:0] a,
    input [7:0] b,
    output AeqB,
    output AgtB,
    output AltB
);

  // Equality check using bitwise XNOR and AND
  wire [7:0] eq_bits;
  assign eq_bits = ~(a ^ b); // Bitwise XNOR
  assign AeqB = &eq_bits;     // All bits must match

  // Greater-than and less-than comparisons
  assign AgtB = (a > b);
  assign AltB = (a < b);

endmodule
