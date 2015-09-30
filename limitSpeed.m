function limitSpeed()
% Regulate velocity

global noParticle vLimitX vLimitY velo

for parNo = 1:noParticle % no of particle
    s = velo(1,parNo)/velo(2,parNo); % ratio of v components
    sign1 =  velo(1,parNo)/abs(velo(1,parNo));
    sign2 =  velo(2,parNo)/abs(velo(2,parNo));
    if (abs(velo(1,parNo)) > vLimitX)
%         velo(1,parNo) = rand*vLimitX*sign1;
        velo(1,parNo) = vLimitX*sign1;
        velo(2,parNo) = velo(1,parNo)/s;
    end
    if (abs(velo(2,parNo)) > vLimitY)
%         velo(2,parNo) = rand*vLimitY*sign2;
        velo(2,parNo) = vLimitY*sign2;
        velo(1,parNo) = velo(2,parNo)*s;
    end
end

end

