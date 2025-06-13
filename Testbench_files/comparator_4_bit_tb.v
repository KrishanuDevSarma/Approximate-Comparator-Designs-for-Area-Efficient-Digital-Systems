// Testbench for 4-bit comparator

`timescale 1ns/1ps

module comparator_4_bit_tb;

  // Inputs
  reg [3:0] a, b;

  // Outputs
  wire AeqB, AgtB, AltB;

  // Expected outputs
  reg exp_eq, exp_gt, exp_lt;

  // Instantiate the Design Under Test (DUT)
  comparator_4_bit dut (
    .A(a),
    .B(b),
    .EQ(AeqB),
    .GT(AgtB),
    .LT(AltB)
  );

  // Enable VCD dump for waveform viewing
  initial begin
    $dumpfile("comparator_4_bit_tb.vcd");
    $dumpvars(0, comparator_4_bit_tb);
  end

  // Task to apply inputs, check outputs, and display result
  task apply_and_check;
    input [3:0] in_a, in_b;
    input expected_eq, expected_gt, expected_lt;
    begin
      a = in_a;
      b = in_b;
      exp_eq = expected_eq;
      exp_gt = expected_gt;
      exp_lt = expected_lt;
      #10;

      $display("a = %b, b = %b | AeqB = %b, AgtB = %b, AltB = %b", a, b, AeqB, AgtB, AltB);

      if (AeqB === exp_eq && AgtB === exp_gt && AltB === exp_lt)
        $display("PASS\n");
      else
        $display("FAIL - Expected: AeqB = %b, AgtB = %b, AltB = %b\n", exp_eq, exp_gt, exp_lt);
    end
  endtask

  // Main test sequence
  initial begin
    $display("\nStarting 4-bit Comparator Test\n");

    apply_and_check(4'b0000, 4'b0000, 1, 0, 0); // Equal
    apply_and_check(4'b1010, 4'b0101, 0, 1, 0); // Greater
    apply_and_check(4'b0011, 4'b1111, 0, 0, 1); // Less
    apply_and_check(4'b1111, 4'b0000, 0, 1, 0); // Greater
    apply_and_check(4'b0110, 4'b0110, 1, 0, 0); // Equal

    $display("Test Completed\n");
    $finish;
  end

endmodule
