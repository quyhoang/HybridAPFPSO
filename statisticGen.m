% This function is used to generate statistics for the paper, including
% - Mean of best fitnesses found in each run
% - Standard variation of best fitnesses

parfor i = 1:100
    g(i)= HBPSO('tripleLuna');
end
mean(g)
std(g)