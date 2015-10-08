function swarm = initSwarm(noParticle)

load('allSwarm.mat');

if noParticle == 5
    distributedSwarm = [0 15 45 45 15 0 -45 -45; 45 45 0 -15 -45 -45 0 15];
end

index = randsample(size(distributedSwarm,2),noParticle);

swarm = zeros(2,noParticle);

for i = 1:noParticle
    swarm(:,i) = distributedSwarm(:,index(i));
end

end