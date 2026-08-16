module instr_mem #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 10,
    parameter MEM_DEPTH = (1 << ADDR_WIDTH)
)(
    input [ADDR_WIDTH-1:0] A,
    output reg [DATA_WIDTH-1:0] RD
    );

    reg [DATA_WIDTH-1:0] mem[0:MEM_DEPTH-1];

    always @(*) begin
        RD = mem[A];
    end
endmodule