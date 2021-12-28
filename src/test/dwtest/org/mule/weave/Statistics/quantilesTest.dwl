%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import quantiles from org::mule::weave::Statistics
---
"Test quantiles" describedBy [
    "On empty array it should return null" in do {
        quantiles([], 4) must beNull()
    },
    "On small n it should return null" in do {
        quantiles([1, 2, 3, 4], 1) must beNull()
    },
    "On odd array with n=2 it should return the medium point" in do {
        quantiles([2, 3, -10], 2) must equalTo([2])
    },
    "Big array" in do {
        quantiles([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 4) must equalTo([3, 5.5, 8])
    },
    "It should work on n = sizeOf(array) + 1" in do {
        quantiles([1,2], 3) must equalTo([1, 2])
    },
]
