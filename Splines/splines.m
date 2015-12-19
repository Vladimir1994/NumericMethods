xx = 0:.01:5;
yy = F(xx);

x = 0:.5:5;
y = F(x);

[x_spline10, spline10] = spline_1_0(x, y); 
figure(1);
hold on;
plot(x_spline10, spline10);
plot(xx, yy, 'r');

[x_spline20, spline20] = spline_2_0(x, y); 
figure(2);
hold on;
plot(x_spline20, spline20);
plot(xx, yy, 'r');

[x_spline30, spline30] = spline_3_0(x, y); 
figure(3);
hold on;
plot(x_spline30, spline30);
plot(xx, yy, 'r');

[x_spline21, spline21] = spline_2_1(x, y, 0); 
figure(4);
hold on;
plot(x_spline21, spline21);
plot(xx, yy, 'r');

[x_spline31, spline31] = spline_3_1(x, y, 0); 
figure(5);
hold on;
plot(x_spline31, spline31);
plot(xx, yy, 'r');

[x_spline32, spline32] = spline_3_2(x, y); 
figure(6);
hold on;
plot(x_spline32, spline32);
plot(xx, yy, 'r');