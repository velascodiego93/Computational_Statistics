clc
close all
clear all
pkg load statistics

# Generación de datos
datos = [26.7964 17.4528 26.1574 38.6935 28.0100 36.2080 20.3004 34.5870 37.5912 23.8766 28.1384 48.5347 8.4779 21.7938 28.2164 37.5639 31.1565 31.3047 17.7121 20.0819 28.7006 1.4869 1.7976 25.8220 26.0392];
n = length(datos);
mu0 = 23; # Valor de mu bajo Ho
medias = mean(datos,2);
sigma = 10; # Valor de sigma conocido

# Test de hipótesis para mu
# Ho: mu = 23
# H1: mu > 23

# TEST UNILATERAL
d = sqrt(n)*((medias-mu0)/sigma); # Estadístico del test

# Right-tailed (H1: mu > mu0)
alfa1 = 0.10;
alfa2 = 0.05;
p_value = (1-normcdf(d)) 

# Resultado con alfa = 0.10
if p_value < alfa1
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.4f. Ho es rechazada con alfa = %d', p_value, alfa1)
else
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.4f. Ho no puede ser rechazada con alfa = %d', p_value, alfa1)
end

# Resultado con alfa = 0.05
if p_value < alfa2
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.4f. Ho es rechazada con alfa = %d', p_value, alfa2)
else
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.4f. Ho no puede ser rechazada con alfa = %d', p_value, alfa2)
end

# Resumen
# Ho es rechazada con alfa = 0.10
# Ho no es rechazada con alfa = 0.05

# Por simulacion
cant_muestras = 1000000;
muestras = normrnd(mu0, sigma, cant_muestras, n);

media_muestras = mean(muestras, 2);

pseudo_p_val = size(find(media_muestras >= medias ))(1)/cant_muestras

# Resultado con alfa = 0.10
if pseudo_p_val < alfa1
    sprintf('TEST SIMULADO: pseudo p-valor = %.4f. Ho es rechazada con alfa = %d', pseudo_p_val, alfa1)
else
    sprintf('TEST SIMULADO: pseudo p-valor = %.4f. Ho no puede ser rechazada con alfa = %d', pseudo_p_val, alfa1)
end

# Resultado con alfa = 0.05
if pseudo_p_val < alfa2
    sprintf('TEST SIMULADO: pseudo p-valor = %.4f. Ho es rechazada con alfa = %d', pseudo_p_val, alfa2)
else
    sprintf('TEST SIMULADO: pseudo p-valor = %.4f. Ho no puede ser rechazada con alfa = %d', pseudo_p_val, alfa2)
end

# Resumen simulación:
# Se obtiene un p-valor muy cercano al teórico
# Ho es rechazada con alfa = 0.10
# Ho no es rechazada con alfa = 0.05