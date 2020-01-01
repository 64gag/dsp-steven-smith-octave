function x = dsp_idft(X)

N = 2 * (rows(X) - 1);
x = zeros(N, 1);

amplitudes = dsp_dft_to_synthesis_amplitudes(X);
amplitudes_real = real(amplitudes);
amplitudes_imag = imag(amplitudes);

for i = 0 : N - 1
    for k = 0 : N / 2
        x(i + 1) += amplitudes_real(k + 1) * dsp_dft_basis_cos(N, k, i);
        x(i + 1) += amplitudes_imag(k + 1) * dsp_dft_basis_sin(N, k, i);
    end
end
