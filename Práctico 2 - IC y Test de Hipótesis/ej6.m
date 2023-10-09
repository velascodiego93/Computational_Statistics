clc
close all
clear all
pkg load statistics

# Parámetros de entrada
n = 400;
n_enf = 165;

# Estimador de p.
# Dado que se tiene 400 muestras de una VA Bernoulli Ber(p), 
# el EMV de p es directamente n_enf/400, es decir, el promedio.
p_EMV = n_enf/n;

# Intervalo de confianza
n_no_enf = n - n_enf;

sigma_n = sqrt((1/n)*(n_no_enf*(p_EMV^2) + n_enf*((p_EMV-1)^2)))
sqrt(p_EMV*(1-p_EMV))

alfa = 0.05;
z_al = norminv(1-alfa/2, 0, 1);
int_min = p_EMV - z_al*sigma_n/sqrt(n);
int_max = p_EMV + z_al*sigma_n/sqrt(n);

intervalo = horzcat(int_min, int_max)

# Parámetros de entrada
p0 = 0.40; # Valor de p bajo Ho

# Test de hipótesis para Y
# Ho: p = 0.4
# H1: p > 0.4

# TEST UNILATERAL
d = 165; # Cantidad de personas enfermas encontradas
alfa = 0.05;

p_value = 1 - binocdf(d-1, n, p0) # Se usa d-1 porque busco P(d>=165) = 1-P(d<165) = 1-P(d<=164)

if p_value < alfa
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.2f. Ho es rechazada con alfa = %d', p_value, alfa)
else
    sprintf('TEST UNILATERAL DERECHO: p-valor = %.2f. Ho no puede ser rechazada con alfa = %d', p_value, alfa)
end

# Simulación

cant_muestras = 1000000
datos = binornd(n, p0, cant_muestras, 1);

size(find(datos >= d))(1)/cant_muestras