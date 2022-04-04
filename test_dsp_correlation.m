t = 10 * [-5; 0];
x = [0; 2; 1; 4; 10; t; 0; -0.75];

close all
figure(1)

subplot(4, 1, 1);
dsp_plot(x, 'x[n]');

subplot(4, 1, 2);
dsp_plot(t, 't[n]');

subplot(4, 1, 3);
dsp_plot(dsp_correlation(x, t), 'y[n] (correlation)');

subplot(4, 1, 4);
dsp_plot(dsp_convolution_input(x, t), 'y[n] (convolution)');
