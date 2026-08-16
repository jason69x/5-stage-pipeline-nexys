module regfile (
    input CLK, WE3,
    input [4:0] A1, A2, A3,
    input [31:0] RD1, RD2, WD3
);

    reg [31:0] REG_FILE[0:31];

    always @(posedge CLK) begin
        if(WE3) REG_FILE[A3] <= WD3;      
    end

endmodule
