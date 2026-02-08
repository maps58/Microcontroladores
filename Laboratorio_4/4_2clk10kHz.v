//////////////////////////////////////////////////////////////////////////////////
// Miguel Angel Pérez Solano
// Instituto Tecnologico de Oaxaca
// Departamento de Ingeniería Electrónica y Electrónica
// Design Name: Circuitos Secuenciales
// Module Name: clk10kHz

module clk10kHz (

    input clk100MHz,      
    input rst,      
    output reg clk_out   
);
    // Asi pues el Contador será de 14 bits
    reg [13:0] count = 0; 

    always @(posedge clk100MHz, posedge rst) begin
        if (rst == 1'b1) begin
            count <= 0;
            clk_out <= 0;
        end 
        else begin
            if (count == 4999) begin
                count <= 0;         // Reset del contador en active alto
                clk_out <= ~clk_out; // Togglear el clk de salida.
            end 
            else 
                count <= count + 1; // Incrementa el contador
             end
    end
endmodule
