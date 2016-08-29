close all;
clear;
clc;

% Estimate dim_alpha for a particular relationship
% to see how alpha differs

nsim = 3;
n = 1000;
alphas = (1:0.1:3);
typ = 7; % This is the circle relationship
l = 3; % Amount of white noise
% Other noise parameters
numnoise = 30; % The number of different noise levels used
noise = 3;  % A constant to determine the amount of noise. It is just another parameter 

k = 30; % number of nearest neighbors

meas = zeros(nsim,length(alphas));
for i=1:length(alphas)  
  alpha = alphas(i);
  disp(['alpha ' num2str(alpha)]);
  parfor s=1:nsim      
    disp(s);
    x = rand(1,n);
    y = gen_fun_white(x,n,l,numnoise,typ);
    val = dim_alpha([x;y],k,alpha);
    meas(s,i) = val;
  end
end

disp('Done.');
save('SavGenFun');

