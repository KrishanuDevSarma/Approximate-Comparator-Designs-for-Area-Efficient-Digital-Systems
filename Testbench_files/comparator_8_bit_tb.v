// Testbench for 8-bit Comparator

`timescale 1ns/1ps

module comparator_8_bit_tb;

  // Input registers for test vectors
  reg [7:0] a, b;

  // Output wires for comparator results
  wire AeqB, AgtB, AltB;

  // Instantiate the DUT (Device Under Test)
  comparator_8_bit dut (
    .a(a),
    .b(b),
    .AeqB(AeqB),
    .AgtB(AgtB),
    .AltB(AltB)
  );

  // Enable VCD file generation for waveform viewing
  initial begin
    $dumpfile("comparator_8_bit_tb.vcd");
    $dumpvars(0, comparator_8_bit_tb);
  end

  // Task to apply a test case and display the results
  task apply_test;
    input [7:0] in_a, in_b;
    begin
      a = in_a;
      b = in_b;
      #10;
      $display("a = %b, b = %b => AeqB = %b, AgtB = %b, AltB = %b", a, b, AeqB, AgtB, AltB);
    end
  endtask

  // Main test sequence
  initial begin
    $display("\nStarting 8-bit Comparator Test\n");

    apply_test(8'b00000000, 8'b00000000); // equal
    apply_test(8'b10101010, 8'b01010101); // greater
    apply_test(8'b01010101, 8'b10101010); // less
    apply_test(8'b11111111, 8'b00000001); // greater
    apply_test(8'b00000001, 8'b11111111); // less
    apply_test(8'b10000000, 8'b10000000); // equal
    apply_test(8'b10000001, 8'b10000000); // greater
    apply_test(8'b01111111, 8'b10000000); // less

    $display("\nTest Completed\n");
    $finish;
  end

endmodule
