function [cond, frobcond, infcond] = mycond(arg)
    norm = max(sum(abs(arg), 1));
    frobnorm = sqrt(sum(sum(arg .^ 2, 2)));
    infnorm = max(sum(abs(arg), 2));
    invarg = myinv(arg);
    invnorm = max(sum(abs(invarg), 1));
    invfrabnorm = sqrt(sum(sum(invarg .^ 2, 2)));
    invinfnorm = max(sum(abs(invarg), 2));
    cond = norm * invnorm;
    frobcond = frobnorm * invfrabnorm;
    infcond = infnorm * invinfnorm;
end

