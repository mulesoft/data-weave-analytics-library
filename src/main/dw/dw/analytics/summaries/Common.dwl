%dw 2.0

import * from dw::analytics::Statistics

fun summary(values: Array<Number>): Object = {
    mean: mean(values),
    modes: modes(values),
    median: median(values),
    stdev: stdev(values),
    quartiles: 4 quantilesOf values
}

