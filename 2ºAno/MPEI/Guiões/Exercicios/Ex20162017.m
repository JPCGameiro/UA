%% Exercicio 1
T = [0.9  0.5 0.5;
     0.09 0.4 0.4;
     0.01 0.1 0.1];

v0 = [0; 0; 1];     %o primeiro pacote cont�m 2 ou mais erros (3)

v4 = T^4*v0

fprintf("\n A probabilidade de o 4� pacote ter zero erros sabendo que o 1� tinha 3 � "+v4(1));
fprintf("\n A probabilidade de o 4� pacote ter um erro sabendo que o 1� tinha 3 � "+v4(2));
fprintf("\n A probabilidade de o 4� pacote ter dois ou mais erros sabendo que o 1� tinha 3 � "+v4(3)+"\n");

%% Exercicio 2)
H = [0 1/2 1/3 1/4 0;           %Matriz de HiperLinks
     1/2 0 0 1/4 1/2;
     1/2 1/2 1/3 1/4 0;
     0 0 0 0 1/2;
     0 0 1/3 1/4 0];
N = 5;
Matriz1N = ones(N)*(1/N);
B = 0.8;

A = B*H + (1-B)*Matriz1N;       %Matriz da Google

r0 = [1/N; 1/N; 1/N; 1/N; 1/N]; %PageRank inicial para cada p�gina (1/N)

r10 = A^10*r0;                  %PageRank de cada p�gina ap�s 10 itera��es

fprintf("\nPage rank de cada P�gina ap�s 10 itera��es\n");
fprintf("\n C -> "+r10(1));
fprintf("\n D -> "+r10(2));
fprintf("\n E -> "+r10(3));
fprintf("\n F -> "+r10(4));
fprintf("\n G -> "+r10(5)+"\n");
%% Exercicio 3
T = [0.7 0.2 0 0 0 0;
     0.2 0 0.3 0 0 0;
     0 0.6 0.3 0 0 0;
     0.1 0.2 0.3 0.1 0 0;
     0 0 0.1 0.4 1 0;
     0 0 0 0.5 0 1];
 
x0 = [1; 0; 0; 0; 0; 0];        %O primeiro � um a
x10 = T^10*x0;
x15 = T^15*x0;
fprintf("\n A probabilidade de o 10� ser um 'c' se o primeiro for um 'a' � de "+x10(3));
fprintf("\n A probabilidade de o 15� ser um 'd' se o primeiro for um 'a' � de "+x15(4)+"\n");

Q = T(1:4, 1:4);
F = inv(eye(4)-Q);
aux = sum(F)

fprintf("O comprimento m�dio das cadeias de caracteres come�adas em c e terminadas em '?' ou '.' � de "+aux(3)+"\n");
