lin = 7; col = 3; n = 5;

A = zeros(lin, col);
A = zeros(n);% matrice patratica
v = zeros(1,n);% nr linie
A = ones(lin, col);
x = size(A) % vector cu 2 elemente xxx for i=1:size(A) xxx nu asa ca nu stie(...)
            % sa transforme un vector in linie
[n, m] = size(A);
n = size(A,1); % nr de linii
m = size(A,2); % nr de coloane
y = size(A, ny); % pt tensor
help size % scrie rezultatul in linia de comanda
doc size  % deschide browser nou
I = eye(lin, col); % matricea identitate, se numeste "eye" ca in engl se zice la fel cu "I"
A = rand(lin, col);
v = [1 2 3]; % vector linie
v = v'; % transpus
v = [1;2;3]; % vector coloana
%.................................
%%
function [out1, out2, ..., outn] = nume(in1, in2) % fara ;
    f2(in1)
...
end
[out1, out2] ... % le afiseaza doar pe primele 2
[~,out2] % doar al 2lea
function x = f2(a)