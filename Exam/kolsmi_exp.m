function KS = kolsmi_exp(datos, mu)
    n = length(datos);
    x = sort([datos datos]);
    Fn = sort([0 (1:n-1)/n (1:n-1)/n 1]);

    F = expcdf(x,mu);

    KS = max(abs(Fn - F));

    #PLOTEO
    figure
    plot (x,Fn, 'b')
    hold on
    plot (x,F, 'r')
    tit = sprintf('Fn(x) y F(x) - Distribución exponencial');
    title(tit, 'fontsize', 35) # plot title # set limit for y axis
    set(gca, 'fontsize', 35) # set axis fontsize
    ylabel('Fn(x) y F(x)', 'fontsize', 35, 'fontweight', 'bold') # set ylabel
    xlabel('x', 'fontsize', 35, 'fontweight', 'bold') # set xlabel
    hold off

