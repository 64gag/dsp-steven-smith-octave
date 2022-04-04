x = [0; -1; -1.2; 2; 1.2; 1.2; 0.75; 0; -0.75];
h = [1; -0.5; -0.3; -0.1];

close all
figure(1)

subplot(5, 1, 1);
dsp_plot(x, 'x[n]');

subplot(5, 1, 2);
dsp_plot(h, 'h[n]');

subplot(5, 1, 3);
dsp_plot(dsp_convolution_input(x, h), 'y[n] (input)');

subplot(5, 1, 4);
dsp_plot(dsp_convolution_output(x, h), 'y[n] (output)');

subplot(5, 1, 5);
dsp_plot(conv(x, h), 'y[n] (conv)');
