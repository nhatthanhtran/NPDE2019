function funInitialFunction = initial_function(dblC)
funInitialFunction = @(x,y) sin(dblC*pi*x).*sin(dblC*pi*y);
end

