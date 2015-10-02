function conver = HBPSO(objectiveFunction,parameter)
% SIMULATING HYBRID BOIDS-PSO ALGORITHM FOR MULTI-ROBOT SYSTEMS IN UNKNOWN ENVIRONMENT EXPLORATION
% AUTHOR: HOANG ANH QUY
% SUPERVISOR: PHAM MINH TRIEN, PhD.
% VNU-UET | MAY 2015

% INITIALIZATION
global maxStep step swarm convergeStep lambda2 lengkeng
convergeStep = 0;

clc; close all; % clear all; % clear previous data, clear 
set(0,'DefaultFigurePosition', [299, 0, 768, 768]); % make every graph fit my screen (1366*768)
setup(objectiveFunction)


% SEARCHING
for step = 1:maxStep
    novelAPF(parameter); %     updateVelo(); % update velocity
    limitSpeed(); % Check speed limit
    updatePosition(); % update position
    calculateAlgebraicConnectivity();
    newFit = fitness(swarm,objectiveFunction); % current fitness of the swarm
    updatePersonalBest(newFit); % update personal best
    updateGlobalBest(newFit); % update global best
    getData(newFit); % Collect data to visualize results

    if ~lambda2(step)
        convergeStep = 0;
    elseif ~convergeStep && (lambda2(step) > 0) 
        convergeStep = step;
%         break;
    end
end

if lengkeng
    conver = maxStep + lengkeng;
elseif ~convergeStep
    conver = 5*maxStep;
else
    conver = convergeStep;
end

% conver = convergeStep;
% tic
% toc

% visualize(objectiveFunction);
% showConnectivity();
% showResult();

end
