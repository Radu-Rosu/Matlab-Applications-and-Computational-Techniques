x = 0.1;
max_iter = 60;
iter = 1;
while iter <= max_iter
    if x <= 0.5
        x = 2 * x
    else 
        x = 2 * x - 1
    end
    iter = iter + 1;
end

% observam ca se cumuleaza erori