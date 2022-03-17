/** This module defines common functions for all summaries.
 */
%dw 2.0

import * from analytics::Statistics

/**
* The `summary` function combines different metrics from the `Statistics` module.
*
* === Parameters
*
* [%header, cols="1,1,3"]
* |===
* | Name | Type | Description
* | `values` | `Array<Number&#62;` | The values to pull statistics from
* |===
*
* === Example
*
* This example shows how the `summary` behaves with a simple array of values.
*
* ==== Source
*
* [source,DataWeave,linenums]
* ----
* %dw 2.0
* output application/json
*
* import summary from analytics::summaries::Common
* ---
* summary([0, 1, 44])
* ----
*
* ==== Output
*
* [source,Json,linenums]
* ----
* {
*  mean: 15,
*  modes: [
*    0, 
*    1, 
*    44
*  ],
*  median: 1,
*  stdev: 20.51016008388687995680331206045045,
*  quartiles: [
*    0, 
*    1, 
*    44
*  ]
* }
* ----
*
*/
fun summary(values: Array<Number>): Object = {
    mean: mean(values),
    modes: modes(values),
    median: median(values),
    stdev: stdev(values),
    quartiles: 4 quantilesOf values
}

