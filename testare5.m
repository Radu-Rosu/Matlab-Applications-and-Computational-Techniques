%% COLOCVIU: utilizand alg cholesky, rez urm sistem + verificarea rezultatului (avem voie cu laptop si toate programele, va fi 10 min)
tol = 10^(-8);
maxiter = 1000;
n = 7;
v = randn(n,1);  % valori proprii - impunem spectru
disp('v = ');
disp(v);
A = diag(v);     % A matrice reala cu valorile proprii pe diagonala
T = randn(n);
A = T*A*inv(T); % construim o matrice asemenea cu A (are acelasi spectru cu A initial)
y = randn(n,1);  % y va deveni vector propriu pentru A

%  MP
disp('Metoda puterii: ');
y = MP(A,tol,maxiter,y); % vector propriu A asociat val proprii dominante (cea mai mare in modul)
[U,V] = eig(A);
disp('U = ');            % matricea U densa care contine pe col vectorii proprii ai lui A, pe coloane, coresp valorilor pr din V
disp(U);
disp('V = ');            % matricea V diag care contine valorile proprii ale lui A
disp(V);
maxim = 0;               % valoarea proprie dominanta
pozitie = 0;
for i = 1:n
    if abs(V(i,i)) > maxim
        maxim = abs(V(i,i));
        pozitie = i;
    end
end
disp('Pozitia valorii proprii dominante este: ');
disp(pozitie);           % pe coloana 'pozitie' este vectorul propriu asociat val. prop. dominante
disp('Din MP y = ');
disp(y);
disp('Verificare corectitudine rezultat: ');
disp(norm(abs(U(:,pozitie))-abs(y)));
disp(abs(1 - abs(U(:,pozitie)'*y)));

%  MPI
disp('Metoda puterii inverse: ');
yi = randn(n,1);
yi  = MPI(A,tol,maxiter,yi);
disp('U = ');            % folosim U si V calculate mai sus (nu se modifica, A este aceeasi) 
disp(U);
disp('V = ');            
disp(V);
disp('Verificarea rezultatului se face vizual: ');
disp('Din MPI yi = ');
disp(yi);                % yi este un vetor propriu unitar pentru A (nu neaparat pentru valoare proprie dominanta)

%  HQ
disp('Algoritmul HQ: ');
% pentru matrice reale (folosim A de mai sus)
disp('Matrice reala: ');
disp('A = ');
disp(A);
[Q,H]=HQ(A);
disp('Matricea Hessenberg rezultata: ');
disp(H);
disp('Verificare corectitudine rezultat: ');
disp(norm(H-hess(A)));

% pentru matrice random
disp('Matrice random: ');
B = randn(n);
disp('B = ');
disp(B);
[Q,H]=HQ(B);
disp('Matricea Hessenberg rezultata: ');
disp(H);
disp('Verificare corectitudine rezultat: ');
disp(norm(H-hess(B)));  % algoritmul HQ functioneaza doar pentru matrice reale

%  QR
A = randn(n);
disp('QR: ');
S = QR(A,tol,maxiter);
disp('Forma Schur este S = ');
disp(S);
disp('Folosind o functie Matlab: ')
A_s=schur(A);          % Functia matlab intoarce o matrice egala in modul cu cea calculata
disp(A_s);              
disp(norm(abs(S) - abs(A_s)));
% Fiecare element de sub diagonala principală creează bloc de 2X2 și sunt
% val proprii complexe conjugate