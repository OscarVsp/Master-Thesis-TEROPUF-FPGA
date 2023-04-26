clear all;
close all;


data = readmatrix('tero_limit_50.csv');

[reference, deviation] = reference_fn(data);

[average_uniformity, sample_uniformities] = uniformity_fn(data);

[reliability, hd_intra] = reliability_fn(data, reference);


average_uniformity
reliability