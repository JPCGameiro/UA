%% a)
H = [0 0 1/2 0 1/2 1/5;
     1/4 1/3 1/2 1/2 1/2 1/5;
     1/4 0 0 0 0 1/5;
     1/4 1/3 0 0 0 1/5;
     1/4 0 0 1/2 0 1/5;
     0 1/3 0 0 0 0];

r0 = [1/6; 1/6; 1/6; 1/6; 1/6; 1/6];

r3 = H^3*r0;

fprintf("PageRank de A ap�s 3 itera��es � "+r3(1)+"\n");
fprintf("PageRank de B ap�s 3 itera��es � "+r3(2)+"\n");
fprintf("PageRank de C ap�s 3 itera��es � "+r3(3)+"\n");
fprintf("PageRank de D ap�s 3 itera��es � "+r3(4)+"\n");
fprintf("PageRank de E ap�s 3 itera��es � "+r3(5)+"\n");
fprintf("PageRank de F ap�s 3 itera��es � "+r3(6)+"\n");

%% b) e c)
H = [0 0 1/2 0 1/2 1/5;
     1/4 1/3 1/2 1/2 1/2 1/5;
     1/4 0 0 0 0 1/5;
     1/4 1/3 0 0 0 1/5;
     1/4 0 0 1/2 0 1/5;
     0 1/3 0 0 0 0];

r0 = [1/6; 1/6; 1/6; 1/6; 1/6; 1/6];

r_atual = r0;
N=100;
Resultado = zeros(length(H), N);
for k = 1:100
    Resultado(:,k) = r_atual;
    r_atual = H^k*r0;
end

plot(1:N, Resultado)
row = find(r_atual == max(r_atual));
fprintf("\nO valor m�ximo de pageRank obtido � "+max(r_atual)+" na p�gina N� "+row+"\n");