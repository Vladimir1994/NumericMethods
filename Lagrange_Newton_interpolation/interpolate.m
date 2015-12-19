%% Инициализация

x_preset = -2:0.5:2; 
y_preset = F(x_preset); %равноотстоящие узлы

x_func = -2:0.001:2; 
y_func = F(x_func); %функция

x_preset_optimal = zeros(length(x_preset), 1); %оптимальные узлы
for i = 1:length(x_preset)
    x_preset_optimal(i) = 0.5*((x_func(length(x_func)) - x_func(1))*cos((2*i + 1)/(2*(length(x_preset) + 1))*pi) + (x_func(length(x_func)) + x_func(1)));
end
y_preset_optimal = F(x_preset_optimal);

clear i

%% полином Лагранжа


Lagrange_polinom = Lagrange(x_preset, y_preset, x_func); %полином Лагранжа через равноотстоящие узлы

figure(1)
plot(x_preset, y_preset, 'bo');
hold on
plot(x_preset_optimal, y_preset_optimal, 'ko');
plot(x_func, y_func, 'r');
plot(x_func, Lagrange_polinom, 'b');

Lagrange_polinom_optimal = Lagrange(x_preset_optimal, y_preset_optimal, x_func); %интерполяционный полином Лагранжа через оптимальные узлы

plot(x_func, Lagrange_polinom_optimal, 'k');
hold off

%% полином Ньютона
Newton_polinom = Newton(x_preset, y_preset, x_func); %полином Ньютона через равноотстоящие узлы

figure(2)
plot(x_preset, y_preset, 'bo');
hold on
plot(x_preset_optimal, y_preset_optimal, 'ko');
plot(x_func, y_func, 'r');
plot(x_func, Newton_polinom, 'b');

Newton_polinom_optimal = Newton(x_preset_optimal, y_preset_optimal, x_func); %интерполяционный полином Ньютона через оптимальные узлы

plot(x_func, Newton_polinom_optimal, 'k');
hold off


