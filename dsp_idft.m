function x = dsp_idft(X_real, X_imaginary)

N = 2 * (rows(X_real) - 1);
x = zeros(N, 1);

[amplitudes_real, amplitudes_imaginary] = dsp_dft_to_synthesis_amplitudes(X_real, X_imaginary);

for i = 0 : N - 1
    for k = 0 : N / 2
        x(i + 1) += amplitudes_real(k + 1) * dsp_dft_basis_cos(N, k, i);
        x(i + 1) += amplitudes_imaginary(k + 1) * dsp_dft_basis_sin(N, k, i);
    end
end
