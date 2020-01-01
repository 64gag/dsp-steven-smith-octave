function [X_real, X_imaginary] = dsp_dft_from_synthesis_amplitudes(amplitudes_real, amplitudes_imaginary)

N = 2 * (rows(amplitudes_real) - 1);

% Convert between sinusoidal amplitudes and frequency domain (Eq. 8-3)
X_real = amplitudes_real * (N / 2);
X_imaginary = amplitudes_imaginary * (-N / 2);

% Two special cases (Eq. 8-3)
X_real(1) *= 2;
X_real(end) *= 2;
