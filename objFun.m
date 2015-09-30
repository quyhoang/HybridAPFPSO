function [xx,yy,zz] = objFun(objectiveFunction)

% set parameter for drawing contour --------------------------------------

switch objectiveFunction
%     case 'threeHumpCamel'
%         % -----------------THREE-HUMP CAMEL FUNCTION 3D PLOT --------------
%         % x = [-2:.1:2];
%         x = [-50:.1:50];
%         y = x;
%         [xx,yy] = meshgrid(x,y);
%         % zz = 2*xx.^2 - 1.05*xx.^4 + xx.^6/6 + yy.^2 + yy.*xx;
%         zz = 2*(xx/25).^2 - 1.05*(xx/25).^4 + (xx/25).^6/6 + (yy/25).^2 + (yy/25).*(xx/25);
%         
%     case 'bohachevsky'
%         %-----------------BOHACHEVSKY FUNCTION 3D PLOT --------------------
%         x = [-50:.1:50];
%         y = x;
%         [xx,yy] = meshgrid(x,y);
%         zz = xx.^2 + 2*yy.^2 - 0.3*cos(3*pi*xx + 4*pi*yy) + 0.3;
%         
%     case 'sphere'
%         %-----------------SPHERE FUNCTION 3D PLOT -------------------------
%         x = [-50:.1:50];
%         y = x;
%         [xx,yy] = meshgrid(x,y);
%         zz = xx.^2 + yy.^2;
%         
%     case 'rosenbrock'
%         %-----------------ROSENBROCK FUNCTION 3D PLOT ---------------------
%         x = [-50:.1:50];
%         y = x;
%         k = 25;
%         [xx,yy] = meshgrid(x,y);
%         zz = ((xx+k)/k-1).^2 + 100*((yy+k)/k-((xx+k)/k).^2).^2;
            
    case 'singleLuna'
        %-----------------Single light source 1 at (20,-20) ------------------
        h = 10;
        I = 5; % luminous intensity of isotropic source
        SS = h*I;
        x = [-50:.1:50];
        y = x;
        [xx,yy] = meshgrid(x,y);
        
        zz = SS./(sqrt((xx-20).^2+(yy+20).^2+h^2)).^3; % flux
           
    case 'doubleLuna'
        %-----------------Single light source 1 at (-20,-30) ------------------
        h1 = 10;
        I1 = 10; % luminous intensity of isotropic source
        SS1 = h1*I1;
        x1 = [-50:.1:50];
        y1 = x1;
        [xx,yy] = meshgrid(x1,y1);
        zz1 = SS1./(sqrt((xx+20).^2+(yy+30).^2+h1^2)).^3; % flux
        
        %-----------------Single light source 2 at (10,30) ------------------
        h2 = 10;
        I2 = 30; % luminous intensity of isotropic source
        SS2  = h2*I2;
        x2 = [-50:.1:50];
        y2 = x2;
        [xx2,yy2] = meshgrid(x2,y2);
        
        zz2 = SS2./(sqrt((xx2-10).^2+(yy2-30).^2+h2^2)).^3; % flux
                
        zz = zz1+zz2;
        
    case 'tripleLuna'
        %-----------------Single light source 1 at (-10,0) ------------------
        h1 = 10;
        I1 = 10; % luminous intensity of isotropic source
        SS1 = h1*I1;
        x1 = [-50:.1:50];
        y1 = x1;
        [xx,yy] = meshgrid(x1,y1);
        zz1 = SS1./(sqrt((xx+10).^2+yy.^2+h1^2)).^3; % flux
        
        %-----------------Single light source 2 at (30,20) ------------------
        h2 = 10;
        I2 = 20; % luminous intensity of isotropic source
        SS2  = h2*I2;
        x2 = [-50:.1:50];
        y2 = x2;
        [xx2,yy2] = meshgrid(x2,y2);
        
        zz2 = SS2./(sqrt((xx2-30).^2+(yy2-20).^2+h2^2)).^3; % flux
        
        %-----------------Single light source 3 at (20,-20) ------------------
        h3 = 10;
        I3 = 30; % luminous intensity of isotropic source
        SS3 = h3*I3;
        x3 = [-50:.1:50];
        y3 = x3;
        [xx3,yy3] = meshgrid(x3,y3);
        zz3 = SS3./(sqrt((xx3-20).^2+(yy3+20).^2+h3^2)).^3; % flux
        
        zz = zz1+zz2+zz3;
        
    case 'realLuna1' % AVG_1XL_AM_DG.ies
        load('getValueAVL1XMAMDG.mat');
         
    case 'realLuna2'
        load('getValue87517M56FG.mat');
        
    otherwise
        disp('Invalid objectiveFunction!');
        return
end

end

   



%         
%         

     

