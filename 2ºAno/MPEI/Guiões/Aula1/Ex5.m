%% a) 3 pe�as em 5 serem defeituosas
n = 5;      %n�pe�as
k = 3;      %n� pe�as defeituosas
p = 0.3;    %probabilidade de ser defeituosa
N = 1e5;    %n�experi�ncias
%analiticamente
probAnalitica = factorial(n)/(factorial(k)*factorial(n-k))*(p^k)*((1-p)^(n-k))
%simulacao
experiencias = rand(n, N)<0.3;
sucessos = sum(experiencias) == 3;
probSimulacao = sum(sucessos)/N

%% b) pelo menos 2 defeituosas
n = 5;
k = 2;
p = 0.3;
N = 1e5;
experiencias = rand(n, N)>0.7;
sucessos = sum(experiencias)<=2;
prob = sum(sucessos)/N

%% c) histograma do n�mero de pe�as defeituosas
n = 5;
k = 2;
p = 0.3;
N = 1e5;
experiencias = rand(n, N)>0.7;
sucessos = sum(experiencias)<=2;
prob = sum(sucessos)/N;
hist(sucessos)