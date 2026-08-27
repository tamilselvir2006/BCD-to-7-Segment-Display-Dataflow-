`timescale 1ns/1ps

module tb_bcd_to_7segment;

    reg  [3:0] bcd;
    wire [6:0] seg;
    integer i;

    bcd_to_7segment dut (
        .bcd(bcd),
        .seg(seg)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_bcd_to_7segment);

        $monitor("Time=%0t | BCD = %0d (%b) | 7-Segment {g,f,e,d,c,b,a} = %b",
                 $time, bcd, bcd, seg);

        // Verify all 10 valid BCD digits (0000 to 1001)
        for (i = 0; i < 10; i = i + 1) begin
            bcd = i[3:0];
            #10;
        end

        #10 $finish;
    end

endmodule
