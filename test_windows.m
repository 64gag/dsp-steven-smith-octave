N = 128;

x_o = 0;
if (true)
    x_o = dsp_dft_basis_cos(N, 4);
else
    x_o = zeros(N, 1);
    x_o(1) = N;
    x_o(N / 2) = N;
end

[x_o, fs] = audioread('/home/paguiar/Desktop/eee.ogg', [1; 400]);
%[x_o, fs] = audioread('/home/paguiar/Desktop/eee.ogg');
fs

%w = ones(rows(x_o), 1);
w = hamming(rows(x_o));
%w = blackman(rows(x_o));

x = x_o .* w;

X = dsp_dft2(x);

plot_rows = 5;
plot_cols = 1;
close all

subplot(plot_rows, plot_cols, 1);
dsp_plot(x_o, 'title', 'x_o[n]');

subplot(plot_rows, plot_cols, 2);
dsp_plot(w, 'title', 'w[n]');

subplot(plot_rows, plot_cols, 3);
dsp_plot(x, 'title', 'x[n]');

subplot(plot_rows, plot_cols, 4);
dsp_plot(abs(X), 'title', 'MagX[n]', 'horizontal_axis', 4, 'sampling_frequency', fs);

subplot(plot_rows, plot_cols, 5);
dsp_plot(abs(fft(x)), 'title', 'X[n] (fft())');
