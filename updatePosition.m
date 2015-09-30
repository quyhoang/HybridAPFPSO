function updatePosition()
% UPDATE POSITION /////////////////////////////////////////////////////

global noParticle up dw velo swarm
tempPos = swarm + velo;

% Check space limit
for iDim = 1:2 %dimension index
    for parNo = 1:noParticle %no of particle
        if tempPos(iDim,parNo) > up(iDim,parNo)
            tempPos(iDim,parNo) = up(iDim,parNo) - rand*(up(iDim,parNo) - swarm(iDim,parNo));
        elseif tempPos(iDim,parNo) < dw(iDim,parNo)
            tempPos(iDim,parNo) = dw(iDim,parNo) - rand*(dw(iDim,parNo) - swarm(iDim,parNo));
        end
    end
end
swarm = tempPos;

end

