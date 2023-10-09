clc
close all
clear all
pkg load statistics

# Parámetros de entrada
n = 100;
p0 = 0.10; # Valor de p bajo Ho

# Test de hipótesis para Y
# Ho: p = 0.1
# H1: p > 0.1

# TEST UNILATERAL
d = 15; # Cantidad de piezas defectuosas observadas

# Right-tailed (H1: p > p0)
alfa = 0.05;
p_value = 1 - binocdf(d-1, n, p0) # Se usa d-1 porque busco P(d>=15) = 1-P(d<15) = 1-P(d<=14)

if p_value < alfa
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.2f. Ho es rechazada con alfa = %d', p_value, alfa)
else
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.2f. Ho no puede ser rechazada con alfa = %d', p_value, alfa)
end

# Simulación

datos = binornd(n, p0, 50000, 1);

size(find(datos >= 15))(1)/50000
