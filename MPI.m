function [y] = MPI(A,tol,maxiter,y)
%% Metoda puterii inverse
% INPUTS:
%   A       -- matrice aleatoare de dimensiune (n, n),   
%   tol     -- nivel de tolerant? (0 < tol < 1),
%   maxiter -- numar maxim de iteratii
%   y       -- vector pentru aproximatia initiala(n,1)
%
% OUTPUT:
%   y -- vector propriu normalizat al matricei date (n, 1)


%% SOLUTION START %%
n = size(A,1);
y = y / norm(y);
i = 0; e = 1;
n = size(A,1);
while e > tol
    if i > maxiter
        fprintf('S-a atins numarul maxim de iteratii fara a se fi obtinut nivelul prescris al tolerantei');
        return;
    end
    miu = y'*A*y; 
    z = (miu*eye(n) - A)*(y.^(-1)); %\y
    z = z / norm(z);
    e = abs(1 - abs(z'*y));
    y = z;
    i = i + 1;
end
%% SOLUTION END %%

end