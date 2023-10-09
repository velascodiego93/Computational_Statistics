clc
close all
clear all
pkg load statistics

# Parámetros de entrada
media = 2.266; # media muestral
sigma = 1.935; # desviación estándar poblacional
n = 50; # Tamaño de muestra

# Intervalo de confianza
alfa = 0.05;
z_al = norminv(1-alfa/2, 0, 1);
int_min = media - z_al*sigma/sqrt(n);
int_max = media + z_al*sigma/sqrt(n);

intervalo = horzcat(int_min, int_max)
