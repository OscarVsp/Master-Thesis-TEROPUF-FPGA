function [average_uniformity,reliability] = intra_device_analysis_fn(data)
%INTRA_DEVICE_ANALYSIS_FN Summary of this function goes here
%   Detailed explanation goes here
[reference, deviation] = reference_fn(data);
[average_uniformity, sample_uniformities] = uniformity_fn(data);
[reliability, hd_intra] = reliability_fn(data, reference);
end

