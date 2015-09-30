function obsGenerator(objectiveFunction)
% Generate obstacles and shadow, and targets
global staticObs

% switch objectiveFunction
%     case 'singleLuna'
%         staticObs = [-30 -20 0 30; -30 30 0 20];
%     case 'doubleLuna'
%         staticObs = [-10 20 30; 0 -30 10];
%     case 'tripleLuna'
%         staticObs = [-30 -10 -20 10; -10 -30 30 20];
%     case 'normalization'
%         staticObs = [];
%     case 'realLuna1'
%         staticObs = [-30 -20 0 30; -30 30 0 20];
%     case 'realLuna2'
%         staticObs = [-30 -10 -20 10; -10 -30 30 20];
%     otherwise  
%         disp('Matlab feels sorry being unable to generate obstacles for you!');
%         return
% end

switch objectiveFunction
    case 'singleLuna'
        staticObs = [-30 -20 -5 30; -30 30 -5 20];
    case 'doubleLuna'
        staticObs = [-30 -20 -5 30; -30 30 -5 20];
    case 'tripleLuna'
       staticObs = [-30 -20 -5 30; -30 30 -5 20];
    case 'normalization'
        staticObs = [];
    case 'realLuna1'
       staticObs = [-30 -20 -5 30; -30 30 -5 20];
    case 'realLuna2'
        staticObs = [-30 -20 -5 30; -30 30 -5 20];
    otherwise  
        staticObs = [-30 -20 -5 30; -30 30 -5 20];
        disp('Matlab feels sorry being unable to generate obstacles for you!');
        return
end

end

% global shadow1 shadow2 shadow3 staticObs obs1 obs2 obs3

% y1 = linspace(-10,0,11);
% x1 = linspace(-30,-28,3);
% 
% [a,b] = meshgrid(x1,y1);
% obs1 = [a(:),b(:)]';
% 
% shadow1 = [-34 -34 -30 -30; -10 0 0 -10];
% % 
% y2 = linspace(-40,-38,3);
% x2 = linspace(-10,0,11);
% 
% [a2,b2] = meshgrid(x2,y2);
% obs2 = [a2(:),b2(:)]';
% 
% shadow2 = [-10 -10 0 0; -42 -40 -40 -42]; 
% % 
% y3 = linspace(38,40,3);
% x3 = linspace(30,35,6);
% 
% [a3,b3] = meshgrid(x3,y3);
% obs3 = [a3(:),b3(:)]';
% 
% shadow3 = [30 30 35 35; 40 42 42 40];
% % 
% 
% staticObs = [obs1,obs2,obs3];