function [A] = g(A)
%%% Eliminare Gaussian?
% INPUTS:
%   A -- matrice aleatoare de dimensiune (n,n)
% OUTPUTS:
%   A -- matrice superior triunghiular? cu multiplicatorii gaussieni
%        în triunghiul inferior de dimensiune (n,n)

%% SOLUTION START %%
n = size(A,1);
M = zeros(n,n);
for k = 1 : n - 1
    for i = k + 1 : n
        M(i,k) = A(i,k) / A(k,k);
        A(i,k) = M(i,k);
    end
    for i = k + 1 : n 
        for j = k + 1 : n 
            A(i,j) = A(i,j) - A(i,k) * A(k,j);
        end
    end
end
%% SOLUTION END %%
end

