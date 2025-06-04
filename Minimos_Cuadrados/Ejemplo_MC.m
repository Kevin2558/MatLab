%Data = readtable('Anexo Taller III - Interpolacion.xlsx','Sheet','PV2', 'PreserveVariableNames', true);
point = {'PE1','PE2','PE3','PE4','PE5','PV1','PV2'};
for i = 1:length(point)
Data = readtable('Ayudantia_S9_MC.xlsx','Sheet',point{i}, 'PreserveVariableNames', true);
x  = Data.time;
y = Data.rssi;

x_4 = sum(x.^4);
x_3 = sum(x.^3);
x_2 = sum(x.^2);
x_1 = sum(x);
n = length(x);

yx_2 = sum(y.*(x.^2));
yx_1 = sum(y.*(x));
y_ = sum(y);

A = [x_4 x_3 x_2; x_3 x_2 x_1; x_2 x_1 n];
b = [yx_2; yx_1; y_];
c = A\b;
figure
plot(x,y,'-.');
hold on
value_ = c(1)*(x.^2) + c(2)*(x) + c(3);
plot(x,value_,'-');
ylim([-120 0]);
syms t
f =  c(1)*(t.^2) + c(2)*(t) + c(3);
I = double(int(f,x(1),x(end)));
[~,idx] = max(value_);
msg = strcat(point(i)," Energia: ", num2str(I), " /Maximo: ", num2str(x(idx)));
disp(msg)
end
