function [y1, y2] = nextYorder2(yPrev, y2Prev, A, B, h, ksi, b1, b2)
    k11 = h * A * y2Prev;
    k12 = h * B * yPrev;
    k21 = h * A * (y2Prev + ksi * k12);
    k22 = h * B * (yPrev + ksi * k11);
    y1 = yPrev + b1 * k11 + b2 * k21;
    y2 = y2Prev + b1 * k12 + b2 * k22;
    global CountF2;
    CountF2 = CountF2 + 2;
end

