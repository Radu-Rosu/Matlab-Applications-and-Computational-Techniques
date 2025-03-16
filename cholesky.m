function [A] = cholesky(A)
%%% Factorizarea Cholesky

% INPUTS:
%   A -- matrice aleatoare de dimensiune (n,n)
% OUTPUTS:
%   A -- matrice in care triunghiul inferior e suprascris cu partea utila 
%   a matricii inferior triunghiulare L, astfel incat A = L*L'
%% SOLUTION START %%
n = size(A,1);
if A(1,1) <= 0
    disp('A nu este pozitiv definita');
    return;
end
A(1,1) = sqrt(A(1,1));
for i = 2:n
    A(i,1) = A(i,1)/A(1,1);
end
for k = 2:n
    alpha = A(k,k) - dot(A(k,1:k-1),A(k,1:k-1));
    if alpha <= 0
        disp('A nu este pozitiv deifinita');
        break;
    end
    A(k,k) = sqrt(alpha);
    if k == n
        break;
    end
    for i = k+1:n
        A(i,k) = (A(i,k) - dot(A(i,1:k-1),A(k,1:k-1)))/A(k,k);
    end
end
%% SOLUTION END %%
end