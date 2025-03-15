function[L,U] = tema6_CodreanuRadu_321AA(A)
    n = size(A,1);
    L = zeros(n,n);
    U = zeros(n,n) + eye(n,n);
    % pentru k = 1 se face implementarea separat, inainte de calculul
    % pentru restul k = 2:n, deoarece apar indecsi "k-1", nedefiniti pt k=1
    L(1,1) = A(1,1);
    L(2,1) = A(2,1);
    for j = 2:n
        U(1,j) = A(1,j) / L(1,1);
    end

    for k = 2 : n
        L(k,k) = A(k,k) - L(k,k-1) * U(k-1,k);
        
        if k < n
            L(k+1,k) = A(k+1,k);
        end

        for j = k+1:n
            U(k,j) = (A(k,j) - L(k,k-1)*U(k-1,j)) / L(k,k);
        end
    end
end

  