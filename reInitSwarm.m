function reInitSwarm()
% function to validate initial randomly-generated swarm

global swarm staticObs noParticle

for i = 1:noParticle
    
    for k = 1:size(staticObs,2)
        if r(swarm(:,i),staticObs(:,k)) < 9
            connect = swarm(:,i) - staticObs(:,k);
            vX = 5*connect(1,1)/abs(connect(1,1));
            vY = 5*connect(2,1)/abs(connect(2,1));
            swarm(:,i) = swarm(:,i) + [vX;vY];            
        end
    end
    
    for j = i+1:noParticle
        if r(swarm(:,i),swarm(:,j)) < 4
            connect = swarm(:,j) - swarm(:,i);
            vX = 3*connect(1,1)/abs(connect(1,1));
            vY = 3*connect(2,1)/abs(connect(2,1));
            swarm(:,j) = swarm(:,j) + [vX;vY]; 
        end
    end
    
end
end
        