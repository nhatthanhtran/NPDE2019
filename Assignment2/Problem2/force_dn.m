function funForce = force_dn()
%forcing function for dirichlet neumann
funForce = @(x) 9*sin(3*x) - 3*cos(3*x) + 9*x.*sin(3*x);
end

