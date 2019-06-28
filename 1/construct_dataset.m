function data = construct_dataset(species, no_features)
%CONSTRUCT_DATASET Summary of this function goes here
%   Detailed explanation goes here

data = zeros(length(species)*10, no_features + 1);
row = 1;
for s = 1:length(species)
    for i = 1:10
        filename = strcat(species(s),num2str(i),".mp3");
        if(exist(filename) == 2)
            feature_vector = get_features(filename, no_features);
            disp(filename);
        end
        data(row,:) = [feature_vector' s];
        row = row + 1;
    end
end

end

