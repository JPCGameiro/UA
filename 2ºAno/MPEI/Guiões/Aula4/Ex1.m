%% a) Gerar um vector de comprimento 1000
vector = lcg(3,3,3,5,1000);           %gera��o dos n�meros aleat�rios
diferentes = length(unique(vector));  %N� de n�meros diferentes 
histogram(vector);
title('Histograma')
xlabel('N�meros Gerados')
ylabel('Quantidade de n�meros Gerados')

%% b) Gerar n�meros aleat�rio entre 0 e 1
m = 2;
a = 1;
X0 = 0.5;
vector = lcg(X0, a, a, m, 1000)/m;
diferent = length(unique(vector));
histogram(vector);
title('Histograma');
xlabel('N�meros Gerados');
ylabel('Quantidade de N�meros Gerados');


%% c)par�metros utilizados na implementa��o inclu�da na biblioteca NAG
vector = lcg(3, 7^5, 2,(2^31)-1, 1000);
diferente = unique(vector);
histogram(vector);
title('Histograma');
xlabel('N�meros Gerados');
ylabel('Quantidade de N�meros Gerados');
