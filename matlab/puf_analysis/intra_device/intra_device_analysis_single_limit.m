clear all;
close all;


file = "tero_8_raw_200";

data = readmatrix(file+'.csv');

[size_sample, size_response] = size(data);
[reference, deviations, variances, average_uniformity, average_reliability, sample_uniformities, hd_intra] = intra_device_analysis_fn(data);

figure;
plot(1:size_response, variances)
xlabel("TERO cell index");
ylabel("Variance");

title("TERO cells reliability distribution.");
subtitle(string(size_sample)+" samples | avr uniformity="+string(average_uniformity)+" | avr reliability="+string(average_reliability));


