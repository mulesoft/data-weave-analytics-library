# DataWeave Analytics Library

[![Development Branch](https://github.com/mulesoft/data-weave-analytics-library/actions/workflows/master_workflow.yml/badge.svg?branch=master)](https://github.com/mulesoft/data-weave-analytics-library/actions/workflows/master_workflow.yml)

The DataWeave Analytics library provides a collection of simple functions
intended to perform data analysis over datasets.
DataWeave, which supports data transformations in multiple formats, is a
fast analyzer for datasets. This library fills a gap in
some commonly used functionalities.

## Overview

The `CSVSummary` on `analytics::summaries` consumes a CSV file and produces
a summary of the values on the different columns present in it.

For example, assume the following CSV input:

```csv
id,time,age
1,234,18
2,333,24
3,108,15
4,444,44
```

The `CSVSummary` mapping produces the following JSON output from the CSV input:

```json
{
  "id": {
    "mean": 2.5,
    "modes": [
      "1",
      "2",
      "3",
      "4"
    ],
    "median": 2.5,
    "stdev": 1.118033988749895,
    "quartiles": [
      1.5,
      2.5,
      3.5
    ]
  },
  "time": {
    "mean": 279.75,
    "modes": [
      "234",
      "333",
      "108",
      "444"
    ],
    "median": 283.5,
    "stdev": 123.8999092009352523399554085511010,
    "quartiles": [
      171,
      283.5,
      388.5
    ]
  },
  "age": {
    "mean": 25.25,
    "modes": [
      "18",
      "24",
      "15",
      "44"
    ],
    "median": 21,
    "stdev": 11.29988937998952271159312403049506,
    "quartiles": [
      16.5,
      21,
      34
    ]
  }
}
```

Notice that the result provides a summary consisting of the mean, the modes, the median,
the standard deviation, and the quartiles of the values of each column in the CSV file.

## Contributions Welcome

Contributions to this project can be made through Pull Requests and Issues on the
[GitHub Repository](https://github.com/mulesoft/data-weave-analytics-library).

Before creating a pull request review the following:

* [LICENSE](https://github.com/mulesoft/data-weave-analytics-library/blob/master/LICENSE.txt)
* [SECURITY](https://github.com/mulesoft/data-weave-analytics-library/blob/master/SECURITY.md)
* [CODE_OF_CONDUCT](https://github.com/mulesoft/data-weave-analytics-library/blob/master/CODE_OF_CONDUCT.md)

When you submit your pull request, you are asked to sign a contributor license agreement (CLA) if we don't have one on file for you.