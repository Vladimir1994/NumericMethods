function [invA] = myinv(A)
    
    dim = length(A);
    [L, U, P, ~] = LUP(A);
    tvar = zeros(dim);
    invA = zeros(dim);
    
    for t = 1:dim
        tvar(1, t) = P(1, t);
        for m = 2:dim
            sum = 0;
            for l = 1:(m - 1)
                sum = sum + L(m, l) * tvar(l, t);
            end
            tvar(m, t) = P(m, t) - sum;
        end
    end 

    for t = 1:dim
        invA(dim, t) = tvar(dim, t) / U(dim, dim);
        for m = (dim - 1):-1:1
            sum = 0;
            for l = (m + 1):dim
                sum = sum + U(m, l) * invA(l, t);
            end
            invA(m, t) = (tvar(m, t) - sum) / U(m, m);
        end   
    end
end

