%dw 2.0

import * from org::mule::weave::Statistics

fun summary(values: Array<Number>): Object = {
    mean: mean(values),
    modes: modes(values),
    median: median(values),
    stdev: stdev(values),
    quartiles: quantiles(values, 4)
}

