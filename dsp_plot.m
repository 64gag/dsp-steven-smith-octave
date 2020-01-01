function dsp_plot(y, varargin)

p = inputParser();

p.addParameter('title', '', @ischar)
p.addParameter('horizontal_axis', 1)
p.addParameter('sampling_frequency', 3000)
p.addParameter('xticks_n', 1)

p.addSwitch('xticks')

p.parse(varargin{:});

x = 0 : rows(y) - 1;
switch (p.Results.horizontal_axis)
    case {2, 'sample_rate'}
        x /= (2 * x(end));
    case {3, 'natural_frequency'}
        x /= (x(end) / pi);
    case {4, 'analog_frequency'}
        x /= (2 * x(end) / p.Results.sampling_frequency);
end

plot(x, y, 'o');

if (p.Results.xticks)
    if (p.Results.xticks_n != 1)
        xticks(x(1 : ceil(columns(x) / p.Results.xticks_n) : end));
    else
        xticks(x)
    end
end

title(p.Results.title);
