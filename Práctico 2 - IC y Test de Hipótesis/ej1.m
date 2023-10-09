clc
close all
clear all
pkg load statistics

# PARTE 1

# Parámetros de entrada
media = 2.25; # media muestral
sigma = 0.15; # desviación estándar poblacional
n = 36; # Tamaño de muestra

# Intervalo de confianza
alfa = 0.05;
z_al = norminv(1-alfa/2, 0, 1);
int_min = media - z_al*sigma/sqrt(n);
int_max = media + z_al*sigma/sqrt(n);

intervalo = horzcat(int_min, int_max)

# PARTE 2
dif_max = 0.03;

n_muestra = round((z_al*sigma/dif_max)^2)

# Verificación
int_min = media - z_al*sigma/sqrt(n_muestra);
int_max = media + z_al*sigma/sqrt(n_muestra);

intervalo = horzcat(int_min, int_max)