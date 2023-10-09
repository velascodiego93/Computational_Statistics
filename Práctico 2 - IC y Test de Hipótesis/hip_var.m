close all
clear all
pkg load statistics

# Generación de datos
datos = [203 229 215 220 223 233 208 228 209];
n = length(datos)
mu = 220
s = std(datos); # Desviación estándar de la muestra
sigma2 = 7.75^2; # Estimador de sigma bajo Ho

# Test de hipótesis para sigma2
# Ho: sigma2 = 7.75^2
# H1: sigma2 > 7.75^2

# TEST UNILATERAL
d = (n-1)*(s^2)/sigma2; # Estadístico del test

# Right-tailed (H1: sigma2 > sigma2_est)
p_value = (1-chi2cdf(d, n-1)) # ChatGPT y help de Octave. Sirve porque N(0,1) es simétrica
alfa = 0.1

if p_value < alfa
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.2f. Ho es rechazada con alfa = %d', p_value, alfa)
else
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.2f. Ho no puede ser rechazada con alfa = %d', p_value, alfa)
end

# Left-tailed (H1: sigma2 < sigma2_est)
p_value = chi2cdf(d, n-1) # ChatGPT y help de Octave. Sirve porque N(0,1) es simétrica

if p_value < alfa
    sprintf('TEST UNILATERAL IZQUIERDO: p-valor = %.2f. Ho es rechazada con alfa = %d', p_value, alfa)
else
    sprintf('TEST UNILATERAL IZQUIERDO: p-valor = %.2f. Ho no puede ser rechazada con alfa = %d', p_value, alfa)
end