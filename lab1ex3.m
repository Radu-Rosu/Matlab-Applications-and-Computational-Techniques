function [C] = lab1ex3(A, B)  % inmultire
C = zeros(size(A,1),size(B,2));
C_mat = zeros(size(A,1),size(B,2));
%tic                    % numara cat timp ia calculul
   for i=1:size(A,1)
       for j=1:size(B,2)
           %for k=1:size(B,1)
               C(i,j) = C(i,j) + A(i,:)*B(:,j);
           %end
       end
   end
%
%toc
%norm(C-C_mat,'fro');
%tic
%    C_mat = A * B;
%toc
end