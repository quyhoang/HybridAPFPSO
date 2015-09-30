function updatePersonalBest(newFit)
% Find new personal best
% pBest is a m*n matrix
% m = 2 (dimension), n = noParticle
% pBestFit = subFitness(pBest);

global swarm pBestVal pBest

pBestIndex = find(newFit > pBestVal);
pBestVal(:,pBestIndex) = newFit(:,pBestIndex); % update best personal value
pBest(:,pBestIndex) = swarm(:,pBestIndex); % update best personal position

end

