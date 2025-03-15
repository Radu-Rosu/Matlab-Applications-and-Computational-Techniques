function [p, ok] = rauConditionata(n)
    if n > 0 && floor(n) == n
        givenRoots = zeros(1, n);
        %foundRoots = zeros(n, 1);
        ok = 1; %presupunem ca givenRoots == foundRoots
        for i=1:n
            givenRoots(i) = i; %vector cu radacinile polinomului p(x)
        end

        p = poly(givenRoots); %vector cu coeficientii lui p(x)
        fprintf('\n');
        foundRoots = roots(p);

        for i=1:n
                if givenRoots(1, i) ~= foundRoots(n-i+1, 1)
                    ok = 0;
                end
        end

        fprintf('foundRoots\n');
        for i=1:n
            fprintf('%.16f\n', foundRoots(i));
        end
   else 
        fprintf('n trebuie sa fie intreg si pozitiv\n');
   end
end
