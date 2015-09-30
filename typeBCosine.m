function cosine = typeBCosine(r,gamma,C)
% find cosine of type B incident angle

hypotenuse1 = r/cosd(C);
hypotenuse2 = hypotenuse1/cosd(gamma);
cosine= r/hypotenuse2;
end
