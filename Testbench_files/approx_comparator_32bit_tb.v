`timescale 1ns / 1ps

module approx_comparator_32_bit_tb;

  reg [31:0] A, B;
  reg EQ, GT, LT;

 

  // Clock generation
  reg clk = 0;
  always #5 clk = ~clk;

  // Test input vectors
  initial begin
    // Test case 1 (A = B)
    A = 32'b0000000000000000;
    B = 32'b0000000000000000;
    assign EQ = 1'b1;
    assign GT = 1'b0;
    assign LT = 1'b0;
    #10;
    
    // Test case 2 (A < B)
    A = 32'b0000000000001000;
    B = 32'b1000000000000000;
    assign EQ = 1'b0;
    assign GT = 1'b0;
    assign LT = 1'b1;
    #10;

    // Test case 3 (A > B)
    A = 32'b1000000000000000;
    B = 32'b0000000000001000;
    assign EQ = 1'b0;
    assign GT = 1'b1;
    assign LT = 1'b0;
    #10;
    
    // Test case 4 (A = B)
    A = 32'b1000000000001000;
    B = 32'b1000000000001000;
    assign EQ = 1'b1;
    assign GT = 1'b0;
    assign LT = 1'b0;
    #10;
    
    // Test case 5 (A < B)
    A = 32'b1000000000001000;
    B = 32'b1000001000000000;
    assign EQ = 1'b0;
    assign GT = 1'b0;
    assign LT = 1'b1;
    #10;

 // Test case 6 (A > B)
    A = 32'b1100000000001000;
    B = 32'b1000001000000000;
    assign EQ = 1'b0;
    assign GT = 1'b1;
    assign LT = 1'b0;
    #10;
    
    // Test case 7 (A > B)
    A = 32'b1011100001001000;
    B = 32'b1000001001000000;
    assign EQ = 1'b0;
    assign GT = 1'b1;
    assign LT = 1'b0;
    #10;
    
    // Test case 8 (A < B)
    A = 32'b1000000000001000;
    B = 32'b1001101000000000;
    assign EQ = 1'b0;
    assign GT = 1'b0;
    assign LT = 1'b1;
    #10;
    
    // Test case 9 (A < B)
    A = 32'b1000000000001000;
    B = 32'b1000001011000000;
    assign EQ = 1'b0;
    assign GT = 1'b0;
    assign LT = 1'b1;
    #10;
    
    // Test case 10 (A = B)
    A = 32'b1111001000001000;
    B = 32'b1111001000001000;
    assign EQ = 1'b1;
    assign GT = 1'b0;
    assign LT = 1'b0;
    #10;
    
    // Test case 11 (A > B)
    A = 32'b1001100000001000;
    B = 32'b1000001000000000;
    assign EQ = 1'b0;
    assign GT = 1'b1;
    assign LT = 1'b0;
    #10;
    
    // Test case 12 (A < B)
    A = 32'b1000000000001000;
    B = 32'b1110001000000000;
    assign EQ = 1'b0;
    assign GT = 1'b0;
    assign LT = 1'b1;
    #10;
    
    // Test case 13 (A < B)
    A = 32'b1000000000001000;
    B = 32'b1000001111000000;
    assign EQ = 1'b0;
    assign GT = 1'b0;
    assign LT = 1'b1;
    #10;
    
    // Test case 14 (A = B)
    A = 32'b1000000111000000;
    B = 32'b1000000111000000;
    assign EQ = 1'b1;
    assign GT = 1'b0;
    assign LT = 1'b0;
    #10;
    
    // Test case 15 (A < B)
    A = 32'b1000000000001000;
    B = 32'b1000001111000000;
    assign EQ = 1'b0;
    assign GT = 1'b0;
    assign LT = 1'b1;
    #10;
    
    // Test case 16 (A = B)
    A = 32'b1001001000000000;
    B = 32'b1001001000000000;
    assign EQ = 1'b1;
    assign GT = 1'b0;
    assign LT = 1'b0;
    #10; 
    
    // Test case 17 (A > B)
    A = 32'b1000001110001000;
    B = 32'b1000001000000000;
    assign EQ = 1'b0;
    assign GT = 1'b1;
    assign LT = 1'b0;
    #10;
    
     // Test case 18 (A < B)
    A = 32'b1000000000001000;
    B = 32'b1000001010101000;
    assign EQ = 1'b0;
    assign GT = 1'b0;
    assign LT = 1'b1;
    #10;
    
    // Test case 19 (A < B)
    A = 32'b1000000000001000;
    B = 32'b1000001000000000;
    assign EQ = 1'b0;
    assign GT = 1'b0;
    assign LT = 1'b1;
    #10;
    
    // Test case 20 (A = B)
    A = 32'b1101010110001000;
    B = 32'b1100010110000000;
    assign EQ = 1'b1;
    assign GT = 1'b0;
    assign LT = 1'b0;
    #10;
    // Add more test cases as needed

    // End simulation
    $finish;
  end

endmodule
