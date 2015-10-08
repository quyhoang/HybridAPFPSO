% This function is used to gene rate statistics for the paper, including
% - Mean of best fitnesses found in each run
% - Standard variation of best fitnesses

%----------------------------------------------------------------------------

parfor i = 1:100
    s(i)= HBPSO('singleLuna',[3 .1 3]);
end
mean5single = mean(s);
std5single = std(s);

parfor i = 1:100
    r1(i)= HBPSO('realLuna1',[3 .1 3]);
end
mean5R1 = mean(r1);
std5R1 = std(r1);

parfor i = 1:100
    r2(i)= HBPSO('realLuna2',[3 .1 3]);
end
mean5R2 = mean(r2);
std5R2 = std(r2);

save('swarm5statistic.mat','mean5single','std5single','mean5R1','std5R1','mean5R2','std5R2');

%---------------------------------------------------------------------------------------------

% parfor i = 1:100
%     s(i)= HBPSO('singleLuna',[4 1 3]);
% end
% % change noParticle to 10, rerun
% mean10single = mean(s);
% std10single = std(s);
% 
% parfor i = 1:100
%     r1(i)= HBPSO('realLuna1',[4 1 3]);
% end
% % change noParticle to 10, rerun
% mean10R1= mean(r1);
% std10R1= std(r1);
% 
% parfor i = 1:100
%     r2(i)= HBPSO('realLuna2',[4 1 3]);
% end
% % change noParticle to 10, rerun
% mean10R2= mean(r2);
% std10R2= std(r2);
% 
% save('swarm10statistic.mat','mean10single','std10single','mean10R1','std10R1','mean10R2','std10R2');

%--------------------------------------------------------------------------------------------------------

% parfor i = 1:100
%     s(i)= HBPSO('singleLuna',[4 1 3]);
% end
% % change n oParticle to 15, rerun
% mean15single = mean(s);
% std15single = std(s);
% 
% parfor i = 1:100
%     r1(i)= HBPSO('realLuna1',[4 1 3]);
% end
% % change noParticle to 15, rerun
% mean15R1 = mean(r1);
% std15R1 = std(r1);

% 
% parfor i = 1:100
%     r2(i)= HBPSO('realLuna2',[4 1 3]);
% end
% % change noParticle to 15, rerun
% mean15R2 = mean(r2);
% std15R2 = std(r2);
% 
% save('swarm15statistic.mat','mean15single','std15single','mean15R1','std15R1','mean15R2','std15R2');