function checkStoppingCriteria(objectiveFunction)

global commuRange noParticle swarm targets step convergeStep
converge = 0;
% Check whether the swarm converges, if so, stop searching
switch objectiveFunction
    case 'singleLuna'
        for i = 1:noParticle
            if r(swarm(:,i),targets(1:2,1)) < commuRange + 2
                converge = converge + 1;
            end
        end
    case 'doubleLuna'
        for i = 1:noParticle
            if r(swarm(:,i),targets(1:2,1)) < commuRange + 2
                converge = converge + 1;
            end
            if r(swarm(:,i),targets(1:2,2)) < commuRange + 2
                converge = converge + 1;
            end
        end
    case 'tripleLuna'
        for i = 1:noParticle
            if r(swarm(:,i),targets(1:2,1)) < commuRange + 2
                converge = converge + 1;
            end
            if r(swarm(:,i),targets(1:2,2)) < commuRange + 2
                converge = converge + 1;
            end
            if r(swarm(:,i),targets(1:2,3)) < commuRange + 2
                converge = converge + 1;
            end
        end
end

if (converge > 4)
    convergeStep = step;
end

end

