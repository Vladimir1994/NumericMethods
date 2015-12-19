%% �������������

x_preset = -2:0.5:2; 
y_preset = F(x_preset); %�������������� ����

x_func = -2:0.001:2; 
y_func = F(x_func); %�������

x_preset_optimal = zeros(length(x_preset), 1); %����������� ����
for i = 1:length(x_preset)
    x_preset_optimal(i) = 0.5*((x_func(length(x_func)) - x_func(1))*cos((2*i + 1)/(2*(length(x_preset) + 1))*pi) + (x_func(length(x_func)) + x_func(1)));
end
y_preset_optimal = F(x_preset_optimal);

clear i

%% ������� ��������


Lagrange_polinom = Lagrange(x_preset, y_preset, x_func); %������� �������� ����� �������������� ����

figure(1)
plot(x_preset, y_preset, 'bo');
hold on
plot(x_preset_optimal, y_preset_optimal, 'ko');
plot(x_func, y_func, 'r');
plot(x_func, Lagrange_polinom, 'b');

Lagrange_polinom_optimal = Lagrange(x_preset_optimal, y_preset_optimal, x_func); %���������������� ������� �������� ����� ����������� ����

plot(x_func, Lagrange_polinom_optimal, 'k');
hold off

%% ������� �������
Newton_polinom = Newton(x_preset, y_preset, x_func); %������� ������� ����� �������������� ����

figure(2)
plot(x_preset, y_preset, 'bo');
hold on
plot(x_preset_optimal, y_preset_optimal, 'ko');
plot(x_func, y_func, 'r');
plot(x_func, Newton_polinom, 'b');

Newton_polinom_optimal = Newton(x_preset_optimal, y_preset_optimal, x_func); %���������������� ������� ������� ����� ����������� ����

plot(x_func, Newton_polinom_optimal, 'k');
hold off


