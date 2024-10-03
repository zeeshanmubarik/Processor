module write_back_unit (
    input wire clk,              // Clock signal
    input wire mem_to_reg,       // Select memory or ALU result
    input wire [4:0] write_reg,   // Register to write back to
    input wire [31:0] alu_result,  // ALU result
    input wire [31:0] mem_data    // Data from memory
);

    reg [31:0] registers [31:0];  // 32 registers, 32-bit each

    // Write back operation
    always @(posedge clk) begin
        if (mem_to_reg) 
            registers[write_reg] <= mem_data;  // Write memory data
        else 
            registers[write_reg] <= alu_result; // Write ALU result
    end

endmodule

