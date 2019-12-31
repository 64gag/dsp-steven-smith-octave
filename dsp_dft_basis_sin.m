function s = dsp_dft_basis_sin(N, k, i = -1, phase = 0)

s = dsp_dft_basis_cos(N, k, i, phase - pi / 2);
