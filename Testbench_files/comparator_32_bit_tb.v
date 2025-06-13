`timescale 1ns / 1ps

// Testbench for 32-bit comparator module
module comparator_32_bit_tb;

  // Inputs to the comparator
  reg [31:0] A, B;
  // Outputs from the comparator
  wire EQ, GT, LT;

  // Instantiate the Unit Under Test (UUT)
  comparator_32_bit uut (
    .A(A),
    .B(B),
    .EQ(EQ),
    .GT(GT),
    .LT(LT)
  );

  // Dump waveform for GTKWave or any VCD viewer
  initial begin
    $dumpfile("comparator_32_bit_tb.vcd");
    $dumpvars(0, comparator_32_bit_tb);
  end

  // Task for automated result checking
  task check_result;
    input [31:0] a_in, b_in;
    input expected_eq, expected_gt, expected_lt;
    begin
      A = a_in;
      B = b_in;
      #10; // Wait for output to settle
      if (EQ !== expected_eq || GT !== expected_gt || LT !== expected_lt) begin
        $display("❌ Test Failed: A = %h, B = %h | Expected -> EQ=%b GT=%b LT=%b | Got -> EQ=%b GT=%b LT=%b",
                 A, B, expected_eq, expected_gt, expected_lt, EQ, GT, LT);
      end else begin
        $display("✅ Test Passed: A = %h, B = %h", A, B);
      end
    end
  endtask

  // Run test cases
  initial begin
    // Test case 1: A == B
    check_result(32'h00000000, 32'h00000000, 1, 0, 0);

    // Test case 2: A < B
    check_result(32'h00000008, 32'h80000000, 0, 0, 1);

    // Test case 3: A > B
    check_result(32'h80000000, 32'h00000008, 0, 1, 0);

    // Test case 4: A == B
    check_result(32'h80000008, 32'h80000008, 1, 0, 0);

    // Test case 5: A < B
    check_result(32'h80000008, 32'h80008000, 0, 0, 1);

    // Test case 6: A > B
    check_result(32'hC0000008, 32'h80008000, 0, 1, 0);

    // Test case 7: A > B
    check_result(32'hB3849008, 32'h82090000, 0, 1, 0);

    // Test case 8: A < B
    check_result(32'h80000008, 32'h8D000000, 0, 0, 1);

    // Test case 9: A < B
    check_result(32'h80000008, 32'h80B00000, 0, 0, 1);

    // Test case 10: A == B
    check_result(32'hF2090808, 32'hF2090808, 1, 0, 0);

    // Test case 11: A > B
    check_result(32'h98000808, 32'h82000000, 0, 1, 0);

    // Test case 12: A < B
    check_result(32'h80000008, 32'hE0000000, 0, 0, 1);

    $display("✅ All test cases completed.");
    $finish;
  end

endmodule
