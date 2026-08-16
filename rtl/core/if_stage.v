module if_stage(
    input clk,
    input [31:0] pc_next,
    output [31:0] instr
    );
    
    reg [31:0] pc;
    
    always @(posedge clk) begin
        pc <= pc_next;
    end
    
    instr_mem imem(.clk(clK),.pc(pc),.RD(instr));
    
endmodule