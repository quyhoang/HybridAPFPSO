% x = [-50:.1:50];
% y = x;
% [xx,yy] = meshgrid(x,y);
% zz = xx.^2 + 2*yy.^2 - 0.3*cos(3*pi*xx + 4*pi*yy) + 0.3;

% %-----------------BOHACHEVSKY FUNCTION 3D PLOT --------------------------
% x = [-50:.1:50];
% y = x;
% [xx,yy] = meshgrid(x,y);
% zz = xx.^2 + 2*yy.^2 - 0.3*cos(3*pi*xx + 4*pi*yy) + 0.3;
% % -----------------------------------------------------------------------

% %-----------------SPHERE FUNCTION 3D PLOT -------------------------------
% x = [-50:.1:50];
% y = x;
% [xx,yy] = meshgrid(x,y);
% zz = xx.^2 + yy.^2;
% % -----------------------------------------------------------------------

%-----------------ROSENBROCK FUNCTION 3D PLOT -------------------------------
x = [-50:.1:50];
y = x;
k = 25;
[xx,yy] = meshgrid(x,y);
zz = ((xx+k)/k-1).^2 + 100*((yy+k)/k-((xx+k)/k).^2).^2;
% -----------------------------------------------------------------------

% % -----------------THREE-HUMP CAMEL FUNCTION 3D PLOT -----------------------
% % x = [-2:.1:2];
% k = 25;
% x = [-50:.1:50];
% y = x;
% [xx,yy] = meshgrid(x,y);
% zz = 2*(xx/k).^2 - 1.05*(xx/k).^4 + (xx/k).^6/6 + (yy/k).^2 + (yy/k).*(xx/k);
% % -------------------------------------------------------------------------

% contour(xx,yy,zz,40);
% xlabel('x coordinator ','FontSize',10)
% ylabel('y coordinator','FontSize',10)

surf(xx,yy,zz)
axis tight
shading interp
colorbar
xlabel('x coordinator','FontSize',10)
ylabel('y coordinator','FontSize',10)
zlabel('Fitness','FontSize',10)

saveas(gcf,'Rosen compare surf','emf');
% close all;
















