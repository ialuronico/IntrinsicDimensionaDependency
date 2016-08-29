clear;
close all;
clc;

% Generate a particular relationship and computes the
% average value of IDD (Intrinsic Dimensional Dependency)

nsim = 3;
n = 1000;
% Generate a relationship accoding to newGenDat.m
typ = 4;

k = 250; % number of nearest neighbors

ds = [2:5];
iddV = zeros(length(ds),nsim);
for i=1:length(ds)
  D = ds(i)
  parfor s=1:nsim
    X = newGenDat(typ,D,n);
    iddV(i,s) = IDD(X,k);
  end
end

save(['Rel_' num2str(typ) '_n' num2str(n)]);
disp('Done.');