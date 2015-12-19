x = -2:.2:2;
y = F(x);

plot(x, y, 'ro');
hold on;

[xx_lsm, yy_lsm] = appr_lsm(x, y, 2);
plot(xx_lsm, yy_lsm);

figure(2)

plot(x, y, 'ro');
hold on;

[xx_orth, yy_orth] = appr_orth(x, y, 2);
plot(xx_orth, yy_orth, 'k');