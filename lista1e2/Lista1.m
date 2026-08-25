clc; clear; close all;

%% 1
a = 12;
b = 5;

soma = a + b;
subtracao = a - b;
multiplicacao = a * b;
divisao = a / b;
potencia = a ^ b;

%% 2
raiz = sqrt(144);
arredonda_round = round(7.6);
arredonda_ceil = ceil(4.01);
resto_divisao = mod(250, 17);

%% 3
mdc_val = gcd(24, 36);
mmc_val = lcm(12, 18);

%% 4
exp_e = exp(2);

ang_30 = deg2rad(30);
ang_60 = deg2rad(60);
ang_45 = deg2rad(45);

seno = sin(ang_30);
cosseno = cos(ang_60);
tangente = tan(ang_45);

%% 5
v_1_10 = 1:10;
v_10_1 = 10:-1:1;
v_pares = 0:2:20;
v_linspace = linspace(0, 100, 5);

%% 6
v6 = [4 8 15 16 23 42];

p_primeiro = v6(1);
p_ultimo = v6(end);
p_2a4 = v6(2:4);
p_1_3_6 = v6([1 3 6]);

%% 7
v7 = [5 10 15 20 25];

qtd_elementos = length(v7);
dimensoes_v7 = size(v7);
soma_v7 = sum(v7);
media_v7 = mean(v7);
maior_v7 = max(v7);
menor_v7 = min(v7);

%% 8
v8 = [10 20 30 40];
dim_linha = size(v8);

v8_coluna = v8';
dim_coluna = size(v8_coluna);

%% 9
A9 = [3 6 9; 2 4 8; 1 5 7];

elem_L2_C3 = A9(2, 3);
primeira_linha = A9(1, :);
segunda_coluna = A9(:, 2);
dimensoes_A9 = size(A9);

%% 10
A10 = [1 2; 3 4];
B10 = [2 0; 1 5];

soma_AB = A10 + B10;
mult_AB = A10 * B10;
transposta_A = A10';

matriz_zeros = zeros(3, 3);
matriz_uns = ones(2, 4);
matriz_identidade = eye(4);
matriz_aleatoria = rand(3, 3);