# EJERCICIO 2
clc
close all
clear all
pkg load statistics

# Data definition
hombres = [750 397 1134 1503 2859 5834 10821 16962 25074 9217 241];
mujeres = [612 244 420 782 1774 3662 6654 11724 26720 18583 1128];
total = hombres + mujeres;
centros = [[4.5 : 10 : 94.5],100];

# Frequencies
hombres_freq = hombres/sum(hombres);
mujeres_freq = mujeres/sum(mujeres);
total_freq = total/sum(total);

# Create figure
figure;

# Women histogram
subplot(1,3,1); # left plot
bar (centros, mujeres_freq); # histogram
title('Mujeres', 'fontsize', 35) # plot title
ylim([0, max(mujeres_freq)+0.05]) # set limit for y axis
set(gca, 'fontsize', 35) # set axis fontsize
ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
grid

# Men histogram
subplot(1,3,2);
bar (centros, hombres_freq);
title('Hombres', 'fontsize', 35) 
ylim([0, max(hombres_freq)+0.05])
set(gca, 'fontsize', 35) 
ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
grid

# Combined histogram
subplot(1,3,3);
bar (centros, total_freq);
title('Total', 'fontsize', 35) 
ylim([0, max(total_freq)+0.05])
set(gca, 'fontsize', 35) 
ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
grid

# Promedios
hom_prom = mean(hombres)
muj_prom = mean(mujeres)
tot_prom = mean(total)

# Cuartiles 25%
h25 = centros(find(cumsum(hombres_freq)>0.25, 1))
m25 = centros(find(cumsum(mujeres_freq)>0.25, 1))
t25 = centros(find(cumsum(total_freq)>0.25, 1))

# Medianas
h50 = centros(find(cumsum(hombres_freq)>0.50, 1))
m50 = centros(find(cumsum(mujeres_freq)>0.50, 1))
t50 = centros(find(cumsum(total_freq)>0.50, 1))

# Cuartiles 75%
h75 = centros(find(cumsum(hombres_freq)>0.75, 1))
m75 = centros(find(cumsum(mujeres_freq)>0.75, 1))
t75 = centros(find(cumsum(total_freq)>0.75, 1))
