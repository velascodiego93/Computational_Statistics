clc
close all
clear all
pkg load statistics

# Parámetros de entrada
mu = 40;
sigma = 5;
n = 35; # Tamaño de muestra
cant_muestras = 100;

# Generación de datos
datos = normrnd(mu,sigma, cant_muestras, n);
medias = mean(datos,2);

# ------------------------------------------------------------------------------------------------
# PARTE a) SIGMA CONOCIDO

# Intervalo de confianza para alfa = 5;
alfa = 0.05;
z_5 = norminv(1-alfa/2, 0, 1);
int_min_5 = medias - z_5*sigma/sqrt(n);
int_max_5 = medias + z_5*sigma/sqrt(n);


# Verificación de intervalos que incluyen al mu verdadero
cont = 0;
for i = 1:size(medias,1)
    if (mu>int_min_5(i)) && (mu<int_max_5(i))
        cont = cont + 1;
    end
end

size(find((int_min_5<mu & int_max_5>mu)))(1)
cont

sprintf('Intervalos efectivos para alfa = %d (SIGMA CONOCIDO): %.2f%%', alfa, cont*100/cant_muestras)
sprintf('Longitud promedio de intervalo %.2f\n', mean(int_max_5 - int_min_5))

# Intervalo de confianza para alfa = 10;
alfa = 0.10;
z_10 = norminv(1-alfa/2, 0, 1);
int_min_10 = medias - z_10*sigma/sqrt(n);
int_max_10 = medias + z_10*sigma/sqrt(n);


# Verificación de intervalos que incluyen al mu verdadero
cont = 0;
for i = 1:size(medias,1)
    if (mu>int_min_10(i)) && (mu<int_max_10(i))
        cont = cont + 1;
    end
end

size(find((int_min_10<mu & int_max_10>mu)))(1)
cont

sprintf('Intervalos efectivos para alfa = %d (SIGMA CONOCIDO): %.2f%%', alfa, cont*100/cant_muestras)
sprintf('Longitud promedio de intervalo %.2f\n', mean(int_max_10 - int_min_10))

# ------------------------------------------------------------------------------------------------

# PARTE b) SIGMA DESCONOCIDO
# Intervalo de confianza para alfa = 5;
alfa = 0.05;
t_5 = tinv(1-alfa/2, n-1); # t de student con n-1 grados de libertad
sigma_n = std(datos, [], 2);
int_min_5 = medias - t_5*sigma_n/sqrt(n);
int_max_5 = medias + t_5*sigma_n/sqrt(n);


# Verificación de intervalos que incluyen al mu verdadero
cont = 0;
for i = 1:size(medias,1)
    if (mu>int_min_5(i)) && (mu<int_max_5(i))
        cont = cont + 1;
    end
end

size(find((int_min_5<mu & int_max_5>mu)))(1)
cont

sprintf('Intervalos efectivos para alfa = %d (SIGMA DESCONOCIDO): %.2f%%', alfa, cont*100/cant_muestras)
sprintf('Longitud promedio de intervalo %.2f\n', mean(int_max_5 - int_min_5))

# Intervalo de confianza para alfa = 10;
alfa = 0.10;
t_10 = tinv(1-alfa/2, n-1); # t de student con n-1 grados de libertad
sigma_n = std(datos, [], 2);
int_min_10 = medias - t_10*sigma_n/sqrt(n);
int_max_10 = medias + t_10*sigma_n/sqrt(n);


# Verificación de intervalos que incluyen al mu verdadero
cont = 0;
for i = 1:size(medias,1)
    if (mu>int_min_10(i)) && (mu<int_max_10(i))
        cont = cont + 1;
    end
end

size(find((int_min_10<mu & int_max_10>mu)))(1)
cont

sprintf('Intervalos efectivos para alfa = %d (SIGMA DESCONOCIDO): %.2f%%', alfa, cont*100/cant_muestras)
sprintf('Longitud promedio de intervalo %.2f\n', mean(int_max_10 - int_min_10))