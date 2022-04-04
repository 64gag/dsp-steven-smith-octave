
N = 64;

plot_rows = 2;
plot_cols = 1;
close all

subplot(plot_rows, plot_cols, 1);
dsp_plot(dsp_dft_basis_cos(N, 1), 'cos');

subplot(plot_rows, plot_cols, 2);
dsp_plot(dsp_dft_basis_sin(N, 1), 'sin');
