
% Descompunerea valorilor singulare si rangul numeric al numei matrici

% A - matrice aleatoare de dimensiune (m, n)
% B - matrice aleatoare de dimensiune (m, r)
% C - matrice aleatoare de dimensiune (r, n)
% D - matrice aleatoare de dimensiune (m, n)
% sigma - scalar


%% SOLUTION START %%


% Descrieti pe scurt ce se intampla cu valorile singulare la cresterea lui sigma.


% Cum trebuie ales epsilon in ecuatia (6.10) din indrumarul de laborator 
% astfel incat rang(A) sa fie r?

m = 10;
n = 6;
r = 3;
B = randn(m,r);
C = randn(r,n);
D = randn(m,n);
sigma = 0;           % cazul 1
A = B*C + sigma*D;
v = svd(A);          % valorile singulare ale lui A
disp('Valorile singulare ale matricei A: ');
disp(v);
rang = rank(A,v(r+1));
disp('Rangul este: ');
disp(rang);         % rangul = nr valorilor nesingulare nenule 

sigma = 2*10^(-1);           % cazul 2
A = B*C + sigma*D;
v = svd(A);          % valorile singulare ale lui A
disp('Valorile singulare ale matricei A: ');
disp(v);
rang = rank(A,v(r+1));
disp('Rangul este: ');
disp(rang);         % rangul = nr valorilor nesingulare nenule (cu o toleranta)
                    % Valorile mici sunt aproximate la 0 

%% SOLUTION END %%