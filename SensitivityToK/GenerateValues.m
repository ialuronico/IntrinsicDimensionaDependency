close all;
clear;
clc;

nsim = 3;
n = 1000; 
ks = (10:10:400);
typ = 2; % Generate parabolic relationship
l1 = 0; % level of noise for (X1,Y1)
l2 = 1; % level of noise for (X2,Y2)
meas1 = zeros(nsim,length(ks));
meas2 = zeros(nsim,length(ks));

% Other noise parameters
numnoise = 30; % The number of different noise levels used
noise = 3;  % A constant to determine the amount of noise.

for i=1:length(ks)  
  k = ks(i);
  disp(['k ' num2str(k)]);
  parfor s=1:nsim      
    disp(s);
    
    % Generate (X1,Y1)
    x = rand(1,n);
    y = gen_fun(x,n,l1,noise,numnoise,typ);
    
    val = IDD([x; y],k);
    meas1(s,i) = val;
    
    % Generate (X2,Y2)
    y = gen_fun(x,n,l2,noise,numnoise,typ);
    
    val = IDD([x; y],k);
    meas2(s,i) = val;
  end
end

disp('Done.');
save('SavSenK');

