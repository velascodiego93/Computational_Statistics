clc
close all
clear all
pkg load statistics

# Carga de datos
load muestra.mat
datos = X;
n = length(datos);

# PARTE a)

# TEST DE RACHAS
R = rachas(datos);

# Ajuste de Levene
zL_r = (R + 0.5 - (2*n-1)/3)/(sqrt((16*n-29)/90));
zR_r = (R - 0.5 - (2*n-1)/3)/(sqrt((16*n-29)/90));

if R < (2*n-1)/3
    p_value_rachas = normcdf(zL_r)
else
    p_value_rachas = 1 - normcdf(zR_r)
end
    
# TEST DE SPEARMAN
RS = spearman(datos);

# Ajuste normal 
z_sp = RS*sqrt(n-1);

if RS < 0
    p_value_sp = normcdf(z_sp)
else
    p_value_sp = 1 - normcdf(z_sp)
end

# RESULTADO
alfa = 0.10;

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

KSL = kolsmi_normal(datos, mu, sigma)

# Ajuste para n>35
if alfa == 0.20
    KSL_lim = 0.736/sqrt(n)
elseif alfa == 0.15
    KSL_lim = 0.768/sqrt(n)
elseif alfa == 0.10
    KSL_lim = 0.805/sqrt(n)
elseif alfa == 0.05
    KSL_lim = 0.886/sqrt(n)
elseif alfa == 0.01
    KSL_lim = 1.031/sqrt(n)
end

if KSL < KSL_lim
    sprintf('Ho no puede ser rechazada con alfa = %d --> Es razonable afirmar que los datos tienen distribución normal', alfa)
else
    sprintf('Ho es rechazada con alfa = %d --> NO es razonable afirmar que los datos tienen distribución normal ', alfa)
end

# ------------------------------------------------------------------------------------------------

# PARTE d)
n_sim = 40
alfa_sim = 0.05;

# Ajuste para n>35
if alfa_sim == 0.20
    KSL_lim_sim = 0.736/sqrt(n_sim)
elseif alfa_sim == 0.15
    KSL_lim_sim = 0.768/sqrt(n_sim)
elseif alfa_sim == 0.10
    KSL_lim_sim = 0.805/sqrt(n_sim)
elseif alfa_sim == 0.05
    KSL_lim_sim = 0.886/sqrt(n_sim)
elseif alfa_sim == 0.01
    KSL_lim_sim = 1.031/sqrt(n_sim)
end

cant_muestras_sim = 10000;
mu_sim = 3;
sigma_sim = 2;

x = normrnd(mu_sim, sigma_sim, cant_muestras_sim, n_sim);
KSL_sim = [];

for i = 1:cant_muestras_sim
    KSL_sim(i) = kolsmi_normal(x(i,:),mean(x(i,:)), std(x(i,:)));
end

size(find(KSL_sim>=KSL_lim_sim))(2) / cant_muestras_sim

