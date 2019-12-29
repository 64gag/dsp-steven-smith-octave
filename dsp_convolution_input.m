function y = dsp_convolution_input(x, h)

y_size = rows(x) + rows(h) - 1;
y = zeros(y_size, 1);

for index_x = 1:rows(x)
    for index_h = 1:rows(h)
        index_y = index_x + index_h - 1;

        y(index_y) += x(index_x) * h(index_h);
    end
end
