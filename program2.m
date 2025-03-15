function [y] = program2(x,n)
    sum1 = 0;
    sum2 = 0;
    for i = 1 : n
        sum1 = sum1 + x(i);
        sum2 = x(i) + sum2;
    end
    if(sum1==sum2)
            fprintf('comutativitate demonstrata\n');
        else
            fprintf('comutativitate infirmata\n');
    end
    fprintf('suma 1 = %.53f\n', sum1);
    fprintf('suma 2 = %.53f', sum2);
end