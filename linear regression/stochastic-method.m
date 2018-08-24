data = load("ex1data1.txt");

x = data(:,1);
y = data(:,2);

x = [ones(size(x,1),1) x];
w = zeros(2,1);

alfa = 0.001;

qtdEpocas = 1000;

n = size(x,1);

eqm = [];

for i = 1:qtdEpocas
  ind = randperm(n);
  x = x(ind,:);
  y = y(ind);
  erro_total = 0;
  for j = 1:n
    y_barra = x(j,:)*w;
    erro = y(j) - y_barra;
    erro_total = erro_total + erro.^2;
    w(1) = w(1) + alfa*erro;
    w(2) = w(2) + alfa*erro*x(j,2);
  endfor
  eqm = [eqm erro_total/qtdEpocas]
endfor

plot(x(:,2), y, 'bo');

hold on;

plot(x(:,2), x*w, 'rx');