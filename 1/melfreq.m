close all;
clear variables;

f = linspace(20, 20000);
m = 2595*log(1 + f./700);

plot(f, m);