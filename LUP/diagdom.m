function [matrix, vect] = diagdom(n)

    E = 1e-6;
    
    matrix = round(200 * rand(n) - 100);
    vect = round(200 * rand(n,1) - 100);
    
    while abs(det(matrix)) <= E
        matrix = (200 * rand(n) - 100);
    end
    
    tmpmatr = matrix;
    for i = 1:n
        tmpmatr(i, i) = 0;
    end
    
    for i = 1:n
        matrix(i, i) = abs(matrix(i, i)) + sum(sum(abs(tmpmatr)));
    end
end

