function updateGlobalBest(newFit)
% Find new global best
% gBestVal is the best value
% gBest is a n*m matrix
% n = 2 (dimension), m = noParticle

global noParticle swarm gBestVal gBest gBestIndex

[gBestValTemp,gBestIndexTemp] = max(newFit);
if gBestValTemp > gBestVal
    gBestVal = gBestValTemp;
    gBestIndex = gBestIndexTemp;
    gBest = repmat(swarm(:,gBestIndex),1,noParticle);
else
    gBestVal = gBestVal;
    gBest = gBest;
end

end

