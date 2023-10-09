clc
close all
clear all
pkg load statistics

# Parámetros de entrada
mu = 5; # Valor asumido como Ho
sigma = 1;
n = 16; # Tamaño de muestra
cant_muestras = 1;

# Generación de datos
datos = normrnd(mu,sigma, cant_muestras, n);
medias = mean(datos,2);

# Test de hipótesis para mu

# TEST BILATERAL
alfa = 0.10;
d = sqrt(n)*((medias-mu)/sigma) # Estadístico del test

p1 = normcdf(d);
p2 = normcdf(-d);

p_value = 1-(max(p1,p2)-min(p1,p2)) # Manera intuitiva por mi
p_val = 2*(1-normcdf(abs(d))) # ChatGPT y help de Octave. Sirve porque N(0,1) es simétrica
[H, pval] = ztest(datos, mu, sigma) # Función nativa de Octave

if p_val < alfa
    sprintf('TEST BILATERAL: p-valor = %.2f. Ho es rechazada con alfa = %d', p_value, alfa)
else
    sprintf('TEST BILATERAL: p-valor = %.2f. Ho no puede ser rechazada con alfa = %d', p_value, alfa)
end

# TEST UNILATERAL
d = sqrt(n)*((medias-mu)/sigma); # Estadístico del test

# Right-tailed (H1: mu > mu0)
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
muestras = normrnd(mu, sigma, 100000, n);

media_muestras = mean(muestras, 2);

size(find(media_muestras > medias ))(1)/100000

size(find(media_muestras < medias ))(1)/100000