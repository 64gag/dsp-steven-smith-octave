function ret = dsp_shift(signal, shift_times, circular = 0)

shifted = shift(signal, shift_times);

if (!circular)
    %shifted(1:shift_times) = zeros(1, shift_times);
    shifted(1:shift_times) = 0;
endif

ret = shifted;
