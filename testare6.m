% Laborator 6 - testare programe
%colocviu: intra cate 5, primim o mica probl
%se da urm sistem, sa se rez cu crout,..., sa se introduca zerouri intr-un anumit vector
%deschide met put, ce face linia, dc utilizam tort, dc folosim matricea
%ortog si dc o utilizam, dc nu putem sa folosim elim gaussiana pt matrice
%inalte, ce face elim gaussiana

% Compresie imagini
k = 10;
compresie_dvs('protozoan.bmp', k);

% JQ
disp('JQ: ');
m = 10;
n = 7; 
A = randn(m,n);
[f,g,U,V] = JQ(A);
f = [diag(f); zeros(m-n,n)];
g = [diag(g,1); zeros(m-n,n)];
S = f + g;
B = A - U*S*V';
disp('Verificare corectitudine rezultat JQ: ');
disp(norm(B));