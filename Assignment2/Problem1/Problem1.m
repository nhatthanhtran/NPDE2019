%Problem 1
clc
clear
h = 1/100;
vecMesh = 0:h:1;
%Use to make non-uniform mesh
% for i=2:length(vecMesh)-1
%     randnumber = rand;
%     vecMesh(i) = ((-1)^i)*(randnumber*h/2) + vecMesh(i);
% end
[vecUi,celUh] = Uh_dirichlet(vecMesh);
funexact =@(x) sin(pi*x);
vecMeshE = 0:(1/4999):1;
figure(1)
vecUh = Uh_eval(vecMesh,celUh,vecMeshE);
plot(vecMeshE,vecUh)
xlabel('x')
ylabel('u(x)')
figure(2)
plot(vecMeshE,abs(vecUh-feval(funexact,vecMeshE)'));
xlabel('x')
ylabel('abs error')
