% Prob 1a
% Find ground truth eigenvals & eigvecs

clc;close all;clear all;

M = randi(50,10);
A = (M + transpose(M))/2;

[V,D] = eigs(A, 10);

eigval = eigs(A, 10);
