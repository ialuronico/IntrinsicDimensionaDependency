function [ dim_ ] = dim( X, k)

[d, n]= size(X);

% Break degeneracy
intens = 1e-6;
X = X + intens*rand(d,n);

% Build a KD tree
Xt = X';
Mdl = KDTreeSearcher(Xt);
% Find the k nearest neighbors for each point
[~, Dsort] = knnsearch(Mdl,Xt,'k',k + 1);
Dsort = Dsort';

% Compute the local intrinsic dimensionality at each point
IDX = -k./sum((log(Dsort(2:k+1,:)) - repmat(log(Dsort(k+1,:)),k,1)));
% Return the average value
dim_ = mean(IDX);

end


