function amplitudes = dsp_dft_to_synthesis_amplitudes(X)

N = 2 * (rows(X) - 1);

% Convert between sinusoidal amplitudes and frequency domain (Eq. 8-3)
amplitudes_real = real(X) / (N / 2);
amplitudes_imag = imag(X) / (-N / 2);

% Two special cases (Eq. 8-3)
amplitudes_real(1) /= 2;
amplitudes_real(end) /= 2;

amplitudes = complex(amplitudes_real, amplitudes_imag);
