module data_mem #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 10,
    parameter MEM_DEPTH = (1 << ADDR_WIDTH)
)(
    input CLK, WE,
    
    //from execute stage
    input [ADDR_WIDTH-1:0] A,
    input [DATA_WIDTH-1:0] WD,
    
    //to write_back stage
    output reg [DATA_WIDTH-1:0] RD
    );
    
    //memory
    reg [DATA_WIDTH-1:0] mem[0:MEM_DEPTH-1];
    
    always @(posedge CLK) begin
        //if WRITE ENABLE is 1, put data in addr, else read from addr
        if(WE) mem[A] <= WD;
        else RD <= mem[A];
    end
endmodule
