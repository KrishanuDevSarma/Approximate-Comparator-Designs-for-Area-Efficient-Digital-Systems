// Testbench for 8-bit Approximate Comparator

`timescale 1ns/1ps

module approx_comparator_8_bit_tb;

  // Declare 8-bit input registers for the DUT
  reg [7:0] a, b;

  // Declare output wires to capture the DUT outputs
  wire AeqB, AgtB, AltB;

  // Instantiate the comparator_design
  approx_comparator_8_bit dut (
    .a(a),       // Connect input a
    .b(b),       // Connect input b
    .AeqB(AeqB), // Connect output AeqB (approximate equality)
    .AgtB(AgtB), // Connect output AgtB (approximate greater-than)
    .AltB(AltB)  // Connect output AltB (approximate less-than)
  );

  // Enable waveform dumping for GTKWave or any VCD viewer
  initial begin
    $dumpfile("approx_comparator_8_bit_tb.vcd");  // Specify the VCD file name
    $dumpvars(0, approx_comparator_8_bit_tb);     // Dump all variables in this module
  end


  // Define a task to apply a pair of input values and display the result
  task apply_and_display;
    input [7:0] in_a, in_b; // Task inputs
    begin
      a = in_a;             // Apply input a
      b = in_b;             // Apply input b
      #10;                  // Wait 10 time units for outputs to stabilize

      // Display the results for the given inputs
      $display("a = %b, b = %b => AeqB = %b, AgtB = %b, AltB = %b", 
                a, b, AeqB, AgtB, AltB);
    end
  endtask

  // Main test procedure
  initial begin
    $display("Starting 8-bit Approximate Comparator Test\n");

    // Run several test cases with different values for a and b
    apply_and_display(8'b10101010, 8'b10101010); // Expected: approx equal
    apply_and_display(8'b11110000, 8'b00001111); // Expected: a > b
    apply_and_display(8'b01010101, 8'b10101010); // Expected: a < b
    apply_and_display(8'b11111111, 8'b11110000); // Expected: a > b
    apply_and_display(8'b11001100, 8'b11001100); // Expected: approx equal
    apply_and_display(8'b10000000, 8'b01111111); // Expected: a > b
    apply_and_display(8'b00000001, 8'b00000010); // Expected: a < b

    $display("\nTest Completed");
    $finish; // End the simulation
  end

endmodule
