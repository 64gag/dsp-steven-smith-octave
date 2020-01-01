function X = dsp_dft_from_synthesis_amplitudes(amplitudes)

N = 2 * (rows(amplitudes) - 1);

% Convert between sinusoidal amplitudes and frequency domain (Eq. 8-3)
X_real = real(amplitudes) * (N / 2);
X_imag = imag(amplitudes) * (-N / 2);

% Two special cases (Eq. 8-3)
X_real(1) *= 2;
X_real(end) *= 2;

X = complex(X_real, X_imag);
