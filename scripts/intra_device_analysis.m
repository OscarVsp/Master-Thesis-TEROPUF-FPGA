clear all;
close all;
limits = [5, 10, 25, 50, 75, 100, 125, 150, 175, 200, 225, 250, 300, 350, 400, 450, 500, 600, 700, 800, 900, 1000, 1250, 1500, 1750, 2000, 2500, 3000, 3500, 4000, 4500, 5000];
uniformities = zeros(1, length(limits));
reliabilities = zeros(1, length(limits));
for i=1:length(limits)
    i
    data = readmatrix('ro_limit_'+string(limits(i))+'.csv');
    [uniformities(i), reliabilities(i)] = intra_device_analysis_fn(data);
end
%% 

figure;
plot(limits, uniformities);
title("Uniformity");
xlabel("Ref counter");
ylabel("Uniformity");
figure;
plot(limits, reliabilities);
title("Reliability");
xlabel("Ref counter");
ylabel("Reliability");