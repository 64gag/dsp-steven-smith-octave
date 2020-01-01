function [amplitudes_real, amplitudes_imaginary] = dsp_dft_to_synthesis_amplitudes(X_real, X_imaginary)

N = 2 * (rows(X_real) - 1);

% Convert between sinusoidal amplitudes and frequency domain (Eq. 8-3)
amplitudes_real = X_real / (N / 2);
amplitudes_imaginary = X_imaginary / (-N / 2);

% Two special cases (Eq. 8-3)
amplitudes_real(1) /= 2;
amplitudes_real(end) /= 2;
