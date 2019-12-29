function s_k = dsp_dft_basis_cos(k, N)

i = 1:N;
s_k = cos(2 * pi * k * i / N);
