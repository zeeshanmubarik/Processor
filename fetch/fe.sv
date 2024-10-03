module Fetch_Unit (
    input clk,                  // Clock signal
    input reset,                // Reset signal
    output [31:0] instruction,  // Current instruction fetched
    output [31:0] pc_out        // Current PC value
);

    reg [31:0] PC;              // Program Counter (PC)
    reg [31:0] Instruction_Memory [0:255];  // Memory storing instructions (256 words)

    // PC Incrementer logic (adds 4 to the PC to point to the next instruction)
    always @(posedge clk or posedge reset) begin
        if (reset)
            PC <= 32'b0;         // Reset PC to 0
        else
            PC <= PC + 4;        // Increment PC by 4 (assuming word-aligned instructions)
    end

    // Fetch the instruction from memory
    assign instruction = Instruction_Memory[PC >> 2];  // PC >> 2 for word-aligned addressing
    assign pc_out = PC;        // Output the current PC value

endmodule

