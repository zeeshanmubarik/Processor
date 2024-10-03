module Decode_Unit (
    input [31:0] instruction,  // 32-bit instruction input
    output [5:0] opcode,       // Operation code (bits 31-26)
    output [4:0] rs,           // Source register 1 (bits 25-21)
    output [4:0] rt,           // Source register 2 (bits 20-16)
    output [4:0] rd,           // Destination register (bits 15-11 for R-type)
    output [15:0] imm          // Immediate value (bits 15-0 for I-type)
);

    // Extract fields from the instruction
    assign opcode = instruction[31:26];  // Get opcode
    assign rs     = instruction[25:21];  // Get source register 1
    assign rt     = instruction[20:16];  // Get source register 2
    assign rd     = instruction[15:11];  // Get destination register (R-type)
    assign imm    = instruction[15:0];   // Get immediate value (I-type)

endmodule

