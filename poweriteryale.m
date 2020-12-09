%Problem 2a
%Power Iterate then compare to SVD

%SVD Analysis of Cropped Images

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

k = 50;
Iter = 50; 
%approxeig = NaN*ones(1,Iter+1);
v0 = randn(n,k);    %initial vector
v = v0;

%iterative scheme
for i = 1:Iter
    omega = A*v;
    maxeig = max(abs(omega));
    v = omega./maxeig;
    Lambda(i,:) = (max(v0)-maxeig).*maxeig; 
end

[U, S, V] = svd(A, 'econ');
pcolor(A)


