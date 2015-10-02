function adequacio = apt(populio)
% compute fitness for parameter population

adequacio = zeros(1,size(populio,2));

parfor i = 1:size(populio,2)
    adequacio(i) = HBPSO('realLuna1',populio(:,i));
end

end