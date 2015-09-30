function veloOutput = updateBoidVelocity(swarm,velo,staticObs)

global range step c2

s = size(swarm);
z = zeros(s);
veloOutput = z;
mirrorVelo = velo;
vSeparation = z;
vAttraction = z;
neighbor = 0;
a = size(staticObs);

rSeparation = 10*range;
r2 = 12*range;
r3 = 15*range;
G = 30;

% Update vSeparation
for boid1 = 1:s(2)
    for boid2 = 1:s(2)
        if boid2 ~= boid1
            r12 = r(swarm(:,boid1),swarm(:,boid2));
            if r12 < rSeparation
				magnitude = G*c2(step)/r12^2;
				connect = swarm(:,boid1) - swarm(:,boid2);
				vX = magnitude/r12*connect(1,1);
				vY = magnitude/r12*connect(2,1);
                vSeparation(:,boid1) = vSeparation(:,boid1) + [vX;vY];
            end
        end
    end
    
    for obs = 1:a(2)
        r12 = r(swarm(:,boid1),staticObs(:,obs));
        if r12 < rSeparation
				magnitude = 30/r12^2;
                connect = swarm(:,boid1) - staticObs(:,obs);
				vX = magnitude/r12*connect(1,1);
				vY = magnitude/r12*connect(2,1);
                vSeparation(:,boid1) = vSeparation(:,boid1) + [vX;vY];
        end
    end
end

% Update vAttraction
for boid1 = 1:s(2)
    for boid2 = 1:s(2)
        if boid2 ~= boid1
            r12 = r(swarm(:,boid1),swarm(:,boid2));
            if r12 > r2 && r12 < r3
				magnitude = G*c2(step)/r12^2;
				connect = swarm(:,boid1) - swarm(:,boid2);
				vX = -magnitude/r12*connect(1,1);
				vY = -magnitude/r12*connect(2,1);
                vAttraction(:,boid1) = vAttraction(:,boid1) + [vX;vY];
            end
        end
    end
end

veloOutput = velo + vSeparation + vAttraction;
end
