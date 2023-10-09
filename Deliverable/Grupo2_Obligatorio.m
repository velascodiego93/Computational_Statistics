##### Ejercicio 1 ############
close all
clear all

#### Parte A ####
pkg load statistics
datos =[869.39 177.11 735.20 721.46 850.72 636.72 624.48 539.24 4388.68 1376.25 1656.88 1397.89 523.88 254.30 304.92 263.11 584.39 360.07 139.33 88.86 567.65 948.83 918.23 1328.33 3112.35]
led_round= round(datos)
stemleaf(sort(led_round), "Horas Led")


figure
labels = {"Led"}
boxplot(datos,"Labels",labels,"BoxStyle", "filled");
axis([0,2])
title("Horas Duración",'fontsize', 28)
set(gca, 'fontsize', 24)
ylabel('Horas', 'fontsize', 24)
grid

# ------------------------------------------------------------------------------------------------

#### Parte B #####
# Con n grande, el estadístico d = sqrt(n)*((media-mu)/sigma_n) tiende
# a tener una distribución normal estándar. Se considera dicho estadístico
# para el test de hipótesis.

# Ho: lambda = 1/1000
# H1: lambda != 1/1000

# TEST BILATERAL
# Parámetros de entrada
n = length(datos);
media = mean(datos);
sigma_n = std(datos);

lambda0 = 1/1000; # Valor de lambda bajo Ho
mu0 = 1/lambda0; # Esperanza de VA exponencial bajo Ho

d = sqrt(n)*((media-mu0)/sigma_n); # Estadístico del test
alfa = 0.05; # Nivel de significancia del test

# Test
p1 = normcdf(d);
p2 = normcdf(-d);

p_value = 1-(max(p1,p2)-min(p1,p2))

if p_value < alfa
    sprintf('TEST BILATERAL: p-valor = %.2f. Ho es rechazada con alfa = %d', p_value, alfa)
else
    sprintf('TEST BILATERAL: p-valor = %.2f. Ho no puede ser rechazada con alfa = %d', p_value, alfa)
end

# ------------------------------------------------------------------------------------------------

#### Parte C #####
# SIMULACIÓN
cant_muestras = 10000;

# Generación de datos simulados
datos_sim = exprnd(mu0, cant_muestras, n);
medias = mean(datos_sim,2); # EMV de lambda para distribución exponencial (promedio)
sigma_nn = std(datos_sim, [], 2);


# p-valor simulado calculado en base al EMV de lambda para cada muestra
desvio = mu0 - media;
m1 = media;
m2 = mu0 + desvio;
pseudo_p_val = (size(find(medias<=min(m1,m2)))(1) + size(find(medias>=max(m1,m2)))(1))/cant_muestras

if pseudo_p_val < alfa
    sprintf('TEST SIMULADO: pseudo p-valor = %.2f. Ho es rechazada con alfa = %d', pseudo_p_val, alfa)
else
    sprintf('TEST SIMULADO: pseudo p-valor = %.2f. Ho no puede ser rechazada con alfa = %d', pseudo_p_val, alfa)
end

# Histograma de medias
figure
hist(medias, floor(sqrt(cant_muestras)))
tit = sprintf('Histograma de Medias');
title(tit, 'fontsize', 35) # plot title
set(gca, 'fontsize', 35) # set axis fontsize
ylabel('Count', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
xlabel('Media', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
grid
hold on
line([m1,m1], ylim, 'LineWidth', 2, 'Color', 'r')
line([m2,m2], ylim, 'LineWidth', 2, 'Color', 'r')

# ------------------------------------------------------------------------------------------------

##### Ejercicio 2 ############
close all
clear all
pkg load statistics

# Carga de datos
load grupo2.mat
datos = X;
n = length(datos);

# PARTE a)

# TEST DE RACHAS
R = rachas(datos);

# Ajuste de Levene
zL_r = (R + 0.5 - (2*n-1)/3)/(sqrt((16*n-29)/90));
zR_r = (R - 0.5 - (2*n-1)/3)/(sqrt((16*n-29)/90));

if R < (2*n-1)/3
    p_value_rachas = normcdf(zL_r);
else
    p_value_rachas = 1 - normcdf(zR_r);
end

# TEST DE SPEARMAN
RS = spearman(datos);

# Ajuste normal
z_sp = RS*sqrt(n-1);

if RS < 0
    p_value_sp = normcdf(z_sp);
else
    p_value_sp = 1 - normcdf(z_sp);
end

# RESULTADO
alfa = 0.05;

sprintf('TEST DE RACHAS: p-valor = %.2f', p_value_rachas)
sprintf('TEST DE RANGOS DE SPEARMAN: p-valor = %.2f', p_value_sp)

if (p_value_rachas > alfa) && (p_value_sp > alfa)
    sprintf('Ambos tests son superados. Ho no puede ser rechazada con alfa = %d --> Datos considerados como iid', alfa)
elseif (p_value_rachas < alfa) && (p_value_sp > alfa)
    sprintf('p-valor = %.2f para test de rachas. Ho es rechazada con alfa = %d, --> Datos no considerados como iid', p_value_rachas, alfa)
elseif (p_value_rachas > alfa) && (p_value_sp < alfa)
    sprintf('p-valor = %.2f para test de Spearman. Ho es rechazada con alfa = %d, --> Datos no considerados como iid', p_value_sp, alfa)
else
    sprintf('p-valor = %.2f para test de rachas y %.2f para test de Spearman. Ho es rechazada con alfa = %d, --> Datos no considerados como iid', p_value_rachas, p_value_sp, alfa)
end

# ------------------------------------------------------------------------------------------------

# PARTE b)
mu = 3;
sigma = 2;

KS = kolsmi_normal(datos, mu, sigma)

# Ajuste para n>35
if alfa == 0.20
    KS_lim = 1.07/sqrt(n)
elseif alfa == 0.15
    KS_lim = 1.14/sqrt(n)
elseif alfa == 0.10
    KS_lim = 1.22/sqrt(n)
elseif alfa == 0.05
    KS_lim = 1.36/sqrt(n)
elseif alfa == 0.01
    KS_lim = 1.63/sqrt(n)
end

if KS < KS_lim
    sprintf('Ho no puede ser rechazada con alfa = %d --> Es razonable afirmar que los datos tienen distribución normal con mu = %d y sigma = %d', alfa,mu,sigma)
else
    sprintf('Ho es rechazada con alfa = %d --> NO es razonable afirmar que los datos tienen distribución normal con mu = %d y sigma = %d', alfa,mu,sigma)
end

# ------------------------------------------------------------------------------------------------

# PARTE c)
mu = mean(datos);
sigma = std(datos);

KS_L = kolsmi_normal(datos, mu, sigma)

# Ajuste para n>35
if alfa == 0.20
    KS_lim = 0.736/sqrt(n)
elseif alfa == 0.15
    KS_lim = 0.768/sqrt(n)
elseif alfa == 0.10
    KS_lim = 0.805/sqrt(n)
elseif alfa == 0.05
    KS_lim = 0.886/sqrt(n)
elseif alfa == 0.01
    KS_lim = 1.031/sqrt(n)
end

if KS_L < KS_lim
    sprintf('Ho no puede ser rechazada con alfa = %d --> Es razonable afirmar que los datos tienen distribución normal', alfa)
else
    sprintf('Ho es rechazada con alfa = %d --> NO es razonable afirmar que los datos tienen distribución normal ', alfa)
end

