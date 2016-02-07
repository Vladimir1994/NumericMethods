function y = Newton(x_preset, y_preset, x)

N = length(x_preset);

C = y_preset;

for  k = 1 : N-1
     for i = 1: N - k
          C(i) = (C(i + 1) - C(i)) / (x_preset(i + k) - x_preset(i));
      end
end

y = C(1) * ones(size(x));

for k = 2 : N
     y = C(k) + (x - x_preset(k)) .* y;
end

