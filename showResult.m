function showResult()
% Show searching performance and target information

global gBest gBestVal BestFitnessEver MeanFitnessEver

figure;
plot(BestFitnessEver,'color','r','LineWidth',3); hold on; 
plot(MeanFitnessEver,'LineWidth',3); grid; 
title(['\fontsize{18} {\color{blue}Mean of fitness \color{red}vs \color{blue}Best fitness}']);
xlabel('Step ','FontSize',16); 
ylabel('Fitness','FontSize',16); 
legend('Best Fitness','MeanFitness','Location','SouthEast');
set(gca,'fontsize',16);
% saveas(gcf,'Searching Performance','emf');
pause(1);
% result = ['Best value is ',num2str(gBestVal),', found at (',num2str(gBest(1,1)),',',num2str(gBest(2,1)),')'];
% disp(result);

pause;
clc; close all;
% disp([num2str(gBest(1,1)),',',num2str(gBest(2,1))])
end

