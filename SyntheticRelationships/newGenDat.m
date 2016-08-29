function [ X ] = newGenDat( type, D, n )
% Relationships A, B, C, and D discussed in the paper
switch(type)
  case 1 % (Rel D)
    X = rand(D,n);
  case 2 % (Rel A)
    lin = rand(1,n);
    X = repmat(lin,D,1);
  case 3 % (Rel C)
    X = rand(D-1,n);
    funType = 2;
    if (D > 2)
      y = gen_fun_multi(X,n,0,0,1,funType); % Parabola
    else
      y = gen_fun(X,n,0,0,1,funType);
    end
    X = [X; y];
  case 4 % (Rel B)
    lin = rand(1,n);
    v = randi(2,1,n);
    v(v==2) = 20;
    v = v.*lin;
    X = [lin; repmat(v,D-1,1)];    
end

