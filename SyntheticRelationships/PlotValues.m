clear;
close all;
clc;

% Plot the values of IDD for the relationships computed with
% GenerateValues.m
n = 1000;

h = figure;

typ = 2;
load(['Rel_' num2str(typ) '_n' num2str(n)]);
subplot(1,4,1);
grid on;
hold on;
plot(ds,mean(iddV,2),'k-','linewidth',2);
title(['Relationship A'],'interpreter','latex');
xlabel(['Number of variables $D$'],'interpreter','latex');
ylim([-.1 1.1]);

typ = 4;
load(['Rel_' num2str(typ) '_n' num2str(n)]);
subplot(1,4,2);
grid on;
hold on;
plot(ds,mean(iddV,2),'k-','linewidth',2);
title(['Relationship B'],'interpreter','latex');
xlabel(['Number of variables $D$'],'interpreter','latex');
ylim([-.1 1.1]);

typ = 3;
load(['Rel_' num2str(typ) '_n' num2str(n)]);
subplot(1,4,3);
grid on;
hold on;
plot(ds,mean(iddV,2),'k-','linewidth',2);
title(['Relationship C'],'interpreter','latex');
xlabel(['Number of variables $D$'],'interpreter','latex');
ylim([-.1 1.1]);

typ = 1;
load(['Rel_' num2str(typ) '_n' num2str(n)]);
subplot(1,4,4);
grid on;
hold on;
plot(ds,mean(iddV,2),'k-','linewidth',2);
title(['Relationship D'],'interpreter','latex');
xlabel(['Number of variables $D$'],'interpreter','latex');
ylim([-.1 1.1]);

legv = {'IDD'};
leg = legend(legv);
set(leg,'interpreter','latex');

set(h, 'Position', [150 150 940 150])
set(h,'PaperSize',[20.8 4.4],'PaperPositionMode','auto');
saveas(h,['bias_n' num2str(n)],'pdf');




