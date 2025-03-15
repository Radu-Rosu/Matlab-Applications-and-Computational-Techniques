function[L] = tema7_CodreanuRadu_321AA(A)
    n = size(A,1);
    L = zeros(n,n);
    % pentru k = 1 se face implementarea separat, inainte de calculul
    % pentru restul k = 2:n, deoarece apar indecsi "k-1", nedefiniti pt k=1
    L(1,1) = sqrt(A(1,1));
    L(2,1) = A(1,2) / L(1,1);
    for k = 2:n
        alpha = A(k,k) - L(k,k-1)*L(k,k-1);
        disp(alpha);
        if alpha < 0
            fprintf('A nu este pozitiv definita');
            break;
        end
        L(k,k) = sqrt(alpha);
        if k<n
            L(k+1,k) = A(k,k+1) / L(k,k);
        end
    end
end

%n=50;
%a = abs(randn(1, n)) + 1;
%b = abs(randn(1, n-1));
%A = diag(a) + diag(b, 1) + diag(b, -1);
%A = A + e*eye(n);
%A = double(A);
%[~,p] = chol(A)
%k = cond(A);
%fprintf('valori ale alpha din timpul executiei programului');
%L = tema7_CodreanuRadu_321AA(A);
%norma = norm(A - L*L','fro') / norm(A,'fro')

%for i=1:100
%    n=50;
%    a = abs(randn(1, n)) + 1;
%    b = abs(randn(1, n-1));
%    A = diag(a) + diag(b, 1) + diag(b, -1);
%    A = A + e*eye(n);
%    A = double(A);
%    [~,p] = chol(A);
%    if p == 0
%       break;
%   end
%end
