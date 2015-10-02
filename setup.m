function setup(objectiveFunction)
% SET UP THE SIMULATION

global noParticle range spaceSize vLimitX vLimitY maxStep commuRange ...
    dwLimit_1 upLimit_1 dwLimit_2 upLimit_2 sensingRange swarm velo...
    fit swarmX swarmY gBest gBestVal pBest pBestVal BestFitnessEver MeanFitnessEver...
    up dw gBestIndex FF lengkeng staticObs t_reInit

% read configuration file
filename = 'init.txt';
delimiterIn = ' ';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);

noParticle = A.data(1);
maxStep = A.data(2); % number of iterations
range = A.data(3); % physical radius of a particle
sensingRange = range*ones(1,noParticle);

% Space initialization ----------------------------------------------------
upLimit_1 = A.data(4); 
dwLimit_1 = A.data(5); assert(dwLimit_1 < upLimit_1); %1: x, 2: y
upLimit_2 = A.data(6); 
dwLimit_2 = A.data(7); assert(dwLimit_2 < upLimit_2);

% Virtual limit for avoiding collision with boundaries --------------------
dw = repmat([dwLimit_1; dwLimit_2],1,noParticle) + 3*range;
up = repmat([upLimit_1; upLimit_2],1,noParticle) - 3*range; % the swarm's coverage is almost all the space, except for four corners.
spaceSize = up - dw;

veloScale = A.data(8); % the ratio of maximum velocity over particle size -------
vLimitX = veloScale*range;
vLimitY = veloScale*range;
velo = repmat([vLimitX; vLimitY],1,noParticle); % initial velocity
commuRange = A.data(9)*range; % communication range, connected distance ----------

% load('randomGeneratorSeed.mat'); % load random generator configuration - the process is no longer stochastic.
lengkeng = 0; %there is no collision initially

% load data for simulation of real sources
if strcmp(objectiveFunction,'realLuna1')
    load('getValueAVL1XMAMDG.mat');
    FF = F;
elseif strcmp(objectiveFunction,'realLuna2')
    load('getValue87517M56FG.mat');
    FF = F;
end

% generate obstacles
staticObs = [-30 -20 -5 30; -30 30 -5 20];

% initialize swarm
swarm = dw + rand(2,noParticle).*spaceSize;
reInitSwarm();
 
% if noParticle == 15
%     load('swarm.mat')
% elseif noParticle == 10
%     load('swarm100.mat')
% elseif noParticle == 5
%     load('swarm5.mat')
% else
%     swarm = dw + rand(2,noParticle).*spaceSize; % initial position --------
% end

fit = fitness(swarm,objectiveFunction);
swarmX = zeros(maxStep,noParticle);
swarmY = zeros(maxStep,noParticle);

[gBestVal,gBestIndex] = max(fit);
gBest = repmat(swarm(:,gBestIndex),1,noParticle);

pBest = swarm; % initial personal best
pBestVal = fitness(pBest,objectiveFunction);

BestFitnessEver = zeros(1,maxStep);
MeanFitnessEver = zeros(1,maxStep);

% end
