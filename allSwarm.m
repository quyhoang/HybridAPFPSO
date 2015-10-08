function allSwarm()
% generate all the possible position for a particle in the swarm. 
% n particle of this swarm will be choosed to form the real swarm

staticObs = [-30 -20 -5 30; -30 30 -5 20];
[X,Y] = meshgrid(-45:15:45);
distributedSwarm = [X(:) Y(:)]';
dSMax = size(distributedSwarm,2);
sOMax = size(staticObs,2);

j = 1;
i = 1;

while j <= sOMax
    while i <= dSMax
        if r(staticObs(:,j),distributedSwarm(:,i)) < 16
            distributedSwarm(:,i) = [];
            dSMax = dSMax - 1;
        else
            i = i+1;
        end
    end
    j = j+1;
    i = 1;
end

rad = ones(4,1)*5;

viscircles(staticObs',rad,'EdgeColor','g','LineWidth',0.1, 'DrawBackgroundCircle',0); % draw communication range or APF repulsive circle
hold on;

scatter(distributedSwarm(1,:)',distributedSwarm(2,:)');
axis([-50 50 -50 50])

% save('allSwarm.mat','distributedSwarm');

% sw = initSwarm(15);
% scatter(sw(1,:)',sw(2,:)');
% axis([-50 50 -50 50])

end
