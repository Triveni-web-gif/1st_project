`timescale 1ns / 1ps

module CLA_4bit_tb;

    reg [3:0] A, B;  
    reg Cin;         
    wire [3:0] Sum;  
    wire Cout;       

    // Instantiate the CLA module
    CLA_4bit uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .Sum(Sum), 
        .Cout(Cout)
    );

    initial begin
        // Display header
        $display("Time |   A    |   B    | Cin |  Sum  | Cout ");
        $display("------------------------------------------------");

        // Apply test cases
        A = 4'b0000; B = 4'b0000; Cin = 0; #10;
        A = 4'b0001; B = 4'b0001; Cin = 0; #10;
        A = 4'b0010; B = 4'b0011; Cin = 0; #10;
        A = 4'b0100; B = 4'b0101; Cin = 0; #10;
        A = 4'b0110; B = 4'b0111; Cin = 0; #10;
        A = 4'b1000; B = 4'b1001; Cin = 1; #10;
        A = 4'b1010; B = 4'b1011; Cin = 0; #10;
        A = 4'b1100; B = 4'b1101; Cin = 1; #10;
        A = 4'b1110; B = 4'b1111; Cin = 0; #10;
        A = 4'b1111; B = 4'b1111; Cin = 1; #10;

        // Finish simulation
        $finish;
    end

    // Monitor output for debugging
    initial begin
        $monitor("%t  | %b | %b |  %b  | %b  |  %b ", 
                 $time, A, B, Cin, Sum, Cout);
    end

endmodule
