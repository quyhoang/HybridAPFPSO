function visualize(objectiveFunction)

global maxStep commuRange sensingRange dwLimit_1 upLimit_1 dwLimit_2 upLimit_2 ...
    BestFitnessEver step swarmX swarmY shadow1 shadow2 shadow3 staticObs obs1 obs2 obs3

[xx,yy,zz] = objFun(objectiveFunction);
WAIT = .005;

for step = 1:maxStep
    clf; % clear figure
    
    if step == maxStep
      drawContour(xx,yy,zz,step);
      hold on;
    end
    
%     rectangle('Position',[shadow1(1,1),shadow1(2,1),5,10],'FaceColor','c'); % shadow
%     hold on;
%     rectangle('Position',[shadow2(1,1),shadow2(2,1),10,5],'FaceColor','c'); % shadow
%     hold on;
%     rectangle('Position',[shadow3(1,1),shadow3(2,1),5,4],'FaceColor','c'); % shadow
%     hold on;
%     
%     % draw obstacles
%     rectangle('Position',[obs1(1,1),obs1(2,1),3,10],'FaceColor','m'); % shadow
%     hold on;
%     rectangle('Position',[obs2(1,1),obs2(2,1),10,3],'FaceColor','m'); % shadow
%     hold on;
%     rectangle('Position',[obs3(1,1),obs3(2,1),5,2],'FaceColor','m'); % shadow
%     hold on;
    
    scatter(staticObs(1,:),staticObs(2,:),1000,'m','filled');

    xlabel('x coordinator','FontSize',16); ylabel('y coordinator','FontSize',16)
%     str = ['Step: ',num2str(step),'\it \color[rgb]{0.2,0.5,0.5} Best Value = ', num2str(gBestVal)];
%     title(str,'FontSize',18);
    str = ['Step: ',num2str(step),'\it \color[rgb]{0.2,0.5,0.5} Best Value = ', num2str(BestFitnessEver(step))];
    title(str,'FontSize',18);
    set(gca,'fontsize',16); hold on;
    
    
    swarmStep = [swarmX(step,:);swarmY(step,:)]';
    viscircles(swarmStep,commuRange*sensingRange,'EdgeColor','g','LineWidth',0.1); % draw communication range or APF repulsive circle
    scatter(swarmX(step,:),swarmY(step,:),110,[0 0 1],'filled'); % visual alternation of the above line, draw all the swarm with each particle's size
    
    
    axis([dwLimit_1-1 upLimit_1+1 dwLimit_2-1 upLimit_2+1]); hold on;
     
    pause(WAIT);
    
end
    % save('arrangePost.mat','swarm');
end

