function [y] = program(x, n)
    perm = 10;
    y = zeros(10, 1, "double");
    for j = 1 : perm
        p = randperm(n);
        for i = 1 : n
            y(j) = y(j) + x(p(i));
        end
        fprintf('suma elementelor lui x la permutarea %d este %.53f \n', j, y(j));
    end
end