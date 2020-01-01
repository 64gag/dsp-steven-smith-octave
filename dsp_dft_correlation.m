function [X_real, X_imaginary] = dsp_dft_correlation(x)

N = rows(x);

X_real = zeros(N / 2 + 1, 1);
X_imaginary = zeros(N / 2 + 1, 1);

for k = 0 : N / 2
    for i = 0 : N - 1
        X_real(k + 1) += x(i + 1) * dsp_dft_basis_cos(N, k, i);
        X_imaginary(k + 1) -= x(i + 1) * dsp_dft_basis_sin(N, k, i);
    end
end
