function [x,y] = map(r,gamma,C)
% Map gamma and C value to x and y coordinate

y = r*tand(C);
hypotenuse1 = r/cosd(C);
x = hypotenuse1*tand(gamma);

end

