clear all;
close all;

prefix = "tero_8_raw";
clock_freq = 1e8;
limits = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 24, 26, 28, 30, 35, 45, 60, 75, 100, 125, 150, 175, 200];

uniformities = zeros(1, length(limits));
reliabilities = zeros(1, length(limits));

data = readmatrix(prefix+'_'+string(limits(1))+'.csv');
[size_sample, size_response] = size(data)

for i=1:length(limits)
    data = readmatrix(prefix+'_'+string(limits(i))+'.csv');
    [~, ~, ~, uniformities(i), reliabilities(i), ~, ~] = intra_device_analysis_fn(data);
end

%%
figure;
subplot(2,1,1);
plot(limits, uniformities);
xlabel("Acquisition time [NB clock] (clock frequency="+string(clock_freq/1e6)+" MHz)");
ylabel("Uniformity");

subplot(2,1,2);
plot(limits, reliabilities);
xlabel("Acquisition time [NB clock] (clock frequency="+string(clock_freq/1e6)+" MHz)");
ylabel("Reliability");



