clear all; close all; clc;

A = [99	38	27	28	33	31	14	48	29	26;
    38	69	38	43	15	17	47	15	16	15;
    27	38	93	29	36	47	43	2	46	23;
    28	43	29	89	16	30	47	24	16	21;
    33	15	36	16	91	39	16	41	30	24;      
    31	17	47	30	39	5	23	25	5	14;
    14	47	43	47	16	23	39	47	36	22;
    48	15	2	24	41	25	47	47	42	35;
    29	16	46	16	30	5	36	42	57	9;
    26	15	23	21	24	14	22	35	9	65];    %stored A for accuracy
 
[m,n] = size(A);

v0 = [1;1;1;1;1;1;1;1;1;1];  %initial eigvector guess
r = (v0.');
lambda0 = (r*A*v0);   %inital eigval guess

tol = 10^(-6);
iter = 50;
EIG = [];
v = v0;
lambda = lambda0;
approxlambda = NaN*ones(1,iter+1);
count = 1;

for k = 1:iter
            p = (A-lambda*eye(n));
            w = inv(p) * v;
            y = w / norm(w);
            lambda = y.' * A * y;
            
            if  norm( w )  < tol
                break;
            end
            
            EIG(:,1) = lambda;
            count = count +1;
end

eig = eigs(A)


