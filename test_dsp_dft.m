N = 64;

x = 0;
if (true)
    x = dsp_dft_basis_cos(N, 4);
else
    x = zeros(N, 1);
    x(1) = N;
    x(N / 2) = N;
end

X = dsp_dft1(x);
%X = dsp_dft2(x);
x_computed = dsp_idft(X);

plot_rows = 7;
plot_cols = 1;
close all

subplot(plot_rows, plot_cols, 1);
dsp_plot(x, 'x[n]');

subplot(plot_rows, plot_cols, 2);
dsp_plot(x_computed, 'x_c[n] (dsp\_idft())');

subplot(plot_rows, plot_cols, 3);
dsp_plot(x - x_computed, 'x[n] - x_c[n]');

subplot(plot_rows, plot_cols, 4);
dsp_plot(abs(X), 'MagX[n]');

subplot(plot_rows, plot_cols, 5);
dsp_plot(abs(fft(x)), 'X[n] (fft())');

subplot(plot_rows, plot_cols, 6);
dsp_plot(real(X), 'ReX[n]');

subplot(plot_rows, plot_cols, 7);
dsp_plot(imag(X), 'ImX[n]');
