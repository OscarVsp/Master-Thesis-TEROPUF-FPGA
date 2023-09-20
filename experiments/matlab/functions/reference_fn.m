function [reference, deviations, variances] = reference_fn(data)
%REFERENCE Summary of this function goes here
%   Detailed explanation goes here
[size_sample, size_response] = size(data);
reference = zeros(1,size_response);
deviations = zeros(1,size_response);
variances = zeros(1,size_response);
temp = 0;
for i=1:size_response
    temp = sum(data(:,i))/size_sample;
    reference(i) = round(temp);
    deviations(i) = abs(reference(i) - temp);
    variances(i) = var(data(:,i));
end
end

