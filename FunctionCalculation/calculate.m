arg = 0.01:0.005:0.06;

val = zeros(11,1);
right_val = zeros(11,1);
accuracy = zeros(11,1);

for i = 1:11
    [val(i), right_val(i), accuracy(i)] = Func(arg(i));
end

arg'
val
right_val
accuracy

clear i ans