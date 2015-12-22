function [x, count] = gradient(A, b)

    x = [1; 0; 0];
    e = 1e-12;
    
    mineig = min(eig(A));
    count = 0;
    
    q = (A * x + b);
    mu = - q' * q / (q' * A * q);
    xNext = x + mu * q;
    z = A * xNext + b;
    norm = max(abs(z));
    
    while norm / mineig > e  
        q = (A * x + b);
        mu = - q' * q / (q' * A * q);
        xNext = x + mu * q;
        z = A * xNext + b;
        norm = max(abs(z));
        x = xNext;
        count = count + 1;
    end
end

