%% Marco Manzoni - Mat. 875568
clear all; clc; close all;

M = 3;              %number of MIMO channels
N = 100000;    %number of noise samples
rho = 0.8;          %correlation coefficient 

%% Noise generation
n = randn(M,N);
C = zeros(M,M);

% Covariance matrix
for i = 1:M
    for j = 1:M
        if abs(i-j) <= 1
            C(i,j) = rho^abs(i-j);
        end
    end
end

[~,V] = eig(C);



% A = chol(C);
% A = A.';
% W = A*n;    % correlated noise