function [x, count] = JacobyLinsolve(A, b)

    n = length(A);
    x = ones(n, 1);
    D = zeros(n);
    e = 1e-12;
    
    for i = 1:n
        D(i, i) = A(i, i);
    end
    
    invD = zeros(n);
    
    for i = 1:n
        invD(i, i) = 1 / A(i, i);
    end
    
    U = zeros(n);
    
    for i = 1:n
        U(i, (i + 1):n) = A(i, (i + 1):n);
    end
    
    L = zeros(n);
    
    for i = 1:n
        L(i, 1:(i - 1)) = A(i, 1:(i - 1));
    end
    
    T = -invD * (L + U);
    C = invD * b;
    
    %norm = max(sum(abs(T), 2));

    xnext = T * x + C;
    count = 0;
    norm = .5;
    r = 1e+13;
    
    while (norm / (1 - norm) * r > e) && (count < 10000)
        x = xnext;
        xnext = T * x + C;
        count = count + 1;

        r = max(abs(xnext - x));
    end
end

