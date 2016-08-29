clear; 
close all;
clc;

% Load results generated from GenerateValues
load('SavSenK');

h3 = figure;

% Show examples
subplot(2,2,1);
x = rand(1,n);
y = gen_fun(x,n,l1,noise,numnoise,typ);
plot(x,y,'ro','Markersize',3);
grid on;
%xlabel('$X_1$','interpreter','latex');
%ylabel('$Y_2$','interpreter','latex');
title('$(X_1,Y_1)$','interpreter','latex');
ylim([-.2 1.2]);
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
%set(gca, 'XTick', []);
%set(gca, 'YTick', []);

subplot(2,2,2);
x = rand(1,n);
y = gen_fun(x,n,l2,noise,numnoise,typ);
plot(x,y,'bo','Markersize',3);
grid on;
%xlabel('$X_2$','interpreter','latex');
%ylabel('$Y_2$','interpreter','latex');
title('$(X_2,Y_2)$','interpreter','latex');
ylim([-.2 1.2]);
set(gca,'XTickLabel','')
set(gca,'YTickLabel','')
%set(gca, 'XTick', []);
%set(gca, 'YTick', []);

% Show the average value at the variation of k
subplot(2,2,[3 4]);
plot(ks,mean(meas1),'r','linewidth',2);
hold on;
plot(ks,mean(meas2),'b','linewidth',2);
%errorbar(alphas,mean(meas), std(meas));
grid on;
title('Intrinsic Dimensional Dependency (IDD)','interpreter','latex');
xlabel('$k$','interpreter','latex');
ylim([0 1.1]);
leg = legend('IDD$(X_1,Y_1)$','IDD$(X_2,Y_2)$');
set(leg,'interpreter','latex');
set(leg,'location','SouthEast');
set(h3, 'Position', [100 100 490 340])
set(h3,'PaperSize',[13.5 10.2],'PaperPositionMode','auto');
saveas(h3,['FigSenK'],'pdf');