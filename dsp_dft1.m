function [X_real, X_imaginary] = dsp_dft1(x)

% DFT by Simultaneous Equations

% To do this, take the first sample from each sinusoid and add them together.
% The sum must be equal to the first sample in the time domain signal,
% thus providing the first equation.
% Likewise, an equation can be written for each of the remaining points
% in the time domain signal, resulting in the required N equations.

N = rows(x);

A = zeros(N);

for i = 0 : N - 1
    for k = 0 : N / 2
        A(i + 1, k + 1) = dsp_dft_basis_cos(N, k, i);

        if (k >= 1 && k <= N)
            A(i + 1, N / 2 + k + 1) = dsp_dft_basis_sin(N, k, i);
        end
    end
end

% Equations solving through matrices is usually expressed using the
% notation A * x = b
% Unfortunately in this case 'x' holds the time domain signal...
% (TODO change names maybe?)
b = x;

eq_solution = linsolve(A, b);
amplitudes_real = eq_solution(1 : N / 2 + 1);
amplitudes_imaginary = [0; eq_solution(N / 2 + 2 : N); 0];

[X_real, X_imaginary] = dsp_dft_from_synthesis_amplitudes(amplitudes_real, amplitudes_imaginary);
