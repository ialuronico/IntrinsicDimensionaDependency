function [Xc] = copula(X)
  [D n] = size(X);
  Xc = tiedrank(X')'/n;
end