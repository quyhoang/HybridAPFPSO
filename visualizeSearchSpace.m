function visualizeSearchSpace()
close all
clear all
clc
% Draw APF using drawEnvironment.m

% global staticObs
% obs_heio = 0.6*ones(1,size(staticObs,2));
% load('swarm10.mat');
% swarm_heio = 0.5*ones(1,size(swarm,2));
% heio = [obs_heio swarm_heio];
% hill = [staticObs swarm];
% valley = [20;-20];
% depo = 0.05;
% drawEnvironment(hill,heio,valley,depo);

% Draw potential field using values saved in potentialField.mat

[X,Y] = meshgrid(-10:.1:10);
V = zeros(size(X));
max = size(X,1)*size(X,2);
for i=1:max
    V(i) = calculatePotential(X(i),Y(i));
end
surf(X,Y,V);
shading interp;
% colormap hsv;
colorbar;



