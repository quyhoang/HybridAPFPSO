function sub = fitness(swarm,objectiveFunction)

sub2 = zeros(size(swarm,2));
sub3 = sub2;
sub1 = sub2;

global noParticle FF
sub = ones(1,noParticle);

switch objectiveFunction
    case 'threeHumpCamel'
        %-----------------THREE-HUMP CAMEL FUNCTION -----------------------------
        k = 25;
        for i = 1:noParticle
            sub(i) = 2*(swarm(1,i)/k)^2 - 1.05*(swarm(1,i)/k)^4 + (swarm(1,i)/k)^6/6 + (swarm(1,i)/k)*(swarm(2,i)/k) + (swarm(2,i)/k)^2;
        end
    case 'bohachevsky'
        %-----------------BOHACHEVSKY FUNCTION
        for i = 1:noParticle
            sub(i) = swarm(1,i)^2 + 2*swarm(2,i)^2 - 0.3*cos(3*pi*swarm(1,i) + 4*pi*swarm(2,i)) + 0.3;
        end
    case 'sphere'
        %-----------------SPHERE FUNCTION----------------------------------------
        sub = (sum(swarm.*swarm));
    case 'rosenbrock'
        %-----------------ROSENBROCK FUNCTION -------------------------------------
        k = 25;
        for i = 1:noParticle
            sub(i) = ((swarm(1,i)+k)/k-1).^2 + 100*((swarm(2,i)+k)/k-((swarm(1,i)+k)/k).^2).^2;
        end
        
    case 'normalization'
        %-----------------Single light source 1 at (0,0) -------------------------------------
        h = 10;
        S = [0;0;h];
        I = 500; % luminous intensity of isotropic source
        for i = 1:noParticle
            ptcle = [swarm(:,i);0];
            distance = r(ptcle,S);
            cosI = h/distance;
            sub(i) = I*cosI/distance^2; % flux
        end
        
    case 'singleLuna'
        %-----------------Single light source 1 at (20,-20) -------------------------------------
        h = 10;
        S = [20;-20;h];
        I = 500; % luminous intensity of isotropic source
        for i = 1:noParticle
            ptcle = [swarm(:,i);0];
            distance = r(ptcle,S);
            cosI = h/distance;
            sub(i) = I*cosI/distance^2; % flux
        end
       
    case 'doubleLuna'
        %-----------------Single light source 1 at (-20,-30) -------------------------------------
        h1 = 10;
        S1 = [-20;-30;h1];
        I1 = 10; % luminous intensity of isotropic source
        for i = 1:noParticle
            ptcle = [swarm(:,i);0];
            distance = r(ptcle,S1);
            cosI = h1/distance;
            sub1(i) = I1*cosI/distance^2; % flux
        end
        
        %-----------------Single light source 2 at (10,30) -------------------------------------
        h2 = 10;
        S2 = [10;30;h2];
        I2 = 30; % luminous intensity of isotropic source
        for i = 1:noParticle
            ptcle = [swarm(:,i);0];
            distance = r(ptcle,S2);
            cosI = h2/distance;
            sub2(i) = I2*cosI/distance^2; % flux
        end
             
        for i = 1:noParticle
            sub(i) = sub1(i) + sub2(i);
        end

     case 'tripleLuna'
        %-----------------Single light source 1 at (-10,0) -------------------------------------
        h1 = 10;
        S1 = [-20;-30;h1];
        I1 = 10; % luminous intensity of isotropic source
        for i = 1:noParticle
            ptcle = [swarm(:,i);0];
            distance = r(ptcle,S1);
            cosI = h1/distance;
            sub1(i) = I1*cosI/distance^2; % flux
        end
        
        %-----------------Single light source 2 at (30,20) -------------------------------------
        h2 = 10;
        S2 = [30;20;h2];
        I2 = 20; % luminous intensity of isotropic source
        for i = 1:noParticle
            ptcle = [swarm(:,i);0];
            distance = r(ptcle,S2);
            cosI = h2/distance;
            sub2(i) = I2*cosI/distance^2; % flux
        end
        
        %-----------------Single light source 3 at (20,-20) -------------------
        h3 = 10;
        S3 = [20;-20;h3];
        I3 = 30; % luminous intensity of isotropic source
        for i = 1:noParticle
            ptcle = [swarm(:,i);0];
            distance = r(ptcle,S3);
            cosI = h3/distance;
            sub3(i) = I3*cosI/distance^2; % flux
        end
        
        for i = 1:noParticle
            sub(i) = sub1(i) + sub2(i) + sub3(i);
        end
      
    case 'realLuna1' % AVG_XL
%         C = 0:2.5:357.5; % C angle
%         gamma = 0:2.5:80; % gamma angle
%         h = 12.5;
%         load('data.mat');
%         v1 = b(1:33,:);
%         v2 = flipdim(v1,2);
%         v3 = [v1,v2(:,2:72)];
%         v = v3;
%         [a,b]= meshgrid(C,gamma);
%         
%         xC = a(:);
%         xC = xC';
%         
%         yGamma = b(:);
%         yGamma = yGamma';
%         
%         rr = h*tand(yGamma);
%         
%         yReal = rr.*sind(xC);
%         xReal = rr.*cosd(xC);
%         
%         value = v(:);
%         value = (value').*cosd(yGamma);
%         F = scatteredInterpolant(xReal',yReal',value');
%         load('getValueAVL1XMAMDG.mat');
        for i = 1:noParticle
            sub(i) = FF(swarm(1,i),swarm(2,i));
        end 
        
    case 'realLuna2' % 875
        for i = 1:noParticle
            sub(i) = FF(swarm(1,i),swarm(2,i));
        end    
        
    otherwise
        disp('Invalid objectiveFunction!');
        return
end

%  case 'realLuminaire1' % AVG_1XL_AM_DG.ies
%         load('AVG_1XL_AM_DG.mat');
%         for i = 1:noParticle
%             xIndex = round(swarm(1,i)+50)*10;
%             yIndex = round(swarm(1,i)+50)*10;
%             sub(i) = vq(xIndex,yIndex);
% %             sub(i) = vv(xIndex,yIndex);
%         end

 