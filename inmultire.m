function[C] = inmultire(A, D)
n = size(A, 1);
C = zeros(n,n);
    for i = 1 : n
        for j = i : n
            C(i, j) = A(i, j)*D(j);
        end
    end
end