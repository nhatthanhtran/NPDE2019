%
%Problem 2
clc
clear
h = 1/400;
vecMesh = 0:h:2;
%use to make nonuniform mesh
% for i=2:length(vecMesh)-1
%     randnumber = rand;
%     vecMesh(i) = ((-1)^i)*(randnumber*h/2) + vecMesh(i);
% end
intSize = length(vecMesh);
dblGamma = 3*cos(6);

[vecUi,celUh] = Uh_dn(vecMesh,dblGamma);

funExact =@(x) sin(3*x);
vecMeshE = 0:(1/999):2;
figure(1)
vecUh = Uh_eval(vecMesh,celUh,vecMeshE);
plot(vecMeshE,vecUh)
xlabel('x')
ylabel('u(x)')
figure(2)
plot(vecMeshE',abs(vecUh-feval(funExact,vecMeshE)'));
xlabel('x')
ylabel('abs error')



