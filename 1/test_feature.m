clear variables;
clc;

[x, fs] = audioread('bird1.mp3');

x = x(:,1);
% a = x(:,1); 1st channel
% b = x(:,2); 2nd channel
N = length(x);
t = (0:N-1)/fs;
