function ret = dsp_step(signal_size_or_vector, signal_amplitude = 1, signal_step_index = 1)

is_signal_vector = false;

if (columns(signal_size_or_vector) > 1)
    is_signal_vector = true;
endif

if (is_signal_vector == true)
    signal_vector = signal_size_or_vector;
    signal_size = columns(signal_vector);
    t0_index = find(signal_vector == 0, 1);

    step = zeros(1, signal_size);
    step(t0_index:end) = signal_amplitude;
else
    signal_size = signal_size_or_vector;
    step = zeros(1, signal_size);
    step(signal_step_index:end) = 1;
    step *= signal_amplitude;
endif

ret = step;
