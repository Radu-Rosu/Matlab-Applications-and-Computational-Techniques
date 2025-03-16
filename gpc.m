function [A, p, q] = gpc(A)
%%% Eliminare Gaussian? cu pivotare complet?
% INPUTS:
%   A -- matrice aleatoare de dimensiune (n,n)
% OUTPUTS:
%   A -- matrice superior triunghiular? cu multiplicatorii gaussieni
%        în triunghiul inferior de dimensiune (n,n)
%   p -- vectorul de permut?ri la nivel de linie
%   q -- vectorul de permut?ri la nivel de coloan?

%% SOLUTION START %%
n = size(A,1);
p = zeros(n,1);
q = zeros(n,1);

for i = 1 : n - 1
    p(i) = i;
    q(i) = i;
end

for k = 1 : n - 1
    for i = k : n
        for j = k : n
            if abs(A(p(k),q(k))) < abs(A(i,j))
               p(k) = i;
               q(k) = j;
            end
        end
    end

    for j = k : n 
        aux = A(k,j);
        A(k,j) = A(p(k),j);
        A(p(k),j) = aux;
    end

    for i = 1 : n 
        aux = A(i,k);
        A(i,k) = A(i,q(k));
        A(i,q(k)) = aux;
    end
    
    for i = k + 1 : n 
        miu = A(i,k) / A(k,k);
        A(i,k) = miu;
    end
    
    for i = k + 1 : n
        for j = k + 1 : n 
            A(i,j) = A(i,j) - A(i,k) * A(k,j);
        end
    end
end
%% SOLUTION END %%
end