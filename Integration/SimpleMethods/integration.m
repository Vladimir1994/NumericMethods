a = 0.7;
b = 3.2;
int = integral(@F, a, b);
cnt_max = 50;
cnt_min = 5;
cnt = cnt_max - cnt_min + 1;
intLeftDot = zeros(cnt, 1);
intRigthDot = zeros(cnt, 1);
intRectangle = zeros(cnt, 1);
intTrapezoid = zeros(cnt, 1);
intSimpson = zeros(cnt, 1);

for i = cnt_min:cnt_max
	intLeftDot(i - cnt_min + 1) = LeftDotIntegration(a, b, i);
	intRigthDot(i - cnt_min + 1) = RightDotIntegration(a, b, i);
	intRectangle(i - cnt_min + 1) = RectangleIntegration(a, b, i);
	intTrapezoid(i - cnt_min + 1) = TrapezoidIntegration(a, b, i);
	intSimpson(i - cnt_min + 1) = SimpsonIntegration(a, b, i);
end

acc_1 = abs(intLeftDot - int);
acc_2 = abs(intRigthDot - int);
acc_3 = abs(intRectangle - int);
acc_4 = abs(intTrapezoid - int);
acc_5 = abs(intSimpson - int);
xx = (cnt_min:cnt_max)';
hold on
plot(xx, acc_1, 'b');
plot(xx, acc_2, 'r');
plot(xx, acc_3, 'g');
plot(xx, acc_4, 'k');
plot(xx, acc_5, 'y');
