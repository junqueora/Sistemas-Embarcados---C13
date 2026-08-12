%% Relatorio 1 - MATLAB

clear; clc; close all;

%% Exercicio 1

m1 = input('Digite a primeira medicao: ');
m2 = input('Digite a segunda medicao: ');
m3 = input('Digite a terceira medicao: ');

medidas = [m1 m2 m3];

media = mean(medidas);
maior = max(medidas);
menor = min(medidas);

fprintf('Media das medicoes: %.2f\n', media);
fprintf('Maior valor: %.2f\n', maior);
fprintf('Menor valor: %.2f\n', menor);

if media >= 8
    disp('Resultado alto');
elseif media >= 5
    disp('Resultado intermediario');
else
    disp('Resultado baixo');
end

%% Exercicio 2 

A2 = [3 8 2 10 5 7 1 6];
B2 = zeros(1, length(A2));

for i = 1:length(A2)
    if A2(i) >= 6
        B2(i) = A2(i) * 2;
    else
        B2(i) = A2(i) + 3;
    end
end

somaB2 = sum(B2);
mediaB2 = mean(B2);
maiorB2 = max(B2);
menorB2 = min(B2);

disp('Vetor original A:');
disp(A2);

disp('Vetor resultante B:');
disp(B2);

fprintf('Soma dos elementos de B: %.2f\n', somaB2);
fprintf('Media dos elementos de B: %.2f\n', mediaB2);
fprintf('Maior valor de B: %.2f\n', maiorB2);
fprintf('Menor valor de B: %.2f\n', menorB2);

%% Exercicio 3 

A3 = [14 7 20 9 6 11 18 5];
B3 = zeros(1, length(A3));
contadorPares = 0;

for i = 1:length(A3)
    if rem(A3(i), 2) == 0
        B3(i) = A3(i);
        contadorPares = contadorPares + 1;
    else
        B3(i) = 0;
    end
end

disp('Vetor B:');
disp(B3);

fprintf('Quantidade de numeros pares encontrados: %d\n', contadorPares);

%% Exercicio 4

valor1 = input('Digite o primeiro valor: ');
valor2 = input('Digite o segundo valor: ');

disp('1 - Soma');
disp('2 - Subtracao');
disp('3 - Multiplicacao');
disp('4 - Divisao');

opcao4 = input('Escolha uma opcao: ');

switch opcao4
    case 1
        resultado4 = valor1 + valor2;
        fprintf('Resultado da soma: %.2f\n', resultado4);
    case 2
        resultado4 = valor1 - valor2;
        fprintf('Resultado da subtracao: %.2f\n', resultado4);
    case 3
        resultado4 = valor1 * valor2;
        fprintf('Resultado da multiplicacao: %.2f\n', resultado4);
    case 4
        if valor2 == 0
            disp('Operacao nao pode ser realizada: divisao por zero');
        else
            resultado4 = valor1 / valor2;
            fprintf('Resultado da divisao: %.2f\n', resultado4);
        end
    otherwise
        disp('Opcao invalida');
end

%% Exercicio 5

soma5 = 0;
contador5 = 0;

while soma5 <= 4
    valorSorteado = rand();
    soma5 = soma5 + valorSorteado;
    contador5 = contador5 + 1;
    fprintf('Valor sorteado: %.4f | Soma atual: %.4f\n', valorSorteado, soma5);
end

if contador5 > 8
    disp('Muitas repeticoes');
else
    disp('Poucas repeticoes');
end

fprintf('Numero total de repeticoes: %d\n', contador5);

%% Exercicio 6 

A6 = [2 7 4 9;
      6 1 8 3];

B6 = zeros(size(A6));

[linhas6, colunas6] = size(A6);

for j = 1:linhas6
    for i = 1:colunas6
        if A6(j,i) > 5
            B6(j,i) = A6(j,i) * 2;
        else
            B6(j,i) = A6(j,i) + 5;
        end
    end
end

disp('Matriz A:');
disp(A6);

disp('Matriz B:');
disp(B6);

disp('Transposta de B:');
disp(B6');

disp('Primeira linha de B:');
disp(B6(1,:));

disp('Terceira coluna de B:');
disp(B6(:,3));

%% Exercicio 7 

A7 = [5 12 7 3 9 14];

[somaA7, mediaA7] = analisa_vetor(A7);

if mediaA7 >= 8
    disp('Media elevada');
else
    disp('Media abaixo de 8');
end

fprintf('Soma: %.2f\n', somaA7);
fprintf('Media: %.2f\n', mediaA7);

%% Exercicio 8 

A8 = [1 5 3 8;
      6 2 7 4];

B8 = zeros(size(A8));

B8 = transforma_matriz(A8, B8);

disp('Matriz resultante B:');
disp(B8);

%% Exercicio 9

texto1 = input('Digite o primeiro valor: ', 's');
texto2 = input('Digite o segundo valor: ', 's');

disp('Texto recebido 1:');
disp(texto1);
disp('Texto recebido 2:');
disp(texto2);

valorNum1 = str2num(texto1); 
valorNum2 = str2num(texto2); 

soma9 = valorNum1 + valorNum2;
multiplicacao9 = valorNum1 * valorNum2;

fprintf('Soma: %.2f\n', soma9);
fprintf('Multiplicacao: %.2f\n', multiplicacao9);

if soma9 > 20
    disp('Soma alta');
elseif soma9 == 20
    disp('Soma igual a 20');
else
    disp('Soma baixa');
end

%% Exercicio 10 

dados = [12 18 10 25 15];

somaDados = sum(dados);
mediaDados = mean(dados);
maiorDados = max(dados);
menorDados = min(dados);

fprintf('Soma dos valores: %.2f\n', somaDados);
fprintf('Media: %.2f\n', mediaDados);
fprintf('Maior valor: %.2f\n', maiorDados);
fprintf('Menor valor: %.2f\n', menorDados);

contadorAcimaMedia = 0;
for i = 1:length(dados)
    if dados(i) >= mediaDados
        contadorAcimaMedia = contadorAcimaMedia + 1;
    end
end

disp('1 - Grafico de barras');
disp('2 - Grafico de pizza');

opcao10 = input('Escolha uma opcao: ');

switch opcao10
    case 1
        figure;
        bar(dados);
        title('Grafico de barras dos dados');
    case 2
        figure;
        pie3(dados);
        title('Grafico de pizza dos dados');
    otherwise
        warning('Nenhum grafico foi criado');
end

if contadorAcimaMedia >= length(dados)/2
    disp('Maioria dos valores acima ou igual a media');
else
    disp('Menos da metade dos valores acima ou igual a media');
end