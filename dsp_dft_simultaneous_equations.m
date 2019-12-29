function X = dsp_dft_simultaneous_equations(x)

% To do this, take the first sample from each sinusoid and add them together.
% The sum must be equal to the first sample in the time domain signal,
% thus providing the first equation.
% Likewise, an equation can be written for each of the remaining points
% in the time domain signal, resulting in the required N equations.

N = rows(x);

for i = 1 : N
    sines_addition = 0
    for k = 0 : N / 2 - 1
        sines_addition += dsp_dft_basis_cos(k, N)(i) + dsp_dft_basis_sin(k, N)(i);
    end
    x(i) == sines_addition
end
