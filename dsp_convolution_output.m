function y = dsp_convolution_output(x, h)

y_size = rows(x) + rows(h) - 1;
y = zeros(y_size, 1);

for index_y = 1:rows(y)
    for index_h = 1:rows(h)
        index_x = index_y - index_h + 1;

        if (index_x >= 1 && index_x <= rows(x))
            y(index_y) += x(index_x) * h(index_h);
        end
    end
end
