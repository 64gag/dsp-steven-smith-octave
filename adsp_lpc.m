close all
clear all

[y, fs] = audioread('/home/paguiar/Desktop/eee.ogg');
N_frame = 2 ^ 8
N_lpc = 12
S = 10;
overlap_frame = N_frame / 2
overlap_frame = 0

time_frame_s = 1 / fs * N_frame
size(y)
fs

decimate_factor = 5;
y = y(decimate_factor : decimate_factor : end);
fs /= decimate_factor;

time_frame_s = 1 / fs * N_frame
size(y)
fs

%w = ones(N_frame, 1);
w = hamming(N_frame);
%w = blackman(N_frame);

subplot_rows = 5;
subplot_cols = 1;


for s = 1 : S
    y_low_lim = 1 + (N_frame - overlap_frame) * (s - 1)
    y_high_lim = N_frame + (N_frame - overlap_frame) * (s - 1)

    y_frame = y(y_low_lim : y_high_lim);
    y_windowed = y_frame .* w;
    Y_windowed = abs(dsp_dft2(y_frame));

    figure 1
    subplot(subplot_rows, subplot_cols, 1);
    dsp_plot(y_frame, 'title', 'Y frame', 'horizontal_axis', 1, 'xticks');

    subplot(subplot_rows, subplot_cols, 2);
    dsp_plot(y_windowed, 'title', 'Y windowed', 'horizontal_axis', 1, 'xticks');

    subplot(subplot_rows, subplot_cols, 3);
    dsp_plot(Y_windowed, 'title', 'Y windowed', 'horizontal_axis', 4, 'sampling_frequency', fs, 'xticks_n', 10, 'xticks');

    drawnow
end
