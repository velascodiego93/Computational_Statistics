function r = rachas(datos)
    n = length(datos);
    Y = datos(2:n) > datos(1:n-1);
    rachas = (Y(2:n-1) != Y (1:n-2));
    r = sum(rachas) + 1;


