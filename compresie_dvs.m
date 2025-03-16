function compresie_dvs(nume_fisier, k)

% INPUTS:
%  nume_fisier - sir de caractere reprezentand numele imaginii
%  k - rangul aproximarii

%% SOLUTION START %%
A = im2double(imread(nume_fisier)); %im2double face conversia din uint8, tipul citit din A
r = rank(A);
[U,S,V] = svd(A);
B = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
imshow(B);
imwrite(B,'compresie.bmp');
%% SOLUTION END %%

end