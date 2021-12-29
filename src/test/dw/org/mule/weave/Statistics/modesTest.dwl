%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import modes from org::mule::weave::Statistics
---
"Test modes" describedBy [
    "Should return empty array on empty array" in do {
        modes([]) must beEmpty()
    },
    "Should return the most common element" in do {
        modes([1, 2, 4, 4, 2, 4]) must equalTo([4])
    },
    "Should return the first most common element if there are many" in do {
        modes([2, 1, 1, 2]) must equalTo([2, 1])
    },
]
