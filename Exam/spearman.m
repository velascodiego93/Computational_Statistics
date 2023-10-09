function RS = spearman(datos)
    n = length(datos);
    [a b] = sort(datos);
    [indices rangos] = sort(b);
    
    RS = 1 - 6*(sum((rangos-indices).^2))/(n*(n^2-1));


