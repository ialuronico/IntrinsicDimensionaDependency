function [ IDD_ ] = IDD( X,k)
% Intrinsic Dimensional Dependency (IDD)
IDD_ = 0;
[D n] = size(X);

% The variables cannot be constant
notConst = zeros(1,D);
for i=1:D
  notConst(i) = ~all(X(i,1) == X(i,:));
end
D = sum(notConst);
if (D <= 1)
  return;
end
X = X(logical(notConst),:);

% Copula transformation
X = copula(X);
% Adding noise because there might be duplicated points
X = X + 1e-6*randn(D,n);

IDDv = zeros(D,1);
for j=1:D
  v = dim(X(j,:),k);
  IDDv(j) = v;
end
vv = dim(X,k);
IDD_ = (sum(IDDv) - vv)./(sum(IDDv) - max(IDDv));

end

