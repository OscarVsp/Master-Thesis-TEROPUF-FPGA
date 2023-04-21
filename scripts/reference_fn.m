function [reference, deviation] = reference_fn(data)
%REFERENCE Summary of this function goes here
%   Detailed explanation goes here
[size_sample, size_response] = size(data);
reference = zeros(1,size_response);
deviation = zeros(1,size_response);
temp = 0;
for i=1:size_response
    temp = sum(data(:,i))/size_sample;
    reference(i) = round(temp);
    deviation(i) = abs(reference(i) - temp);
end
end

