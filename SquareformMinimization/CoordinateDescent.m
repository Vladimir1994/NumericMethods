function [x, count] = coordinate(A, b)

    x = [1; 0; 0];
    e = 1e-12;
    
    n = length(A);
    mineig = min(eig(A));
    E = eye(n);
    q = zeros(n, 1);
    count = 0;   
    crd = 1;
    
    for i = 1:n
        q(i) = E(i, crd);
    end
    
    mu = -q' * (A * x + b)/(q' * A * q); 
    xNext = x + mu * q;
    z = A * xNext + b;
    norm = max(abs(z));
    x = xNext; 
    
    while norm / mineig > e 
        
        crd = crd + 1;
        
        for i = 1:n
            q(i) = E(i, crd);
        end
        
        if crd == n
            crd = 0;
            count = count + 1;
        end
        
        mu = -q' * (A * x + b)/(q' * A * q); 
        xNext = x + mu * q;
        z = A * xNext + b;
        norm = max(abs(z));
        x = xNext;        
    end
end

