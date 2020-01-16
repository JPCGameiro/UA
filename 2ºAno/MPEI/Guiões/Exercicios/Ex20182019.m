%% a)
T = [0.7 0.1 0 0 0 0;
     0.2 0 0.3 0 0 0;
     0 0.6 0.1 0 0 0;
     0.1 0.3 0.4 0.1 0 0;
     0 0 0 0.5 1 0;
     0 0 0.2 0.4 0 1];
sum(T)
x0 = [0; 0.5; 0.5; 0; 0; 0];

%% b)
T = [0.7 0.1 0 0 0 0;
     0.2 0 0.3 0 0 0;
     0 0.6 0.1 0 0 0;
     0.1 0.3 0.4 0.1 0 0;
     0 0 0 0.5 1 0;
     0 0 0.2 0.4 0 1];

Q = T(1:4, 1:4);
F = inv(eye(4)-Q);
aux = sum(F)
fprintf("\nSe come�ar em Israel o terrostita necessita de em m�dia "+aux(1)+" meses para terminar nos EUA ou em Israel\n");


%% c)
T = [0.7 0.1 0 0 0 0;
     0.2 0 0.3 0 0 0;
     0 0.6 0.1 0 0 0;
     0.1 0.3 0.4 0.1 0 0;
     0 0 0 0.5 1 0;
     0 0 0.2 0.4 0 1];

x0 = [1; 0; 0; 0; 0; 0];   %Come�a no iraque

x5 = T^5*x0                %5 meses depois

fprintf("Se come�ar no iraque a probabilidade de estar nos EUA 5 meses depois � "+x5(6)+"\n");

%% c)
T = [0.7 0.1 0 0 0 0;
     0.2 0 0.3 0 0 0;
     0 0.6 0.1 0 0 0;
     0.1 0.3 0.4 0.1 0 0;
     0 0 0 0.5 1 0;
     0 0 0.2 0.4 0 1];

x0 = [0; 0; 0; 1; 0; 0];   %Come�a no brasil

x50 = T^50*x0

fprintf("Se come�ar no Brasil a probabilidade de estar em Israel 50 meses depois � "+x50(5)+"\n");
