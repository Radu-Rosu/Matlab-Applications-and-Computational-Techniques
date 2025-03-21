function [y] = MP(A,tol,maxiter,y)
%% Metoda puterii
% INPUTS:
%   A       -- matrice aleatoare de dimensiune (n, n),   
%   tol     -- nivel de tolerant? (0 < tol < 1),
%   maxiter -- numar maxim de iteratii
%   y       -- vector pentru aproximatia initiala(n,1)
%
% OUTPUT:
%   y -- vector propriu normalizat asociat valorii proprii
%        dominante a matricei date(n, 1)


%% SOLUTION START %%
y = y / norm(y);
i = 0; e = 1;
n = size(A,1);
while e > tol
    if i > maxiter
        fprintf('S-a atins numarul maxim de iteratii fara a se fi obtinut nivelul prescris al tolerantei');
        return;%disp in loc de fprintf si break pt return
    end
    z = A*y; 
    z = z / norm(z);
    e = abs(1 - abs(z'*y));
    y = z;
    i = i + 1;
end
%% SOLUTION END %%

end