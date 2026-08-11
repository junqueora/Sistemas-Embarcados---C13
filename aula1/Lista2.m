clc; clear; close all;

%% 1
cidade = input('Digite o nome de uma cidade: ', 's');
disp(cidade);
fprintf('Cidade escolhida: %s\n', cidade);

%% 2
x = 7;

if x > 10
    disp('Maior que 10');
elseif x == 10
    disp('Igual a 10');
else
    disp('Menor que 10');
end

%% 3
for i = 1:5
    resultado = i * 3;
    disp(resultado);
end

%% 4
x_w = 0;
i_w = 0;

while i_w < 5
    x_w = x_w + 1;
    i_w = i_w + 1;
    disp(x_w);
end

%% 5
opcao = 2;

switch opcao
    case 1
        disp('Opcao A');
    case 2
        disp('Opcao B');
    case 3
        disp('Opcao C');
    otherwise
        disp('Opcao invalida');
end

valor_teste = 4;
triplo = funcao_triplo(valor_teste);
disp(triplo);