function s_k = dsp_dft_basis_sin(k, N)

i = 1:N;
s_k = sin(2 * pi * k * i / N);
