clc
close all
clear all
pkg load statistics

# Parámetros de entrada
n = 200;
sum_xi = 928.68;
sum_xi2 = 5726.77;

# Cálculos auxiliares
media = sum_xi / n;
sigma_n = sqrt(media^2 - (2*media/n)*sum_xi + sum_xi2/n);

# Intervalo de confianza
alfa = 0.05;

z_al = norminv(1-alfa/2, 0, 1);

int_min = media - z_al*sigma_n/sqrt(n);
int_max = media + z_al*sigma_n/sqrt(n);

intervalo = horzcat(int_min, int_max)

# CUENTAS DE RESOLUCION PROFESOR
sigma_nn = sqrt((1/n)*sum_xi2 - media^2);

int_minn = media - z_al*sigma_nn/sqrt(200);
int_maxx = media + z_al*sigma_nn/sqrt(200);

intervaloo = horzcat(int_minn, int_maxx)


