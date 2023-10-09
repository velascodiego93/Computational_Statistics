# EJERCICIO 4
clc
close all
clear all
pkg load statistics

# Data definition
hombres = [95 25 8 20 35 42 14 35 55 10 0 14 25 54 26 55 52 58 15 4];
mujeres = [5 150 15 5 80 5 8 10 20 38 10 135 4 0 39 15 45 38 8 12];
comb = [hombres,mujeres];

# Diagrama de tallo y hojas
stemleaf(sort(hombres), 'Hombres')
stemleaf(sort(mujeres), 'Mujeres')
stemleaf(sort(comb), 'Combinados')

# Promedio y mediana
promedio = mean(comb)
mediana = median(comb)

# Create figure
figure;

# Boxplot
boxplot (comb); # left boxplot
title('Datos combinados', 'fontsize', 35) # plot title
xlim([0 2]) # set limit for x axis
ylim([min(comb)-10,max(comb)+25]) # set limit for y axis
set(gca, 'fontsize', 35) # set axis fontsize
ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
grid

hold on;
line([0,1], [mediana, mediana])
