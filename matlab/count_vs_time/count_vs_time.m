clear all;

limits = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 14, 16, 18, 20, 25, 35, 45, 60, 75, 100, 125, 150, 175, 200, 225, 250, 275, 300, 325, 350, 375, 400, 425, 450, 475, 500];
%file_prefix = "tero_4_count_limit_";
file_prefix = "tero_8_count_limit_";

n_cells = 64;

clock_freq = 1e8;

start_index = 1;
end_index = 30000;
n_sample = end_index - start_index + 1;

cells_variances = zeros(n_cells, length(limits));
cells_averages = zeros(n_cells, length(limits));
cells_average = zeros(1, length(limits));
times = zeros(1, length(limits));

variance_lim = zeros(1,n_cells);
for i=1:length(limits)
    data = readmatrix(file_prefix+string(limits(i))+'.csv');
    for j=1:n_cells
        cells_averages(j,i) = mean(data(start_index:end_index,j));
        cells_variances(j,i) = var(data(start_index:end_index,j));
    end
    cells_average(i) = mean(cells_averages(:,i));
    times(i) = (limits(i)*1e6)/clock_freq;
end

%% 
figure;
for i=1:length(limits)
    plot(times, cells_averages(i,:));
    hold on;
end
title("Average oscillations");
subtitle(string(n_sample)+" samples");
ylabel("Oscillations");
time_values = 0:0.25:5;
xticks(time_values);
time_labels = {'0 (0)','0.25 (25)','0.5 (50)','0.75 (75)','1 (100)','1.25 (125)','1.5 (150)','1.75 (175)','2 (200)','2.25 (225)','2.5 (250)','2.75 (275)','3 (300)','3.25 (325)','3.5 (350)','3.75 (375)','4 (400)','4.25 (425)','4.5 (450)','4.75 (475)','5 (500)',};
xticklabels(time_labels)
xlabel("Time [µs] (clock cycles)");

%%
figure;
for i=1:length(limits)
    plot(times(1:25), cells_averages(i,1:25));
    hold on;
end
title("Average oscillations (zoomed)");
subtitle(string(n_sample)+" samples");
ylabel("Oscillations");
time_values = 0:0.1:2;
xticks(time_values);
time_labels = {'0 (0)','0.1 (10)','0.2 (20)','0.3 (30)','0.4 (40)','0.5 (50)','0.6 (60)','0.7 (70)','0.8 (80)','0.9 (90)','1.0 (100)','1.1 (110)','1.2 (120)','1.3 (130)','1.4 (140)','1.5 (150)','1.6 (160)','1.7 (170)','1.8 (180)','1.9 (190)','2.0 (200)'};
xticklabels(time_labels)
xlabel("Time [µs] (clock cycles)");

%%
figure;
for i=1:length(limits)
    plot(times, cells_variances(i,:));
    hold on;
end
title("Oscillations variance");
subtitle(string(n_sample)+" samples");
ylabel("Variance");
time_values = 0:0.25:5;
xticks(time_values);
time_labels = {'0 (0)','0.25 (25)','0.5 (50)','0.75 (75)','1 (100)','1.25 (125)','1.5 (150)','1.75 (175)','2 (200)','2.25 (225)','2.5 (250)','2.75 (275)','3 (300)','3.25 (325)','3.5 (350)','3.75 (375)','4 (400)','4.25 (425)','4.5 (450)','4.75 (475)','5 (500)',};
xticklabels(time_labels)
xlabel("Time [µs] (clock cycles)");

%%
figure;
for i=1:length(limits)
    plot(times, cells_variances(i,:)./cells_average);
    hold on;
end
title("Oscillations variance normalized");
subtitle(string(n_sample)+" samples");
ylabel("Variance");
time_values = 0:0.25:5;
xticks(time_values);
time_labels = {'0 (0)','0.25 (25)','0.5 (50)','0.75 (75)','1 (100)','1.25 (125)','1.5 (150)','1.75 (175)','2 (200)','2.25 (225)','2.5 (250)','2.75 (275)','3 (300)','3.25 (325)','3.5 (350)','3.75 (375)','4 (400)','4.25 (425)','4.5 (450)','4.75 (475)','5 (500)',};
xticklabels(time_labels)
xlabel("Time [µs] (clock cycles)");