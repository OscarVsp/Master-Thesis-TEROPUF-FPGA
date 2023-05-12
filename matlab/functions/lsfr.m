function [new_state] = lsfr(state)
if length(state) ~= 10
    error("Length of state should be 10");
end
new_state = zeros(1, 10);
if state(10) ~= state(7)
    new_state(1) = 1;
else
    new_state(1) = 0;
end
new_state(2:10) = state(1:9);
end