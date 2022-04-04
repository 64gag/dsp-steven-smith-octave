close all
clear all

N = 2 ^ 6;
S = 10;

while true
    X_averaged = zeros(N / 2 + 1, 1);


    %[y, fs] = audioread('/home/paguiar/Desktop/G_chord.ogg');

    fs = 8000;
    nbits = 16;
    channels = 1;
    length = 0.2;
    datatype = "double";
    recorder = audiorecorder(fs, nbits, channels);
    recordblocking(recorder, length);
    y = getaudiodata(recorder, datatype);
    player = audioplayer(y, fs, nbits);
    play(player);

    size(y)
    fs

    decimate_factor = 1;
    %y = y(decimate_factor : decimate_factor : end);
    fs /= decimate_factor;
    size(y)
    fs

    %w = ones(N, 1);
    %w = hamming(N);
    w = blackman(N);

    subplot_rows = S / 2;
    subplot_cols = 2;

    for s = 1 : S
        y_low_lim = 1 + N * (s - 1);
        y_high_lim = N * s;
        x_o = y(y_low_lim : y_high_lim);

        x = x_o .* w;
        X = dsp_dft2(x);

        %figure 1
        %subplot(subplot_rows, subplot_cols, s);
        %dsp_plot(abs(X), 'title', 'X', 'horizontal_axis', 4, 'sampling_frequency', fs);

        X_averaged += abs(X) / S;
    end

    figure 2
    dsp_plot(abs(X_averaged), 'title', 'X averaged', 'horizontal_axis', 4, 'sampling_frequency', fs);
    sleep(0.001)
end
