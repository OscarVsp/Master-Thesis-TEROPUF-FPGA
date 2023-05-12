function [reliability, std_reliability, hd_intra] = reliability_fn(data, reference)
%RELIABILITY_FN Summary of this function goes here
%   Detailed explanation goes here
[size_sample, size_response] = size(data);

hamming = @(a,b) sum(xor(a,b));


hd_intra = zeros(1,size_sample);
for i=1:size_sample
    hd_intra(i) = hamming(reference, data(i,:))*100/size_response;
end
reliability = 100 - mean(hd_intra);
std_reliability = std(hd_intra);
end

