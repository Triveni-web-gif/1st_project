// Code your testbench here
// or browse Examples
module tb_ripple_carry_adder;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    // Instantiate the RCA
    ripple_carry_adder rca (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Dump waveforms
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_ripple_carry_adder);

        // Apply test vectors
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        a = 4'b0001; b = 4'b0010; cin = 0; #10;
        a = 4'b0011; b = 4'b0101; cin = 0; #10;
        a = 4'b0110; b = 4'b1001; cin = 0; #10;
        a = 4'b1111; b = 4'b1111; cin = 0; #10;

        // End simulation
        $finish;
    end
endmodule
