%% Marco Manzoni - Mat. 875568
clear all; clc; close all;

M = 2;              %number of MIMO channels
N_vect = 10:10:500;    %number of noise samples
rho_vect = 0.1:0.2:0.9;          %correlation coefficient 

%% Noise generation

MSE = zeros(1,length(N_vect));
index = 1;

for rho = rho_vect
    C = (1-rho).*eye(M)+rho.*ones(M,M);     %covariance matrix
    A = chol(C);
    
    
    for N = N_vect
       for i = 1:500
          n = randn(M,N);
          W = (A.')*n;    % correlated noise
          C_estim = (1/N)*W*(W.');
          D = abs(C-C_estim).^2;
          MSE(index) = MSE(index) + sum(D(:))/numel(C);
       end
          MSE(index) = MSE(index)/i;
          index = index + 1;
    end
    
    
    index = 1;
    semilogy(N_vect,MSE,'o-');
    hold on
end

xlabel("Number of samples");
ylabel("MSE")
title('MSE for covariance matrix estimation');
legend('\rho = 0.1','\rho = 0.3','\rho = 0.5','\rho = 0.7','\rho = 0.9')



