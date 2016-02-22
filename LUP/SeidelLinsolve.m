function [x, count] = SeidelLinsolve(A, b)

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
    
    BR = zeros(n);
    
    for i = 1:n
        BR(i, (i + 1):n) = A(i, (i + 1):n);
    end
    
    L = zeros(n);
    
    for i = 1:n
        L(i, 1:(i - 1)) = A(i, 1:(i - 1));
    end
    
    B = -(myinv(L + D)) * BR;
    c = ((L + D) \ b);
    
    BR = zeros(n);
    
    for i = 1:n
        BR(i, (i + 1):n) = B(i,(i + 1):n);
    end
    
    %normBR = max(sum(abs(BR), 2));
    

    xnext=B * x + c;
    count = 0;
    normBR = 0.5;
    r = 1e+13;
       
    while normBR / (1 - normBR) * r > e
        x = xnext;
        xnext = B * x + c;
        count = count + 1;
        
        r = max(abs(xnext - x));
    end
end

