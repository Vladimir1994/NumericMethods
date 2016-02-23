function [y1, y2] = nextYorder4(yPrev, y2Prev, A, B, h, ksi, b1, b2)
    k11 = h * A * y2Prev;
    k12 = h * B * yPrev;
    k21 = h * A * (y2Prev + (1 / 2) * k12);
    k22 = h * B * (yPrev + (1 / 2) * k11);
    k31 = h * A * (y2Prev + (1 / 2) * k22);
    k32 = h * B * (yPrev + (1 / 2) * k21);
    k41 = h * A * (y2Prev + k32);
    k42 = h * B * (yPrev + k31);
    y1 = yPrev + (1 / 6) * (k11 + 2 * k21 + 2 * k31 + k41);
    y2 = y2Prev + (1 / 6) * (k12 + 2 * k22 + 2 * k32 + k42);
end

