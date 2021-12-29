%dw 2.0

import * from dw::test::Tests
import * from dw::test::Asserts

import mean from dw::analytics::Statistics
---
"Test mean" describedBy [
    "Returns null on empty" in do {
        mean([]) must beNull()
    },
    "Single element returns that element" in do {
        mean([2]) must equalTo(2)
    },
    "Many elements returns the mean" in do {
        mean([1, 2, 3, 4, 5]) must equalTo(3)
    },
    "Over null input should return null" in do {
        mean(null) must beNull()
    },
]
