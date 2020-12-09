%Prob 1b
%Power Iterations
%stored A from initial random

clear all; close all; clc
A = randi(100, 20,15);
[m,n] = size(A);

Iter = 50; 
approxeig = NaN*ones(1,Iter+1);
v = ones(n,1);    %initial vector

%iterative scheme
for k = 1:Iter
    omega = A*v;
    maxeig = max(abs(omega));
    approxeig(k+1) = maxeig;
    v = omega./maxeig;
    while v < 10^(-6)    
        R(k) = maxeig;
        V(k) = v(1);
    end
    
end

[U, S, V] = svd(A, 'econ')