%Problem 2b
%Reproduce SVD using Random Sampling
clear all; 
close all; 
clc;  

first_folder = 'CroppedYale';  
myimage = [];
Image = [];
myfiles = [];

folder = dir(fullfile(first_folder, 'Y*'));
for i = 1:38
    current = fullfile(first_folder, folder(i).name);
    myfiles = dir(fullfile(current, 'y*'));
    
    for k = 1:64
        current_file = fullfile(current,myfiles(k).name);
        currentim = imread(current_file);
        myimage(:,k) = currentim(:);
    end
    Image(:,i) = myimage(:);
end

finalimage = [];
finalimage = imresize(Image, [32256,64]);

A = finalimage;
[m,n] = size(A);
K = 10;
 
omega = randn(n,K);    %random projections
Y = A*omega;
size(Y);
 
[Q,R] = qr(Y, 0);
size(Q);
 
B = (Q.')*A;
[U, S, V] = svd(B, 'econ');


pcolor(abs(R)), colorbar
