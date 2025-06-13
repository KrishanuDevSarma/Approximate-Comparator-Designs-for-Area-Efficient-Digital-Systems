// Testbench for 4-bit Approximate Comparator

`timescale 1ns/1ps

module approx_comparator_4_bit_tb;

  // Input registers
  reg [3:0] a, b;

  // Output wires
  wire AeqB, AgtB, AltB;

  // Instantiate the approximate comparator
  approx_comparator_4_bit dut (
    .A(a),
    .B(b),
    .EQ(AeqB),
    .GT(AgtB),
    .LT(AltB)
  );

  // Enable waveform dumping for GTKWave or any VCD viewer
  initial begin
    $dumpfile("approx_comparator_4_bit_tb.vcd");
    $dumpvars(0, approx_comparator_4_bit_tb);
  end

  // Task to apply test vectors
  task apply_inputs;
    input [3:0] in_a, in_b;
    begin
      a = in_a;
      b = in_b;
      #10;
      $display("a = %b, b = %b -> AeqB = %b, AgtB = %b, AltB = %b", a, b, AeqB, AgtB, AltB);
    end
  endtask

  // Apply test vectors
  initial begin
    $display("\nStarting Approximate Comparator 4-bit Test\n");

    apply_inputs(4'b0000, 4'b0000); // Expected approx equal
    apply_inputs(4'b1111, 4'b0000); // Expected approx greater
    apply_inputs(4'b0011, 4'b1011); // Expected approx less
    apply_inputs(4'b1100, 4'b1100); // Expected approx equal
    apply_inputs(4'b1010, 4'b0110); // Expected approx greater
    apply_inputs(4'b0101, 4'b1101); // Expected approx less
    apply_inputs(4'b1000, 4'b1001); // Same MSBs, different LSBs (should be approx equal)

    $display("\nTest Completed\n");
    $finish;
  end

endmodule
