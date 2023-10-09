function KS = kolsmi_normal(datos, mu, sigma)
    n = length(datos);
    x = sort([datos datos]);
    Fn = sort([0 (1:n-1)/n (1:n-1)/n 1]);

    F = normcdf((x-mu)/sigma);

    KS = max(abs(Fn - F));

    