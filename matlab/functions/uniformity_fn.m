function [average_uniformity,sample_uniformities] = uniformity_fn(data)
%UNIFORMITY_FN Summary of this function goes here
%   Detailed explanation goes here
[size_sample, size_response] = size(data);
sample_uniformities = zeros(1,size_sample);
for i=1:size_sample
    sample_uniformities(i) = sum(data(i,:))*100/size_response;
end
average_uniformity = mean(sample_uniformities);
end

