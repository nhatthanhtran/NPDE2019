function [funExact] = fun_exact(dblC)
funExact = @(x,y,t) kron(kron(sin(dblC*pi*x),sin(dblC*pi*y)),exp(-dblC^2*pi^2*t));
end

