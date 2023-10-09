clc
close all
clear all
pkg load statistics

# PARTE a) y b)
datos = poissrnd(3, 10, 15);

# Generación de matriz con valores únicos
datos_unique = {};
num_rows = size(datos)(1);

for i = 1:num_rows
    current_row = datos(i,:);
    unique_values = unique(current_row);
    datos_unique{i} = unique_values;
end

# Generación de matriz con frecuencias
freqs = {};

for i = 1:num_rows
    current_row = datos_unique{i};
    freqs_row = [];

    for j = 1:size(current_row,2)
        freq_j = sum(datos(i,:) == current_row(j));
        freqs_row = [freqs_row, freq_j];
    end
    freqs{i} = freqs_row;
end

# Generación de matriz con F(x)
F = {}
for i = 1:num_rows
    F{i} = log(freqs{i}) + log(factorial(datos_unique{i}));
end

# Ploteo
colors = {'r', 'g', 'b', 'c', 'm', 'y', 'k', 'd', 'p', 'o'};
for i = 1:num_rows
    subplot(2,5,i)
    scatter(datos_unique{i}, F{i}, colors{i}, 'filled');
    ylabel('F(x) = log(fobs) + log(x!)', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
    xlabel('x', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
    title('Verificacion de dist. de Poisson', 'fontsize', 35) # plot title
    set(gca, 'fontsize', 35) # set axis fontsize
    grid on
    hold on
end

hold off

# ------------------------------------------------------------------------------------------------

# PARTE c) y d)
datos = poissrnd(3, 100, 30);
medias = mean(datos,2);

figure
hist(medias, 20)
title('Histograma de medias', 'fontsize', 35) # plot title
ylim([0, 20]) # set limit for y axis
set(gca, 'fontsize', 35) # set axis fontsize
ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
xlabel('Medias', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
grid

# ------------------------------------------------------------------------------------------------

# PARTE e)
counter = 1;
for n = [1000,5000,10000,25000]
    datos = poissrnd(3, n, 30);
    medias = mean(datos,2);

    subplot(2,2,counter)
    hist(medias, floor(sqrt(n)))
    tit = sprintf('Histograma de medias - n = %d',n);
    title(tit, 'fontsize', 35) # plot title
    #ylim([0, 8*sqrt(n)]) # set limit for y axis
    set(gca, 'fontsize', 35) # set axis fontsize
    ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
    xlabel('Medias', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
    grid
    var(medias)
    mean(medias)
    counter = counter + 1
end

