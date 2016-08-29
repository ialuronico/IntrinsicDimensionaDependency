clear; 
close all;
clc;

% Load results from 
% ComputeGenfunMeas.m
load('SavGenFun');

h3 = figure;

% Generate example
subplot(1,2,1);
x = rand(1,n);
y = gen_fun_white(x,n,l,numnoise,typ);  

plot(x,y,'bo','Markersize',3);
grid on;
xlabel('$X_1$','interpreter','latex');
ylabel('$X_2$','interpreter','latex');

subplot(1,2,2);
plot(alphas,mean(meas),'k','linewidth',2);
grid on;
title('$\widehat{\textup{dim}}_\alpha(X_1,X_2)$','interpreter','latex');
xlabel('$\alpha$','interpreter','latex');
set(h3, 'Position', [100 100 430 120])
set(h3,'PaperSize',[10.7 3.4],'PaperPositionMode','auto');
saveas(h3,'FigGenfunAlp','pdf');