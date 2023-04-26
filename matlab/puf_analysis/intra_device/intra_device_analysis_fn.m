function [reference, bit_deviations, bit_variances, average_uniformity, reliability, sample_uniformities, hd_intra] = intra_device_analysis_fn(data)
%INTRA_DEVICE_ANALYSIS_FN Summary of this function goes here
%   Detailed explanation goes here
[reference, bit_deviations, bit_variances] = reference_fn(data);
[average_uniformity, sample_uniformities] = uniformity_fn(data);
[reliability, hd_intra] = reliability_fn(data, reference);
end

