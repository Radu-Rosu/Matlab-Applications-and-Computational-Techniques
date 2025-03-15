function [solutie] = tema9_CodreanuRadu_321AA(a, b, toleranta, Nmax)
    f_a = functie(a);
    if f_a == 0.0
        solutie = f_a;
        return;
    end
    f_b = functie(b);
    if f_b == 0.0
        solutie = f_b;
        return;
    end
    if f_a * f_b > 0
        error('f(a) si f(b) nu au semne contrare');
    end
    
    for i = 1 : Nmax
        c = (a + b) / 2;
        if functie(c) == 0 || ((b - a) / 2) < toleranta
            solutie = c;
            return;
        end
        if sign(functie(c)) == sign(functie(a))
            a = c;
        else
            b = c;
        end
    end
    error('Numarul maxim de iteratii a fost atins');
end