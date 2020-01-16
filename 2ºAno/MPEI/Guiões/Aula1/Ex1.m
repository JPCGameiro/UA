%% Lan�ar 3 vezes uma moeda obter 2 caras (analiticamente)
p = 0.5;
k = 2;
n = 3;
prob = factorial(n)/(factorial(k)*factorial(n-k))*(p^k)*((1-p)^(n-k))

%% Lan�ar 3 vezes uma moeda obter 2 caras (simula��o v1)
experiencias = rand(3, 100000);
lancamentos = experiencias > 0.5;
resultados = sum(lancamentos);
sucessos = resultados == 2;
prob = sum(sucessos)/100000

%% Lan�ar 3 vezes uma moeda obter 2 caras (simula��o v2)
N = 1e5;    %N�Experi�ncias
p = 0.5;    %probabilidade de cara
k = 2;      %N�de sucessos por lan�amento (2 caras)
n = 3;      %N�lan�amentos
experiencia = rand(n, N) > p;
sucessos = sum(experiencia) == k;
prob = sum(sucessos)/N