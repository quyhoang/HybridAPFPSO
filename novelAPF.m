function novelAPF(parameter)
% velocity in Hybrid APSO algorithm

global step w range swarm velo gBest pBest staticObs lengkeng commuRange

s = size(swarm);
z = zeros(s);
vSeparation = z;
vCognitive = z;
vSocial = z;
a = size(staticObs);
density = zeros(1,s(2));

rSeparation = 6*range;

Fmax = parameter(1);
k = Fmax/rSeparation^2;
% Update vSeparation
for boid1 = 1:s(2)
    for boid2 = 1:s(2)
        if boid2 ~= boid1
            r12 = r(swarm(:,boid1),swarm(:,boid2));
           
%           calculate density
            if r12 < 7  
                density(boid1) = density(boid1)+1;
            end
            
            % return if there is a collision
            if r12 < 2*range 
                lengkeng = lengkeng+1;
%                 return; 
            end
            
            if r12 < rSeparation
                magnitude = Fmax - k*r12^2;
				connect = swarm(:,boid1) - swarm(:,boid2);
				vX = magnitude/r12*connect(1,1);
				vY = magnitude/r12*connect(2,1);
                vSeparation(:,boid1) = vSeparation(:,boid1) + [vX;vY];
            end
        end
    end
    
    % experimental: add random number to forces
    G = parameter(2);
    for obs = 1:a(2)
        r12 = r(swarm(:,boid1),staticObs(:,obs));
%         return if there is a collision
            if r12 < 5 
                lengkeng = lengkeng + 1;
%                 return; 
            end
        if r12 < rSeparation+10
%                 m = rand;
				magnitude =  G/(r12-5)^2;
%                 magnitude = G*sigmoid((-r12-12));
                connect = swarm(:,boid1) - staticObs(:,obs);
				vX = magnitude/r12*connect(1,1);
				vY = magnitude/r12*connect(2,1);
                vSeparation(:,boid1) = vSeparation(:,boid1) + [vX;vY];
        end
    end
    

end

% Update vCognitive 
cognitoMax = parameter(3);
rpBest = r(swarm,pBest);
for boid1 = 1:s(2)
    r12 = rpBest(boid1);
    if r12 ~= 0
        magnitude = cognitoMax/(1+exp(-(r12-15)/2));
        connect = swarm(:,boid1) - pBest(:,boid1);
        vX = -magnitude/r12*connect(1,1);
        vY = -magnitude/r12*connect(2,1);
        vCognitive(:,boid1) = vCognitive(:,boid1) + [vX;vY];
    else
        vCognitive(:,boid1) = 0;
    end
end

% Update vSocial
socioMax = parameter(4);
rgBest = r(swarm,gBest);
for boid1 = 1:s(2) 
    r12 = rgBest(boid1);
    if r12 ~= 0;
    magnitude = socioMax/(1+exp(-(r12-15)/2));
    connect = swarm(:,boid1) - gBest(:,boid1);
    vX = -magnitude/r12*connect(1,1);
    vY = -magnitude/r12*connect(2,1);
    vSocial(:,boid1) = vSocial(:,boid1) + [vX;vY];
    else 
        vSocial(:,boid1) = 0;
    end
end

density = sigmoid(-density+3);

velo = [density;density].*velo + vSeparation + vCognitive + vSocial;
% velo = w(step).*velo + vSeparation + vCognitive + vSocial;


end