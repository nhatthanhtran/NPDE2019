%
%Problem 3
clc
clear
format short e
h = 1/200;
vecMesh = 0:h:1;
%use to create non uniform mesh
% for i=2:length(vecMesh)-1
%     randnumber = rand;
%     vecMesh(i) = ((-1)^i)*(randnumber*h/2) + vecMesh(i);
% end
intSize = length(vecMesh);
dblGamma = 3*exp(2);
[vecUi,celUh] = Uh_mixed(vecMesh,dblGamma);

funExact =@(x) exp(2*x);
vecMeshE = 0:(1/1999):1;
figure(1)
 vecUh = Uh_eval(vecMesh,celUh,vecMeshE);
plot(vecMeshE,vecUh)
hold on 
plot(vecMeshE,feval(funExact,vecMeshE))
xlabel('x')
ylabel('u(x)')
figure(2)
plot(vecMeshE',abs(vecUh-feval(funExact,vecMeshE)'));
xlabel('x')
ylabel('abs error')

