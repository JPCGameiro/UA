%% Matrizes
A = [1,2,3;4,5,6;7,8,9];
k = [1,2,3]
a = A(2,k)

%% Operador(:)
a = 0:2:20;      %n�mero incial, incremento, n�mero final 
e= 0:pi/2:10;
f= 10:-1:-5;
A = [1 2 3; 4 5 6; 7 8 9];
B = A(:,1:1:3)     %obter as colunas da matriz

%% Exercicio 1 - sequ�ncia de n�meros pares a come�ar em 4 e acabar em 100
a = 4:2:100

%% Exercicio 2 - sequ�ncia num�rica a come�ar em 5 e acabar em -5
b = 5:-1:-5

%% Exercicio 3 - 100 elementos pertencentes ao intervalo [0...1]
c = 0.01:0.01:1

%% Exercicio 4 - extrair uma sumatriz de uma matriz (colunas 9 a 12 e linhas 10 a 15) 
matriz = randi(5, 20, 30)
submatriz = matriz(10:1:15, 9:1:12)

%% Exercicio 5 - M�ltiplos de 3 entre 100 e 132 dispostos por ordem decrescente
multiplos = 132:-3:102;
matriz = [multiplos]

%% Exercicio 6 - Sequ�ncia a come�ar em ? e acabar em -? com um passo de -?/15
sequencia = pi:-(pi/15):-pi 