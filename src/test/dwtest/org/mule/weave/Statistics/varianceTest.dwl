%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import variance from org::mule::weave::Statistics
---
"Test variance" describedBy [
    "It should return null on empty array" in do {
        variance([]) must beNull()
    },
    "It should work on big array" in do {
        variance([2, 4, 4, 4, 5, 5, 7, 9]) must [$ > 3.99999999999, $ < 4.000000000001]
    },
    "Over null input should return null" in do {
        variance(null) must beNull()
    },
]
