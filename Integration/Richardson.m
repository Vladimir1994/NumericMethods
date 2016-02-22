function [dim, int, m] = Richardson(accuracy, a, b, beta, IntMethod)

    [m, H, s] = Aitken(0.5, a, b, beta, IntMethod);
    lenH = abs(a - b) / H;
    Hstack = [lenH * 2 lenH];

    A = [1 - (lenH * 2) ^ m;
         1 - lenH ^ m];
     
    B = [s(length(s) - 3); s(length(s) - 2)];
    
    x = linsolve(A, B);
           
    cnt = 2;
    
    while(x(end) * Hstack(end) ^ m > accuracy)
        cnt = cnt - 1;
        H = H * 2; 
        lenH = abs(a - b) / H;
        Hstack = [Hstack lenH];
        
        if(cnt >= 1)
            B = [B; s(length(s) - cnt)];
        else
            B = [B; Integrate(a, b, H, beta, IntMethod)];
        end
        
        L = length(A);
        A = zeros(L + 1);
        for i = 1:(L + 1)
            A(i, 1) = 1;
        end
       
        for i = 1:(L + 1)
            for j = 2:(L + 1)
                A(i, j) = -(Hstack(i) ^ (m + (j - 2)));
            end
        end
        
        x = linsolve(A, B);
    end
    
    dim = length(A);
    int = B(length(B));
end

