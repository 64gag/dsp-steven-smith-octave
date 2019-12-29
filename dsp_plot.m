function p = dsp_plot(y, plot_title)

p = plot(y, 'o');
xticks(1:rows(y));
title(plot_title);
