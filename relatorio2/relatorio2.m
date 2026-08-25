%% Questão 1
clear; clc; close all;

M1 = 2; B1 = 3; 
M2 = 4; B2 = 6;   

sys1 = tf(1, [M1 B1]);
sys2 = tf(1, [M2 B2]);

disp('Função de transferência - Sistema 1:');
sys1
disp('Função de transferência - Sistema 2:');
sys2

t = 0:0.01:20;
[y1, t1] = step(sys1, t);
[y2, t2] = step(sys2, t);

fig1 = figure;
plot(t1, y1, 'b-', 'LineWidth', 1.5); hold on;
plot(t2, y2, 'r-', 'LineWidth', 1.5);
plot(t, ones(size(t)), 'k--', 'LineWidth', 1.2);
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
title('Resposta ao Degrau - Sistemas Massa-Atrito');
legend('Sistema 1 (M=2, B=3)', 'Sistema 2 (M=4, B=6)', 'Força unitária', 'Location', 'southeast');
grid on;

main_ax = gca;
pos = get(main_ax, 'Position');
inset_pos = [pos(1) + 0.5*pos(3), pos(2) + 0.15*pos(4), 0.35*pos(3), 0.35*pos(4)];
inset_ax = axes('Position', inset_pos);

idx = (t1 <= 5);
plot(inset_ax, t1(idx), y1(idx), 'b-', 'LineWidth', 1.2); hold(inset_ax, 'on');
idx2 = (t2 <= 5);
plot(inset_ax, t2(idx2), y2(idx2), 'r-', 'LineWidth', 1.2);
title(inset_ax, 'Zoom: 0 a 5 s', 'FontSize', 8);
grid(inset_ax, 'on');
box(inset_ax, 'on');

figure;
subplot(2,1,1);
plot(t1, y1, 'b-', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
title('Sistema 1 (M=2, B=3)');
grid on;

subplot(2,1,2);
plot(t2, y2, 'r-', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Velocidade (m/s)');
title('Sistema 2 (M=4, B=6)');
grid on;

%% Questão 2
clear; clc; close all;

R = 2000;
tau = 2.5;

C = tau / R;
disp(['Capacitância calculada: C = ', num2str(C), ' F']);

sysRC = tf(1, [tau 1]);
disp('Função de transferência do circuito RC:');
sysRC

figure;
step(sysRC, 0:0.01:15);
xlabel('Tempo (s)');
ylabel('Tensão no capacitor (V)');
title('Resposta ao Degrau - Circuito RC (R=2000\Omega, \tau=2.5s)');
grid on;

Rteste = 100:100:10000;
tau_teste = Rteste * C;

figure;
subplot(2,2,1);
plot(Rteste, tau_teste, 'b-', 'LineWidth', 1.2);
xlabel('Resistência (\Omega)');
ylabel('Constante de tempo \tau (s)');
title('Escala Linear-Linear');
grid on;

subplot(2,2,2);
semilogy(Rteste, tau_teste, 'r-', 'LineWidth', 1.2);
xlabel('Resistência (\Omega)');
ylabel('\tau (s) - log');
title('Escala Log no Eixo Y');
grid on;

subplot(2,2,3);
semilogx(Rteste, tau_teste, 'g-', 'LineWidth', 1.2);
xlabel('Resistência (\Omega) - log');
ylabel('\tau (s)');
title('Escala Log no Eixo X');
grid on;

subplot(2,2,4);
loglog(Rteste, tau_teste, 'm-', 'LineWidth', 1.2);
xlabel('Resistência (\Omega) - log');
ylabel('\tau (s) - log');
title('Escala Log-Log');
grid on;

sgtitle('Relação entre Resistência e Constante de Tempo (C fixo)');

%% Questão 3
clear; clc; close all;

t = (0:25)';

u = [0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]';
y = [0.008 0.012 0.006 0.010 0.020 0.382 0.671 0.903 1.082 1.226 1.335 1.425 ...
     1.492 1.547 1.587 1.618 1.642 1.660 1.674 1.684 1.692 1.698 1.702 1.706 1.709 1.711]';

figure;
subplot(2,1,1);
plot(t, u, 'b-', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Entrada u');
title('Sinal de Entrada');
grid on;

subplot(2,1,2);
plot(t, y, 'r-', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Saída y');
title('Sinal de Saída');
grid on;

plot3(t, u, y, 'b-o', 'LineWidth', 1.2);
xlabel('Tempo (s)');
ylabel('Entrada (u)');
zlabel('Saída (y)');
title('Relação Tempo x Entrada x Saída');
grid on;

Ts = 1;
dados = iddata(y, u, Ts);
sys_est = tfest(dados, 1, 0); 

disp('Função de transferência estimada (Caixa Preta):');
sys_est

figure;
compare(dados, sys_est);
title('Comparação: Dados Experimentais x Modelo Identificado');
grid on;

figure;
step(sys_est, 25);
xlabel('Tempo (s)');
ylabel('Saída');
title('Resposta ao Degrau - Modelo Identificado');
grid on;

%% Questão 4
clear; clc; close all;

R = [1000 2000 3000 5000];
tau = [1.2 2.8 3.9 7.0];
C = tau ./ R;

for k = 1:length(R)
    disp(['Experimento ', num2str(k), ': R = ', num2str(R(k)), ' Ohm, ', ...
          'tau = ', num2str(tau(k)), ' s, C = ', num2str(C(k)), ' F']);
end

disp('Vetor R:'); disp(R);
disp('Vetor tau:'); disp(tau);
disp('Vetor C:'); disp(C);

figure;
plot3(R, tau, C, 'bo-', 'LineWidth', 1.5, 'MarkerFaceColor', 'b');
xlabel('Resistência (\Omega)');
ylabel('Constante de tempo \tau (s)');
zlabel('Capacitância (F)');
title('Experimentos RC: Resistência x \tau x Capacitância');
grid on;

R3 = R(3);
tau3 = tau(3);
sys3 = tf(1, [tau3 1]);

disp('Função de transferência - Experimento 3:');
sys3

t_sim = 0:0.01:20;
[y3, t3] = step(sys3, t_sim);

figure;
plot(t3, y3, 'b-', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Tensão no capacitor (V)');
title(['Resposta ao Degrau - Experimento 3 (R=', num2str(R3), '\Omega, \tau=', num2str(tau3), 's)']);
grid on;

main_ax = gca;
pos = get(main_ax, 'Position');
inset_pos = [pos(1) + 0.5*pos(3), pos(2) + 0.15*pos(4), 0.35*pos(3), 0.35*pos(4)];
inset_ax = axes('Position', inset_pos);

idx = (t3 <= 5);
plot(inset_ax, t3(idx), y3(idx), 'b-', 'LineWidth', 1.2);
title(inset_ax, 'Zoom: 0 a 5 s', 'FontSize', 8);
grid(inset_ax, 'on');
box(inset_ax, 'on');

%% Questão 5
clear; clc; close all;

M_A = 3; B_A = 5;
sysA = tf(1, [M_A B_A]);

R_B = 1500; tau_B = 3;
C_B = tau_B / R_B;
sysB = tf(1, [tau_B 1]);

t_C = (0:20)';
u_C = [0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]';
y_C = [0.010 0.006 0.012 0.018 0.408 0.706 0.934 1.103 1.229 1.322 1.391 1.441 ...
       1.479 1.505 1.526 1.540 1.551 1.558 1.564 1.568 1.571]';

Ts_C = 1;
dados_C = iddata(y_C, u_C, Ts_C);
sysC = tfest(dados_C, 1, 0); 

disp('Função de transferência - Sistema A (Caixa Branca):');
sysA
disp(['Capacitância - Sistema B (Caixa Cinza): C = ', num2str(C_B), ' F']);
disp('Função de transferência - Sistema B (Caixa Cinza):');
sysB
disp('Função de transferência estimada - Sistema C (Caixa Preta):');
sysC

t_sim = 0:0.01:20;

figure;
subplot(3,1,1);
step(sysA, t_sim);
xlabel('Tempo (s)'); ylabel('Velocidade (m/s)');
title('Sistema A - Massa-Atrito (Caixa Branca)');
grid on;

subplot(3,1,2);
step(sysB, t_sim);
xlabel('Tempo (s)'); ylabel('Tensão (V)');
title('Sistema B - Circuito RC (Caixa Cinza)');
grid on;

subplot(3,1,3);
step(sysC, t_sim);
xlabel('Tempo (s)'); ylabel('Saída');
title('Sistema C - Modelo Identificado (Caixa Preta)');
grid on;

figure;
subplot(2,1,1);
plot(t_C, u_C, 'b-', 'LineWidth', 1.5);
xlabel('Tempo (s)'); ylabel('Entrada u');
title('Sistema C - Sinal de Entrada');
grid on;

subplot(2,1,2);
plot(t_C, y_C, 'r-', 'LineWidth', 1.5);
xlabel('Tempo (s)'); ylabel('Saída y');
title('Sistema C - Sinal de Saída');
grid on;

figure;
compare(dados_C, sysC);
title('Sistema C - Comparação: Dados Experimentais x Modelo Identificado');
grid on;

% ----- Classificação dos sistemas -----
% Sistema A: Caixa Branca - o modelo físico (M, B) é totalmente conhecido
% e a função de transferência foi obtida diretamente das leis da física.
% Sistema B: Caixa Cinza - a estrutura do modelo (RC) é conhecida, mas um
% parâmetro (C) precisou ser calculado a partir de um dado experimental (tau).
% Sistema C: Caixa Preta - não há conhecimento da estrutura interna do
% sistema; o modelo foi obtido apenas a partir de dados de entrada e saída,
% via identificação (tfest).