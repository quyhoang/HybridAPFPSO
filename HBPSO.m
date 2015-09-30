function conver = HBPSO(objectiveFunction)
% SIMULATING HYBRID BOIDS-PSO ALGORITHM FOR MULTI-ROBOT SYSTEMS IN UNKNOWN ENVIRONMENT EXPLORATION
% AUTHOR: HOANG ANH QUY
% SUPERVISOR: PHAM MINH TRIEN, PhD.
% VNU-UET | MAY 2015

tic

% INITIALIZATION
global maxStep step swarm convergeStep lambda2 
convergeStep = 0;

clc; close all; % clear all; % clear previous data, clear 
set(0,'DefaultFigurePosition', [299, 0, 768, 768]); % make every graph fit my screen (1366*768)
setup(objectiveFunction)


% SEARCHING
for step = 1:maxStep
    updateVelo(); % update velocity
    limitSpeed(); % Check speed limit
    updatePosition(); % update position
    calculateAlgebraicConnectivity();
    newFit = fitness(swarm,objectiveFunction); % current fitness of the swarm
    updatePersonalBest(newFit); % update personal best
    updateGlobalBest(newFit); % update global best
    getData(newFit); % Collect data to visualize results

    if ~convergeStep && (lambda2(step) > 0) 
        convergeStep = step
        conver = convergeStep;
%         break;
    end
end

toc

visualize(objectiveFunction);
showConnectivity();
showResult();

end
