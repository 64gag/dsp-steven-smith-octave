function p = dsp_plot(y, plot_title)

x = 0 : rows(y) - 1;
p = plot(x, y, 'o');
xticks(x);
title(plot_title);
