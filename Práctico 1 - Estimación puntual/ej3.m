clc
close all
clear all
pkg load statistics

# PARTE a) y b)

# Generación, ordenamiento de datos y redondeo
datos = normrnd(0,1, 10, 20);
datos_sorted = round(sort(datos,2)); # redondeo a entero más cercano

# Generación de matriz con valores únicos
datos_unique = {};
num_rows = size(datos_sorted,1);

for i = 1:num_rows
    current_row = datos_sorted(i,:);
    unique_values = unique(current_row);
    datos_unique{i} = unique_values;
end

# Generación de matriz con frecuencias
freqs = {};

for i = 1:num_rows
    current_row = datos_unique{i};
    freqs_row = [];

    for j = 1:size(current_row,2)
        freq_j = sum(datos_sorted(i,:) == current_row(j));
        freqs_row = [freqs_row, freq_j];
    end
    freqs{i} = freqs_row;
end

# Generación de matriz con F(x)
F = {}
for i = 1:num_rows
    F{i} = log(freqs{i}) - log(20) + log(sqrt(2*pi));
end

# Ploteo
colors = {'r', 'g', 'b', 'c', 'm', 'y', 'k', 'd', 'p', 'o'};
for i = 1:num_rows
    subplot(2,5,i)
    scatter(datos_unique{i}, F{i}, colors{i}, 'filled');
    ylabel('F(x) = log(fobs) + -log(n) + log(raiz(pi))', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
    xlabel('x', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
    title('Verificacion de dist. Normal', 'fontsize', 35) # plot title
    set(gca, 'fontsize', 35) # set axis fontsize
    grid on
    hold on
end

hold off

# ------------------------------------------------------------------------------------------------

# PARTE b), c) y d)

# Estimadores
counter = 1;
n = 40;
for cant_muestras = [100,1000,5000,10000]
    datos = normrnd(0,1, cant_muestras, n);
    medias = mean(datos,2); # Estimador de mu
    sigma_EMV = sqrt(var(datos,0,2)); # Estimador de sigma2 (EMV)
    sigma_MOM = mean(datos.^2,2) - medias.^2; # Estimador de sigma2 (MOMENTOS)

    mean(medias)
    var(medias)
    
    # Histograma de mu (EMV y Momentos)
    figure(2)
    subplot(2,2,counter)
    hist(medias, floor(sqrt(cant_muestras)))
    tit = sprintf('Histograma de medias - n = %d',cant_muestras);
    title(tit, 'fontsize', 35) # plot title
    #ylim([0, 5*sqrt()]) # set limit for y axis
    set(gca, 'fontsize', 35) # set axis fontsize
    ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
    xlabel('Medias', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
    grid

    # Histograma de sigma2 (EMV)
    figure(3)
    subplot(2,2,counter)
    hist(sigma_EMV, floor(sqrt(cant_muestras)))
    tit = sprintf('Histograma de sigma (EMV) - n = %d',cant_muestras);
    title(tit, 'fontsize', 35) # plot title
    #ylim([0, 5*sqrt(n)]) # set limit for y axis
    set(gca, 'fontsize', 35) # set axis fontsize
    ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
    xlabel('Sigma2', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
    grid

    # Histograma de sigma2 (EMV)
    figure(4)
    subplot(2,2,counter)
    hist(sigma_MOM, floor(sqrt(cant_muestras)))
    tit = sprintf('Histograma de sigma (MOMENTOS) - n = %d',cant_muestras);
    title(tit, 'fontsize', 35) # plot title
    #ylim([0, 5*sqrt(n)]) # set limit for y axis
    set(gca, 'fontsize', 35) # set axis fontsize
    ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
    xlabel('Sigma2', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
    grid
    
    counter = counter + 1;
end


