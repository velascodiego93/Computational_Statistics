clc
close all
clear all
pkg load statistics

# Generación de datos
datos = [5.670 5.432 6.435 3.922 4.459 5.351 5.428 4.401 4.968 5.046 6.992 5.066 2.916 6.017 5.435 3.891];
n = length(datos);
mu0 = 4; # Valor de mu bajo Ho
medias = mean(datos,2);
sigma = 1; # Valor de sigma conocido

# Test de hipótesis para mu
# Ho: mu = 5
# H1: mu != 5
d = sqrt(n)*((medias-mu0)/sigma); # Estadístico del test

# TEST BILATERAL
alfa = 0.05;
p1 = normcdf(d);
p2 = normcdf(-d);

p_value = 1-(max(p1,p2)-min(p1,p2))
[H pval] = ztest(datos, mu0, sigma) 

if p_value < alfa
    sprintf('TEST BILATERAL: p-valor = %.2f. Ho es rechazada con alfa = %d', p_value, alfa)
else
    sprintf('TEST BILATERAL: p-valor = %.2f. Ho no puede ser rechazada con alfa = %d', p_value, alfa)
end

# TEST UNILATERAL

# Right-tailed (H1: mu > mu0)
p_value = 1 - normcdf(d) 

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
