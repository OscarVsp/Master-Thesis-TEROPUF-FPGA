function [uniqueness] = uniqueness_fn(data)
%UNIQUENESS_FN Summary of this function goes here
%   Detailed explanation goes here
[size_response, size_devices] = size(data);
uniqueness = (2/(size_devices*(size_devices-1)))*sum(pdist(data', 'hamming'))*100;
end

