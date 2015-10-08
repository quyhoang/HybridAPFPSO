load 875_17M_56_FG.mat
[gGamma,cC] = meshgrid(gamma,C);
arrayC = cC(:)';
arrayGamma = gGamma(:)';
intensity = intensity';
arrayIntensity = intensity(:)';

numPoint = size(arrayIntensity,2);
xReal = zeros(size(arrayIntensity));
yReal = xReal;
cosine = xReal;

r = 50;

for i = 1: numPoint
    [xReal(i),yReal(i)] = map(r,arrayGamma(i),arrayC(i));
    cosine(i) = typeBCosine(r,arrayGamma(i),arrayC(i));
end

value = arrayIntensity.*cosine;

d = -50:0.1:50;
[xx,yy] = meshgrid(d,d);

zz = griddata(xReal,yReal,value,xx,yy,'natural');
figure;
contourf(xx,yy,zz);
saveas(gcf,'875','emf');
% surf(xq,yq,vq);
% shading interp
% 
% F = scatteredInterpolant(xReal',yReal', value');
% save('getValue87517M56FG.mat','F','xx','yy','zz');



