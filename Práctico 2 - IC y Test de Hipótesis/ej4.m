clc
close all
clear all
pkg load statistics

# Generación de datos
datos = [7.24 1.91 1.58 3.81 5.36 2.37 1.86 1.63 3.26 1.91 3.96 1.54];
n = length(datos);
mu0 = 4; # Valor de mu bajo Ho
medias = mean(datos,2);
sigma = 2; # Valor de sigma conocido

# Test de hipótesis para mu
# Ho: mu = 4
# H1: mu < 4

# TEST UNILATERAL
d = sqrt(n)*((medias-mu0)/sigma); # Estadístico del test

# Right-tailed (H1: mu > mu0)
alfa = 0.05;
p_value = 1-normcdf(d)

if p_value < alfa
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.2f. Ho es rechazada con alfa = %d', p_value, alfa)
else
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.2f. Ho no puede ser rechazada con alfa = %d', p_value, alfa)
end

# Left-tailed (H1: mu < mu0)
p_value = normcdf(d)

if p_value < alfa
    sprintf('TEST UNILATERAL IZQUIERDO: p-valor = %.2f. Ho es rechazada con alfa = %d', p_value, alfa)
else
    sprintf('TEST UNILATERAL IZQUIERDO: p-valor = %.2f. Ho no puede ser rechazada con alfa = %d', p_value, alfa)
end

# Por simulacion
muestras = normrnd(mu0, sigma, 100000, n);

media_muestras = mean(muestras, 2);

size(find(media_muestras < medias ))(1)/100000