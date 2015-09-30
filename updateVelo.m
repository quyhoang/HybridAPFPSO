function updateVelo()
% UPDATE VELOCITY //////////////////////////////////////////

global step w c1 c2 swarm velo gBest pBest staticObs 

% % Conventional PSO velocity
% velo = w(step)*velo + c1(step)*rand*(pBest-swarm) + c2(step)*rand*(gBest-swarm);

% % HBPSO velocity
% velo = w(step)*velo + c1(step)*rand*(pBest - swarm) + c2(step)*rand*(gBest - swarm) + updateBoidVelocity(swarm,velo,staticObs);

% % APF PSO velocity
% k = 3;
% velo = w(step)*velo + c1(step)*rand*(pBest - swarm) + c2(step)*rand*(gBest - swarm) + k*APF(swarm,velo,staticObs);

% novelAPF
novelAPF();

end