function [ val, rightVal, accuracy ] = Func(x)
    E = 1e-6;
    Eu = E / (3 * 1.4);
    Ev = E / (3 * 1.2);
    Ew = E / 3;

    val = msh(mroot(2 * x + 0.45, Eu), Ew) / marctg(6 * x + 1, Ev);

    rightVal = sinh(sqrt(2 * x + 0.45)) / atan(6 * x + 1);

    accuracy = abs(val - rightVal);     
end

