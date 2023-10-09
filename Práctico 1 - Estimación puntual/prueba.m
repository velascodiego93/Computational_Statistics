
pkg load statistics

datos = poissrnd(3, 10, 1000);

for i = 1:size(datos,1)
    figure
    hist(datos(i,:), 20)
    tit = sprintf('Histograma de datos - muestra #%d',i);
    title(tit, 'fontsize', 35) # plot title
    ylim([0, 500]) # set limit for y axis
    set(gca, 'fontsize', 35) # set axis fontsize
    ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
    xlabel('x', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
    grid
end