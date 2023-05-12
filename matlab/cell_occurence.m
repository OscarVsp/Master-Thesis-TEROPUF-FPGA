array_0 = [11, 9, 8, 5, 7, 5, 5, 3, 8, 3, 6, 6, 6, 8, 2, 4, 10, 4, 3, 3, 4, 7, 9, 3, 6, 3, 5, 6, 3, 3, 4, 2];
array_1 = [16, 9, 8, 5, 7, 4, 5, 3, 8, 3, 4, 6, 6, 8, 2, 4, 10, 4, 3, 3, 4, 5, 9, 3, 6, 3, 5, 6, 3, 3, 4, 2];

array_th = [31, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32];

fig = figure;
plot(1:32, array_0); hold on;
plot(1:32, array_1); hold on;
plot(1:32, array_th)
xlabel("cell index");
ylabel("nb of occurence");
legend("array 1 - 171", "array 2 - 171", "array 1 & 2 - 1023");

saveas(fig, "cell_occurence_171.png");