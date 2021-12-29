%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import stdev from dw::analytics::Statistics
---
"Test stdev" describedBy [
    "It should return null on empty array" in do {
        stdev([]) must beNull()
    },
    "It should work on big array" in do {
        stdev([2, 4, 4, 4, 5, 5, 7, 9]) must [$ > 1.99999999999, $ < 2.000000000001]
    },
    "Over null input should return null" in do {
        stdev(null) must beNull()
    },
]
