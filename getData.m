function getData(newFit)
% Collect data for visualizing results

global BestFitnessEver step gBestVal MeanFitnessEver swarmX swarmY swarm

BestFitnessEver(step) = gBestVal;
MeanFitnessEver(step) = mean(newFit);
swarmX(step,:) = swarm(1,:); % x-coordinator (of all steps) matrix
swarmY(step,:) = swarm(2,:); % y-coordinator matrix

end

