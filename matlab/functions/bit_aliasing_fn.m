function [bits_aliasing] = bit_aliasing_fn(data)
%BIT_ALIASING Summary of this function goes here
%   Detailed explanation goes here
[size_response, size_devices] = size(data);
bits_aliasing = zeros(1,size_response);
for i=1:size_response
    bits_aliasing(i) = sum(data(i,:))*100/size_devices;
end
end

