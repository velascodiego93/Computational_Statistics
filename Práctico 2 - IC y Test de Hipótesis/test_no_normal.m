close all
clear all
pkg load statistics

# Verificación de que Zn = sqrt(n)*((media-mu)/sigma_n) tiende a 
# una normal a medida que el tamaño de la muestra n crece. 
# Verificación del IC para mu. Se usa distribución exponencial


# Parámetros de entrada
lambda = 2; # parámetro de distribución exponencial
n = 5000; # Tamaño de muestra
cant_muestras = 10000;

# Generación de datos
datos = exprnd(1/lambda, cant_muestras, n);
medias = mean(datos,2);

mu = 1/lambda;
sigma_n = std(datos, [], 2);

Zn = sqrt(n)*((medias-mu)./sigma_n);

# Histograma
figure
hist(Zn, floor(sqrt(n)))
tit = sprintf('Histograma de Zn');
title(tit, 'fontsize', 35) # plot title
ylim([0, 12*sqrt(cant_muestras)]) # set limit for y axis
set(gca, 'fontsize', 35) # set axis fontsize
ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
xlabel('Zn', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
grid

# Intervalo de confianza
alfa = 10;
z_al = norminv(1-0.01*alfa/2, 0, 1);
int_min = medias - z_al*sigma_n/sqrt(n);
int_max = medias + z_al*sigma_n/sqrt(n);

# Verificación de intervalos que incluyen al mu verdadero
cont = 0;
for i = 1:size(medias,1)
    if (mu>int_min(i)) && (mu<int_max(i))
        cont = cont + 1;
    end
end

sprintf('Intervalos efectivos para alfa = %d: %.2f%%', alfa, cont*100/cant_muestras)
sprintf('Longitud promedio de intervalo %.2f\n', mean(int_max - int_min))