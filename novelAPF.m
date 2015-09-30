function novelAPF()
% velocity in Hybrid APSO algorithm

global step w range swarm velo gBest pBest staticObs 

s = size(swarm);
z = zeros(s);
vSeparation = z;
vCognitive = z;
vSocial = z;
a = size(staticObs);

rSeparation = 6*range;

Fmax = 4;
k = Fmax/rSeparation^2;
% Update vSeparation
for boid1 = 1:s(2)
    for boid2 = 1:s(2)
        if boid2 ~= boid1
            r12 = r(swarm(:,boid1),swarm(:,boid2));
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
    G = 3;
    for obs = 1:a(2)
        r12 = r(swarm(:,boid1),staticObs(:,obs));
        if r12 < rSeparation+2
%                 m = rand;
				magnitude =  G/(r12-5)^2;
                connect = swarm(:,boid1) - staticObs(:,obs);
				vX = magnitude/r12*connect(1,1);
				vY = magnitude/r12*connect(2,1);
                vSeparation(:,boid1) = vSeparation(:,boid1) + [vX;vY];
        end
    end
    

end

% Update vCognitive 
cognitoMax = 1;
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
socioMax = 3;
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

velo = w(step)*velo + vSeparation + vCognitive + vSocial;

end

