function [extremum,argumentum] = APO()
tic
% Hybrid APF-PSO Optimization for MRS exploration
% Hanoi 2015, Esaki Leo

% initialize population position -------------------------------

% read accepted position from file
filename = 'acceptedConfig.txt';
delimiterIn = ' ';
headerlinesIn = 1;
A = importdata(filename,delimiterIn,headerlinesIn);
% to get data in A
% A.colheaders{1, k})
% A.data(:, k))
populio = (A.data)';

% generate random position
t_populio = 500*rand(4,6);

% concatenate the two sets of position
populio = [populio,t_populio];


% evaluate adequacy of the positions
adequo = apt(populio);

% initialize population personal best
pBesto = populio;
pAdequo = apt(pBesto);




% initialize population global best
[~,indeo] = min(adequo);
gBesto = repmat(populio(:,indeo),1,size(populio,2));


% initialize population velocity
iterio = 20; % number of iteration

%     set parameters
inertio = linspace(1,.5,iterio);
cognio = linspace(2,.1,iterio);
socio = linspace(0.1,2,iterio);

%     calculate initial velocity
velocio = rand*(gBesto - populio) + rand*(pBesto - populio);

config = zeros(size(populio,1)+1,1);

for i=1:iterio
    %     update population position
    populio = populio + velocio;
    
    %     update personal best
    adequo = apt(populio);
    parfor j = 1:size(populio,2)
        if adequo(j) < pAdequo(j)
            pAdequo(j) = adequo(j);
            pBesto(:,j) = populio(:,j);
        end
    end    
    
    %     update global best
    [~,indeo] = min(pAdequo);
    gBesto = repmat(populio(:,indeo),1,size(populio,2));

    %     update velocity
    velocio = inertio(i)*velocio + cognio(i)*rand*(pBesto - populio) + socio(i)*rand*(gBesto - populio);
    
    %     gather possible configurations
    parfor k = 1:size(populio,2)
        if adequo(k) < 100
            config = [config,[populio(:,k);adequo(k)]];
        end
    end
    
end

save('configRandom.mat','config');
[extremum,indexo] = min(pAdequo);
argumentum = populio(:,indexo);

toc
end 
