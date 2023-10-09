clc
close all
clear all
pkg load statistics

# Generación de datos
datos = [101.99 106.64 103.36 109.54 103.99 107.32 106.55 103.7 100.57 105.85];
n = length(datos);
mu0 = 104; # Valor de mu bajo Ho
medias = mean(datos,2);
sigma = 2.5; # Valor de sigma conocido

# Test de hipótesis para mu
# Ho: mu = 104
# H1: mu > 104

# TEST UNILATERAL
d = sqrt(n)*((medias-mu0)/sigma); # Estadístico del test
alfa = 0.05;

# Right-tailed (H1: mu > mu0)
p_value = (1-normcdf(d)) 

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

# Resumen: Ho no es rechazada cuando H1: mu > mu0, porque es más probable
# que mu = mu0 antes que mu > mu0, pero si cuando H1: mu < mu0, Ho es
# rechazada porque es mucho más probable que sea mu < mu0 antes que
# mu = mu0.

# Por simulacion
muestras = normrnd(mu0, sigma, 100000, n);

media_muestras = mean(muestras, 2);

size(find(media_muestras > medias ))(1)/100000