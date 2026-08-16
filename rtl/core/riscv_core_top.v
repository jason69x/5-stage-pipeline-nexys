module riscv_core_top(
    input CLK, RST
    );
    
    //if_stage
    wire [31:0] pc_next, instr;
    
    if_stage fetch(.clk(CLK), .pc_next(pc_next), .instr(instr));
endmodule
