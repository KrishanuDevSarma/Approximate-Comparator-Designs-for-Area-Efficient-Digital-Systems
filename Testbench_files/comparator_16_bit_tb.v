// Testbench for 16-bit Comparator

`timescale 1ns/1ps

module comparator_16_bit_tb;

  // Input signals
  reg [15:0] a, b;

  // Output signals
  wire AeqB, AgtB, AltB;

  // Expected signals for verification
  reg exp_eq, exp_gt, exp_lt;

  // Instantiate the DUT (Device Under Test)
  comparator_16_bit dut (
    .A(a),
    .B(b),
    .EQ(AeqB),
    .GT(AgtB),
    .LT(AltB)
  );

  // Enable VCD dump for GTKWave or any VCD viewer
  initial begin
    $dumpfile("comparator_16_bit_tb.vcd");
    $dumpvars(0, comparator_16_bit_tb);
  end

  // Task to apply a test vector and verify output
  task run_test;
    input [15:0] in_a, in_b;
    input expected_eq, expected_gt, expected_lt;
    begin
      a = in_a;
      b = in_b;
      exp_eq = expected_eq;
      exp_gt = expected_gt;
      exp_lt = expected_lt;
      #10;
      $display("a = %h, b = %h => AeqB = %b, AgtB = %b, AltB = %b", a, b, AeqB, AgtB, AltB);
      if (AeqB === exp_eq && AgtB === exp_gt && AltB === exp_lt) begin
        $display("Result: PASS\n");
      end else begin
        $display("Result: FAIL (Expected AeqB = %b, AgtB = %b, AltB = %b)\n", exp_eq, exp_gt, exp_lt);
      end
    end
  endtask

  // Apply test vectors and check results
  initial begin
    $display("\nStarting 16-bit Comparator Test\n");

    run_test(16'h0000, 16'h0000, 1, 0, 0);
    run_test(16'hFFFF, 16'h0001, 0, 1, 0);
    run_test(16'h1234, 16'h5678, 0, 0, 1);
    run_test(16'hABCD, 16'hABCD, 1, 0, 0);
    run_test(16'h8000, 16'h7FFF, 0, 1, 0);
    run_test(16'hAAAA, 16'hAAAA, 1, 0, 0);
    run_test(16'h0001, 16'hFFFF, 0, 0, 1);
    run_test(16'h8001, 16'h8000, 0, 1, 0);
    run_test(16'h7FFF, 16'h8000, 0, 0, 1);
    run_test(16'h000F, 16'h000F, 1, 0, 0);
    run_test(16'h0F0F, 16'hF0F0, 0, 0, 1);
    run_test(16'hF0F0, 16'h0F0F, 0, 1, 0);
    run_test(16'h1357, 16'h2468, 0, 0, 1);
    run_test(16'h2468, 16'h1357, 0, 1, 0);
    run_test(16'hAAAA, 16'h5555, 0, 1, 0);
    run_test(16'h5555, 16'hAAAA, 0, 0, 1);
    run_test(16'hDEAD, 16'hBEEF, 0, 1, 0);
    run_test(16'hBEEF, 16'hDEAD, 0, 0, 1);
    run_test(16'hC0DE, 16'hC0DE, 1, 0, 0);
    run_test(16'h0001, 16'h0000, 0, 1, 0);

    $display("\nTest Completed\n");
    $finish;
  end

endmodule
