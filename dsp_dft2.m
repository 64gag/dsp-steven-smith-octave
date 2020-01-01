function X = dsp_dft2(x)

% DFT by Correlation

N = rows(x);

X_real = zeros(N / 2 + 1, 1);
X_imag = zeros(N / 2 + 1, 1);

for k = 0 : N / 2
    for i = 0 : N - 1
        X_real(k + 1) += x(i + 1) * dsp_dft_basis_cos(N, k, i);
        X_imag(k + 1) -= x(i + 1) * dsp_dft_basis_sin(N, k, i);
    end
end

X = complex(X_real, X_imag);
