clear all;
clc;

filename = "labelled_data.csv";
filename_test = "labelled_test_data.csv";

data = csvread(filename);
data_test = csvread(filename_test);

n = length(data);

x = zeros(1, 13);
t = zeros(1, 5);

net = feedforwardnet([20, 20]);
%net = perceptron;

X = data(:,1:13);

labels = data(:,14);

T = zeros(n, 5);

for i = 1:n
    T(i, labels(i)) = 1;
end

X = X';
T = T';

%net = init(net);
net = train(net, X, T);

output = zeros(5, 25);
inputs = data_test(:,1:13);
inputs = inputs';

output = net(inputs);
output = output';

label_outs_true = data_test(:,14);
% label_outs_test = zeros(25, 1);
correct = 0;
for i = 1:25
%     output(i,1:5)
   [val, id] =  max(output(i,:));
    if(id == label_outs_true(i)) 
        correct = correct + 1;
    end
end

acc = correct/25;