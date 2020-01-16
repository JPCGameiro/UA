%% Analiticamente - 6 caras em 15 lan�amentos
n = 15;      %n�lan�amentos
k = 6;       %n� de caras
p = 0.5;     %probabilidade de cara
probSim = (factorial(n)/(factorial(k)*factorial(n-k))) * p^k * p^(n-k)

%% Simula��o v1
experiencias = rand(15, 10000);
lancamentos = experiencias > 0.5;
resultados = sum(lancamentos);
sucessos = resultados==6;
probSim = sum(sucessos)/10000

%% Simula��o v2
N = 1e5;    %n� experi�ncias
p = 0.5;    %probabilidade de obter cara
k = 6;      %N�mero de sucessos
n = 15;     %N�mero de lan�amentos
lancamentos = rand(n, N) > p;
sucessos = sum(lancamentos) == k;
probSim = sum(sucessos)/N
