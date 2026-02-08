`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Miguel Angel Pérez Solano
// Instituto Tecnologico de Oaxaca
// Departamento de Ingeniería Electrónica y Electrónica
// Design Name: Circuitos Secuenciales
// Module Name: clk1Hz

module clk1Hz (
    input clk100MHz,      
    input rst,      
    output reg clk_out   
);
    // El Contador será de 26 bits
    reg [25:0] count = 0; 

    always @(posedge clk100MHz, posedge rst) begin
        if (rst == 1'b1) begin
            count <= 0;
            clk_out <= 0;
        end 
        else begin
            if (count == 49_999_999) begin
                count <= 0;  // Reset del contador en active alto
                clk_out <= ~clk_out; // Togglear el clk de salida.
            end 
            else 
                count <= count + 1; // Incrementa el contador
             end
    end
endmodule
