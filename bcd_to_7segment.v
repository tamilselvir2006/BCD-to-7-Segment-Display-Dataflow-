`timescale 1ns/1ps

module bcd_to_7segment (
    input  wire [3:0] bcd,
    output wire [6:0] seg // {g, f, e, d, c, b, a}
);

    // Continuous assignment using conditional operator (No always block)
    assign seg = (bcd == 4'd0) ? 7'b0111111 : // 0
                 (bcd == 4'd1) ? 7'b0000110 : // 1
                 (bcd == 4'd2) ? 7'b1011011 : // 2
                 (bcd == 4'd3) ? 7'b1001111 : // 3
                 (bcd == 4'd4) ? 7'b1100110 : // 4
                 (bcd == 4'd5) ? 7'b1101101 : // 5
                 (bcd == 4'd6) ? 7'b1111101 : // 6
                 (bcd == 4'd7) ? 7'b0000111 : // 7
                 (bcd == 4'd8) ? 7'b1111111 : // 8
                 (bcd == 4'd9) ? 7'b1101111 : // 9
                                 7'b0000000;  // Default / Invalid BCD

endmodule
