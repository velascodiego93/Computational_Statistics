clc
close all
clear all
pkg load statistics

n = 35;
counter = 1;
for cant_muestras = [100,1000,5000,10000]
    datos = unifrnd(0,1, cant_muestras, n);
    bs = max(datos, [], 2); # Estimador de b
    mean(bs)
    var(bs)

    # Histograma de b
    subplot(2,2,counter)
    hist(bs, floor(sqrt(cant_muestras)))
    tit = sprintf('Histograma de b - n = %d',cant_muestras);
    title(tit, 'fontsize', 35) # plot title
    #ylim([0, 10*sqrt(n)]) # set limit for y axis
    set(gca, 'fontsize', 35) # set axis fontsize
    ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
    xlabel('b^', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
    grid
    counter = counter + 1;
end

