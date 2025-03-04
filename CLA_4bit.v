module CLA_4bit (
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire [3:0] P, G, C;

    // Generate (G) and Propagate (P) signals
    assign G = A & B;  // Generate Carry (AND operation)
    assign P = A ^ B;  // Propagate Carry (XOR operation)

    // Carry Look-Ahead Logic
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);

    // Sum Calculation
    assign Sum = P ^ C[3:0];

    // Final Carry Output
    assign Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);

endmodule
