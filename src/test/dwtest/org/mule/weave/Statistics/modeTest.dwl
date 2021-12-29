%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import mode from org::mule::weave::Statistics
---
"Test mode" describedBy [
    "Should return null on empty array" in do {
        mode([]) must beNull()
    },
    "Should return the most common element" in do {
        mode([1, 2, 4, 4, 2, 4]) must equalTo(4)
    },
    "Should return the first most common element if there are many" in do {
        mode([2, 1, 1, 2]) must equalTo(2)
    },
    "Over null input should return null" in do {
        mode(null) must beNull()
    },
]

