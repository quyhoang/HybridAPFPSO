% calculation for paper submitted to VNU-JCSCE

Fmax = 3;
rSeparation = 6;
k = Fmax/rSeparation^2;
cognio = 1;
socio = 3;

syms x y z 
syms o1 o2 c1 c2 s1 s2
uni = [x y];

o = [-30, -30];
c = [15, 15];
s = [20, -20];

module_repulsive = Fmax - k*((x-o(1))^2+(y-o(2))^2);
unit_repulsive = [(x-o(1))/sqrt((x-o(1))^2+(y-o(2))^2),(y-o(2))/sqrt((x-o(1))^2+(y-o(2))^2)];

module_cognio = cognio/(1+exp(-(sqrt((c(1)-x)^2+(c(2)-y)^2)-15)/2));
unit_cognio = [(c(1)-x)/sqrt((c(1)-x)^2+(c(2)-y)^2),(c(2)-y)/sqrt((c(1)-x)^2+(c(2)-y)^2)];

module_socio = socio/(1+exp(-(sqrt((s(1)-x)^2+(s(2)-y)^2)-15)/2));
unit_socio = [(s(1)-x)/sqrt((s(1)-x)^2+(s(2)-y)^2),(s(2)-y)/sqrt((s(1)-x)^2+(s(2)-y)^2)];

F_repulsive = module_repulsive*unit_repulsive; 
potential_repulsive = potential(F_repulsive,uni,s);
% subs(potential_repulsive,uni,s);

F_cognio = module_cognio*unit_cognio;
potential_cognio = potential(F_cognio,uni,s);
% subs(potential_cognio,uni,o);

F_socio = module_socio*unit_socio;
potential_socio= potential(F_socio,uni,s);
% subs(potential_socio,uni,s);

save('potential_substituted.mat','potential_repulsive','potential_cognio','potential_socio');

% 
% o = [o1, o2];
% c = [c1, c2];
% s = [s1, s2];
% 
% module_repulsive = Fmax - k*((x-o1)^2+(y-o2)^2);
% unit_repulsive = [(x-o1)/sqrt((x-o1)^2+(y-o2)^2),(y-o2)/sqrt((x-o1)^2+(y-o2)^2)];
% 
% module_cognio = cognio/(1+exp(-(sqrt((c1-x)^2 +(c2-y)^2)-15)/2));
% unit_cognio = [(c1-x)/sqrt((c1-x)^2+(c2-y)^2),(c2-y)/sqrt((c1-x)^2+(c2-y)^2)];
% 
% module_socio = socio/(1+exp(-(sqrt((s1-x)^2+(s2-y)^2)-15)/2));
% unit_socio = [(s1-x)/sqrt((s1-x)^2+(s2-y)^2),(s2-y)/sqrt((s1-x)^2+(s2-y)^2)];
% 
% 
% F_repulsive = module_repulsive*unit_repulsive; 
% potential_repulsive = potential(F_repulsive,uni,s);
% % subs(potential_repulsive,uni,s);
% 
% F_cognio = module_cognio*unit_cognio;
% potential_cognio = potential(F_cognio,uni,s);
% % subs(potential_cognio,uni,o);
% 
% F_socio = module_socio*unit_socio;
% potential_socio= potential(F_socio,uni,s);
% % subs(potential_socio,uni,s);
% 
% save('potential.mat','potential_repulsive','potential_cognio','potential_socio');

