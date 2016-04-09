global A
global B

A = 1 / 15;
B = 1 / 25;
ksi = 1 / 11;
xk = 10;
epsilon = 1e-6;

[x, y1, y2] = RungeKutta2Auto(A, B, ksi, xk, epsilon);

y0 = [B * pi, A * pi];
[T, Y] = ode45(@diffeq, x, y0);

hold on;
plot(T, Y(:, 1));
plot(x, y1, 'r');

plot(T, Y(:, 2), 'g');
plot(x, y2, 'k');