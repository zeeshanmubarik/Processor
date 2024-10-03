module register_file (
    input wire clk,               // Clock signal
    input wire reg_write,         // Write enable
    input wire [4:0] read_reg1,   // Register address 1
    input wire [4:0] read_reg2,   // Register address 2
    input wire [4:0] write_reg,    // Register address to write
    input wire [31:0] write_data,  // Data to write
    output reg [31:0] read_data1,  // Data read from reg1
    output reg [31:0] read_data2   // Data read from reg2
);

    reg [31:0] registers [31:0];   // 32 registers, 32-bit each

    // Read registers
    always @(*) begin
        read_data1 = registers[read_reg1];
        read_data2 = registers[read_reg2];
    end

    // Write to register
    always @(posedge clk) begin
        if (reg_write) 
            registers[write_reg] <= write_data; // Write data if reg_write is high
    end

endmodule

