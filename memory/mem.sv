module memory_unit (
    input wire clk,             // Clock signal
    input wire mem_write,       // Write enable signal
    input wire [7:0] address,   // Address of memory location (8-bit for 256 locations)
    input wire [31:0] write_data, // Data to be written into memory
    output reg [31:0] read_data  // Data read from memory
);

    reg [31:0] memory [255:0];  // Memory array: 256 locations, each 32-bit wide

    // Memory read operation
    always @(*) begin
        read_data = memory[address]; // Read memory at the specified address
    end

    // Memory write operation
    always @(posedge clk) begin
        if (mem_write) begin
            memory[address] <= write_data; // Write data into memory at the specified address
        end
    end

endmodule

