module Execute_Unit (
    input [31:0] operand1,    // First operand (from register or immediate)
    input [31:0] operand2,    // Second operand (from register or immediate)
    input [2:0] alu_control,  // ALU control signal (e.g., 000 for ADD, 001 for SUB)
    output reg [31:0] alu_result // Result of the ALU operation
);

    // Perform the ALU operation based on the alu_control signal
    always @(*) begin
        case (alu_control)
            3'b000: alu_result = operand1 + operand2;  // ADD
            3'b001: alu_result = operand1 - operand2;  // SUB
            3'b010: alu_result = operand1 & operand2;  // AND
            3'b011: alu_result = operand1 | operand2;  // OR
            3'b100: alu_result = operand1 << operand2; // Shift Left
            3'b101: alu_result = operand1 >> operand2; // Shift Right
            default: alu_result = 32'b0;               // Default case
        endcase
    end

endmodule

