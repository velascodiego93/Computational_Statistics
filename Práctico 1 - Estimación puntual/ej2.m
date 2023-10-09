clc
close all
clear all
pkg load statistics

# PARTE a)

# Generación y ordenamiento de datos
datos = exprnd(1/2, 10, 25);
datos_sorted = sort(datos,2);

# Generación de intervalos y frecuencias
datos_centros = []
datos_freqs = []
for i = 1:size(datos_sorted,1)
    # Intervalos
    minim = 0;
    maxim = ceil(max(datos_sorted(i,:))/1)*1; # Aproximación a múltiplo de 1
    interval_length = (maxim - minim)/5;
    centros = [minim+interval_length/2,minim+3*interval_length/2,minim+5*interval_length/2,minim+7*interval_length/2,minim+9*interval_length/2];
    datos_centros = [datos_centros; centros];

    # Frecuencias
    freqs_row = [];
    for j = 1:size(centros,2)
        freq_centro = sum(datos_sorted(i,:) >= centros(j)-interval_length/2 & datos_sorted(i,:) < centros(j)+interval_length/2);
        freqs_row = [freqs_row, freq_centro];
    end
    datos_freqs = [datos_freqs; freqs_row];
end

# ------------------------------------------------------------------------------------------------

# PARTE b)
F = []
for i = 1:size(datos_centros,1)
    F_x = [];
    for j = 1:size(datos_centros,2)
        F_j = log(datos_freqs(i,j)) - log(25);
        F_x = [F_x, F_j];
    end
    F = [F; F_x];
end

# Ploteo
colors = {'r', 'g', 'b', 'c', 'm', 'y', 'k', 'd', 'p', 'o'};
for i = 1:(size(datos_sorted,1)-0)
    subplot(2,5,i)
    scatter(datos_centros(i,:), F(i,:), colors{i}, 'filled');
    ylabel('F(x) = log(fobs) - log(n)', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
    xlabel('x', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
    title('Verificacion de dist. Exponencial', 'fontsize', 35) # plot title
    set(gca, 'fontsize', 35) # set axis fontsize
    grid on
    hold on
end

# ------------------------------------------------------------------------------------------------

# PARTE c), d) y e)
figure
counter = 1;
for n = [100,1000,5000,10000]
    datos = exprnd(1/2, n, 40);
    medias = mean(datos,2);

    subplot(2,2,counter)
    hist(medias, floor(sqrt(n)))
    tit = sprintf('Histograma de medias - n = %d',n);
    title(tit, 'fontsize', 35) # plot title
    #ylim([0, 5*sqrt(n)]) # set limit for y axis
    set(gca, 'fontsize', 35) # set axis fontsize
    ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
    xlabel('Medias', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
    grid
    var(medias)
    mean(medias)
    counter = counter + 1;
end
