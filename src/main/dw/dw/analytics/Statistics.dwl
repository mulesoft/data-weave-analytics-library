/**
* This module provides basic functionality for analyzing
* datasets of numeric and non-numeric values.
*/
%dw 2.0


/** 
* Returns the mean of an array of numbers,
* or `null` if the array is empty.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `values` | `Array<Number&#62`; | Array of numeric or null values.
* |===
*
* === Example
*
* This example shows how `mean` behaves with an array of numbers.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import mean from dw::analytics::Statistics
* ---
* mean([1, 2, 3, 4, 5])
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* 3
* ----
*
* === Example
*
* This example shows how `mean` behaves with an empty array.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import mean from dw::analytics::Statistics
* ---
* mean([]) default "N/A"
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* "N/A"
* ----
*
*/
fun mean(values: Array<Number>): Number | Null = 
  if (isEmpty(values))
    null
  else
    sum(values) / sizeOf(values)

/**
* Helper function that enables `mean` to work with a `null` value.
*/
fun mean(values: Null): Null = null

/** 
* Returns the median value of an array.
*
* If the length of the array is even, returns the average of the two median values.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `values` | `Array<Number&#62;` | Array of numeric or null values.
* |===
*
* === Example
*
* This example shows how `median` behaves.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import median from dw::analytics::Statistics
* ---
* median([3, 1, 4])
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* 3
* ----
*
*/
fun median(values: Array<Number>): Number | Null =
  quantilesOf(2, values)[0]

/**
* Helper function that enables `median` to work with a `null` value.
*/
fun median(values: Null): Null = null

/** 
* Returns the number of occurrences of each
* distinct element in an array.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `values` | `Array<T&#62;` | The array of values to evaluate.
* |===
*
* === Example
*
* This example shows how `frequencies` behaves with an array of numbers.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import frequencies from dw::analytics::Statistics 
* ---
* frequencies([1, 2, 11, 1, 1, 2])
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* [
*   {value: 1, occurrences: 3},
*   {value: 2, occurrences: 2},
*   {value: 11, occurrences: 1}
* ]
* ----
*
*/
fun frequencies<T>(values: Array<T>): Array<{value: T, occurrences: Number}> = do {
  var uniques = values distinctBy ((item, index) -> item)
  ---
  uniques map ((item, index) -> {
    value: item,
    occurrences: sizeOf(values find item)
  })
}

/**
* Helper function that enables `frequencies` to work with a `null` value.
*/
fun frequencies(values: Null): Null = null

/** 
* Returns the most common value in the array
* of values.
*
* If more than one value has the most number of
* occurrences, the first value is returned.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | values | Array<T&#62; | Array of values to evaluate.
* |===
*
* === Example
*
* This example shows how `mode` behaves with an arbitrary array.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import mode from dw::analytics::Statistics
* ---
* mode(["hello", "world", "data", "weave", "data"])
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* "data"
* ----
*
*/
fun mode<T>(values: Array<T>): T | Null =
  modes(values)[0]

/**
* Helper function that enables `mode` to work with a `null` value.
*/
fun mode(values: Null): Null = null

/** 
* Returns the values with the most
* number of occurrences.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `values` | `Array<T&#62;` | Array of values to evaluate.
* |===
*
* === Example
*
* This example shows how `modes` behaves with an arbitrary array.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import mode from dw::analytics::Statistics
* ---
* modes(["hello", "world", "data", "weave", "data", "hello"])
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* ["hello", "data"]
* ----
*
*/
fun modes<T>(values: Array<T>): Array<T> = do {
  var freq = frequencies(values)
  var maxOcc = freq map ((item, index) -> item.occurrences) maxBy ((item) -> item)
  ---
  freq filter ((item, index) -> item.occurrences == maxOcc) map ((item, index) -> item.value)
}

/**
* Helper function that enables `modes` to work with a `null` value.
*/
fun modes(values: Null): Null = null


/** 
* Returns the points that separate the
* values in `n` parts of equal size.
*
* If the middle point of two points is taken, the function returns the 
* average of both points.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `values` | `Array<Number&#62;` | Array of numeric values to evaluate.
* | `n` | `Number` | The desired number of quantiles.
* |===
*
* === Example
*
* This example shows how the `quantilesOf` behaves with an arbitrary array.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import * from dw::analytics::Statistics
* ---
* 3 quantilesOf [1, 2, 3, 4, 5]
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* [2, 4]
* ----
*
*/
fun quantilesOf(n: Number, values: Array<Number>): Array<Number> | Null  =
  if (n < 2 or sizeOf(values) < (n - 1))
    null
  else
    do {
      var size = sizeOf(values)
      var sortedValues = values orderBy ((item, index) -> item)
      var indx = 1 to (n - 1) map ((item, index) -> size * item / n)
      ---
      indx map ((item, index) ->
      if (floor(item) == item)
        mean(sortedValues[(item - 1) to item]) default 0
      else
        sortedValues[floor(item)]
      )
    }


/**
* Helper function that enables `quantilesOf` to work with a `null` value.
*/
fun quantilesOf(n: Any, values: Null): Null = null

/** 
* Returns the variance of the given set of
* values.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `values` | `Array<Number&#62;` | Array of numbers to evaluate.
* |===
*
* === Example
*
* This example shows how the `variance` behaves with an arbitrary array.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import variance from dw::analytics::Statistics
* ---
* variance([1, 2, 3, 2])
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* 0.5
* ----
*
*/
fun variance(values: Array<Number>): Number | Null = do {
  var valuesMean = mean(values) default 0
  var deviations = values map ((item, index) -> pow(item - valuesMean, 2))
  ---
  mean(deviations)
}

/**
* Helper function that enables `variance` to work with a `null` value.
*/
fun variance(values: Null): Null = null

/** 
* Returns the standard deviation of the
* given set of values.
*
* The standard deviation is defined as the square root
* of the variance.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* |  `values` | `Array<Number&#62;` | Array of numbers to evaluate.
* |===
*
* === Example
*
* This example shows how `stdev` behaves with an arbitrary array.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
* 
* import stdev from dw::analytics::Statistics
* ---
* stdev([1, 2, 3, 2])
*
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* 0.7071067811865475244008443621048491
* ----
*
*/
fun stdev(values: Array<Number>): Number | Null =
  variance(values) then ((previousResult) -> sqrt(previousResult))

/**
* Helper function that enables `stdev` to work with a `null` value.
*/
fun stdev(values: Null): Null = null
