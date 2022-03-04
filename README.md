# DataWeave Analytics Library

The DataWeave Analytics library provides a collection of simple functions
intended to perform data analysis over datasets.
DataWeave, which supports data transformations in multiple formats, is a
quickly analyzes datasets. This library fills a gap in
some commonly used functionalities.

## Summaries

The `summary` function under `org::mule::weave::summaries::Common` provides a summary
of a dataset of numerical values. The `CSVSummary` and `JsonSummary` mappings directly go
from CSV or JSON files, respectively, and produce a summary of the values in them.

For example, assume the following CSV input:


```csv
id,time,age
1,234,18
2,333,24
3,108,15
4,444,44
```

The`CSVSummary` mapping produces the following JSON output from the CSV input:

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
    "stdev": 1.118033988749894848204586834365638,
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

Notice that the results provide a summary of the values of each column in the CSV file.
