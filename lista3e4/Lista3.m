%% Questão 1
clear; clc; close all;

t = 0:0.1:10;           

y_sen = 2*sin(3*t);     
y_cos = 2*cos(3*t);     

figure;
plot(t, y_sen, 'b-', 'LineWidth', 1.5); hold on;
plot(t, y_cos, 'r-', 'LineWidth', 1.5);
xlabel('Tempo (s)');
ylabel('Amplitude');
title('Senoide e Cossenoide - Amplitude 2, \omega = 3 rad/s');
legend('2*sen(3t)', '2*cos(3t)');
grid on;

disp(['Quantidade de elementos do vetor de tempo: ', num2str(length(t))]);

%% Questão 2
clear; clc; close all;

a = input('Digite o valor do coeficiente a: ');

x = -10:0.1:10;
y = a*x + 2;

if a > 0
    disp('O coeficiente digitado é POSITIVO.');
elseif a < 0
    disp('O coeficiente digitado é NEGATIVO.');
else
    disp('O coeficiente digitado é IGUAL A ZERO.');
end

figure;
plot(x, y, 'b-', 'LineWidth', 1.5);
xlabel('x');
ylabel('y');
title(['Função y = ', num2str(a), 'x + 2']);
grid on;

main_ax = gca;
pos = get(main_ax, 'Position');
inset_pos = [pos(1) + 0.55*pos(3), pos(2) + 0.55*pos(4), 0.35*pos(3), 0.35*pos(4)];
inset_ax = axes('Position', inset_pos);

idx = (x >= -2 & x <= 2);
plot(inset_ax, x(idx), y(idx), 'r-', 'LineWidth', 1.5);
title(inset_ax, 'Zoom: -2 \leq x \leq 2', 'FontSize', 8);
grid(inset_ax, 'on');
box(inset_ax, 'on');

%% Questão 3
clear; clc; close all;

n = 5;
multiplos = zeros(1, n);

for k = 1:n
    multiplos(k) = 3*k;
end

dobro = 2*multiplos;

figure;
subplot(2,1,1);
plot(1:n, multiplos, 'bo-', 'LineWidth', 1.5);
xlabel('Índice');
ylabel('Valor');
title('Primeiros 5 múltiplos de 3');
grid on;

subplot(2,1,2);
plot(1:n, dobro, 'rs-', 'LineWidth', 1.5);
xlabel('Índice');
ylabel('Valor');
title('Dobro dos múltiplos de 3');
grid on;

%% Questão 4
clear; clc; close all;

t = 1:1:1000;              
y = 50000*exp(-0.05*t);

figure;
subplot(1,2,1);
plot(t, y, 'b-', 'LineWidth', 1.5);
xlabel('Tempo (t)');
ylabel('y');
title('Escala Linear');
grid on;

subplot(1,2,2);
semilogy(t, y, 'r-', 'LineWidth', 1.5);
xlabel('Tempo (t)');
ylabel('y (log)');
title('Escala Logarítmica no eixo Y');
grid on;

sgtitle('Comparação: y = 50000 e^{-0,05t}');

%% Questão 5 
clear; clc; close all;

x = 1:0.5:10;
y = 1:0.5:20;
[X, Y] = meshgrid(x, y);
Z = sin(X) + cos(Y);

figure;
surf(X, Y, Z);
shading interp;              
colormap('autumn');          
colorbar;
xlabel('Eixo X');
ylabel('Eixo Y');
zlabel('Eixo Z');
title('Superfície z = sen(x) + cos(y)');

figure;
contour(X, Y, Z, 20);
colormap('autumn');
colorbar;
xlabel('Eixo X');
ylabel('Eixo Y');
title('Curvas de Nível de z = sen(x) + cos(y)');
grid on;