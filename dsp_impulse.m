function ret = dsp_impulse(signal_size_or_vector, signal_amplitude = 1)

is_signal_vector = false;

if (columns(signal_size_or_vector) > 1)
    is_signal_vector = true;
endif

if (is_signal_vector == true)
    signal_vector = signal_size_or_vector;
    signal_size = columns(signal_vector);
    t0_index = find(signal_vector == 0, 1);

    impulse = zeros(1, signal_size);
    impulse(t0_index) = signal_amplitude;
else
    signal_size = signal_size_or_vector;
    impulse = zeros(1, signal_size);
    impulse(1) = signal_amplitude;
endif

ret = impulse;
