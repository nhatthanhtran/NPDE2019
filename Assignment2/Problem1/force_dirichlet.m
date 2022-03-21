function funForce = force_dirichlet()
%We can write this as a sign function instead of piecewise function
funForce = @(x) pi^2*sin(pi*x) + abs(x-1/2)*pi^2.*sin(pi*x) - ...
    sign(x-1/2).*pi.*cos(pi*x);
end


