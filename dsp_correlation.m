function y = dsp_correlation(x, t)

y = dsp_convolution_input(x, flip(t));
