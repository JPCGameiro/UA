%% a)10 caras em 10 lan�amentos

lancamentos = rand(10, 1e5) > 0.5;
sucessos = sum(lancamentos) == 10;
prob = sum(sucessos)/1e5

%% b) sair cara no 11� lan�amento

lancamentos = rand(11, 1e5) > 0.5;
probabilidade10 = sum(lancamentos(1:10,:))==10;
probabilidade11 = sum(lancamentos)==11;
prob = sum(probabilidade11)/sum(probabilidade10)

