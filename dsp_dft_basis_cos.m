function c = dsp_dft_basis_cos(N, k, i = -1, phase = 0)

if (i == -1)
    i = (0 : N - 1)';
end

c = cos(2 * pi * k * i / N + phase);
