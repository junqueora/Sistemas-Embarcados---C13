%% Questão 1
clear; clc; close all;

M = 2;  
B = 3;   
K = 8;  

sys1 = tf(1, [M B K]);

disp('Função de transferência do sistema massa-mola-amortecedor:');
sys1

figure;
step(sys1, 0:0.01:15);
xlabel('Tempo (s)');
ylabel('Deslocamento (x)');
title('Resposta ao Degrau - Sistema Massa-Mola-Amortecedor');
grid on;

%% Questão 2
clear; clc; close all;

R = 1000;
tau = 2;

C = tau / R;
disp(['Capacitância calculada: C = ', num2str(C), ' F']);

sys2 = tf(1, [tau 1]);

disp('Função de transferência do circuito RC:');
sys2

figure;
step(sys2, 0:0.01:10);
xlabel('Tempo (s)');
ylabel('Tensão no capacitor (V)');
title('Resposta ao Degrau - Circuito RC');
grid on;

%% Questão 3
clear; clc; close all;

M = 4;     
F = 1;
v_ss = 0.5;

B = F / v_ss;
disp(['Coeficiente de atrito calculado: B = ', num2str(B)]);

sys3 = tf(1, [M B]);

disp('Função de transferência do sistema massa-atrito:');
sys3

tau3 = M / B;
t_sim = 0:0.01:5*tau3;

figure;
step(F*sys3, t_sim);  
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
title('Resposta do Sistema Massa-Atrito à Força Aplicada (F = 1 N)');
grid on;