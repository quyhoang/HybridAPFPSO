function drawEnvironment(hill,height,valley,depth)
% draw search space

h = 10;
[xx,yy] = meshgrid(-50:1.5:50);
zz = zeros(size(xx));

% draw hills
for i = 1:size(hill,2)
    heio = height(i);
    zz = zz + heio./(sqrt((xx-hill(1,i)).^2+(yy-hill(2,i)).^2+h^2)).^3; % flux
end

for i = 1:size(valley,2)
    depo = -depth(i);
    zz = zz + depo./(sqrt((xx-valley(1,i)).^2+(yy-valley(2,i)).^2+h^2)).^2; % flux
end

% surf(xx,yy,zz);
% colormap hsv;
% color bar;
% alpha(.4)

surf(xx,yy,zz);
shading interp

% contourf(xx,yy,zz);