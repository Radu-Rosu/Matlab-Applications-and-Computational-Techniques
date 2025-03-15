function[x] = tema4_CodreanuRadu_321AA(a1,a2,b)
n = size(a1,2);
x(n) = b(n) / a1(n);
    for i = n - 1 : -1 : 1
       x(i) = (b(i) - a2(i)*x(i+1)) / a1(i); 
    end
end