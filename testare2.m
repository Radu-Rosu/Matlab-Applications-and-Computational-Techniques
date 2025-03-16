%Testare alg: s_inf_tr, s_sup_tr, g
n = 8;
b = randn(n,1);
A = randn(n,n);

% Sistem Lx=b
L = tril(A);
x = s_inf_tr(L,b);
disp('Verificare Lx=b: ');
disp(norm(L*x - b));

% Sistem Ux=b
U = triu(A);
x = s_sup_tr(U,b);
disp('Verificare Ux=b: ');
disp(norm(U*x - b));

%Algoritmul G
B = A;
d = b;
A = g(A);
disp('Matricea superior triunghiulara rezultata din G: ');
disp(triu(A));
disp('Multiplicatorii sunt coloanele matricei: ');
disp(tril(A,-1));
for k = 1:n-1
    for i = k+1:n
        b(i) = b(i) - A(i,k)*b(k);
    end
end
disp('Termenii liberi dupa aplicarea G: ');
disp(b);
x = s_sup_tr(triu(A),b);
disp('Verificare rezolvare sistem cu alg G: ');
disp(norm(B*x - d));

%Verificare GPP si GPC => SL_GPP, SL_GPC