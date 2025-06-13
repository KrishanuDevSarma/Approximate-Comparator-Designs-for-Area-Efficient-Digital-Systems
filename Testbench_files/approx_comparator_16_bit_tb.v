// Testbench for 16-bit Approximate Comparator

`timescale 1ns/1ps

module approx_comparator_16_bit_tb;

  // Inputs to the comparator
  reg [15:0] a, b;

  // Outputs from the comparator
  wire AeqB, AgtB, AltB;

  // Instantiate the design under test (DUT)
  // This connects the testbench signals to the comparator's ports
  approx_comparator_16_bit dut (
    .A(a),
    .B(b),
    .EQ(AeqB),
    .GT(AgtB),
    .LT(AltB)
  );

  // Enable VCD dump for GTKWave or any VCD viewer
  initial begin
    $dumpfile("approx_comparator_16_bit_tb.vcd");
    $dumpvars(0, approx_comparator_16_bit_tb);
  end

  // Task: apply inputs, wait for outputs, check results
  // in_a, in_b      -> 16-bit input test values for a and b
  // exp_eq, exp_gt, exp_lt -> Expected outputs for AeqB, AgtB, AltB
  task apply_and_check;
    input [15:0] in_a, in_b;
    input exp_eq, exp_gt, exp_lt;
    begin
      // Apply input values
      a = in_a;
      b = in_b;
      #10; // Allow time for DUT to process inputs

      // Display current values and result
      $display("a = %h, b = %h | AeqB = %b, AgtB = %b, AltB = %b", a, b, AeqB, AgtB, AltB);

      // Check if outputs match expected values
      if (AeqB === exp_eq && AgtB === exp_gt && AltB === exp_lt) begin
        $display("Test PASSED\n");
      end else begin
        $display("Test FAILED -> Expected: AeqB = %b, AgtB = %b, AltB = %b\n", exp_eq, exp_gt, exp_lt);
      end
    end
  endtask

  initial begin
    $display("Starting Verification for Approximate 16-bit Comparator\n");

    // Apply various test cases covering all conditions
    apply_and_check(16'hAAAA, 16'hAAAA, 1, 0, 0); // Case: a == b
    apply_and_check(16'hFFFF, 16'h0000, 0, 1, 0); // Case: a > b
    apply_and_check(16'h1234, 16'h5678, 0, 0, 1); // Case: a < b
    apply_and_check(16'h0001, 16'h0002, 0, 0, 1); // Case: a < b
    apply_and_check(16'hABCD, 16'hABCD, 1, 0, 0); // Case: a == b
    apply_and_check(16'hFF00, 16'h00FF, 0, 1, 0); // Case: a > b
    apply_and_check(16'h1357, 16'h2468, 0, 0, 1); // Case: a < b
    apply_and_check(16'h8000, 16'h7FFF, 0, 1, 0); // Case: a > b

    $display("Verification Completed\n");
    $finish; // End the simulation
  end

endmodule
