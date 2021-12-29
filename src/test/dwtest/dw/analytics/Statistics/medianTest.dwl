%dw 2.0
import median from dw::analytics::Statistics

import * from dw::test::Tests
import * from dw::test::Asserts

---
"Test median" describedBy [
    "It returns null upon an empty array" in do {
        median([]) must beNull()
    },
    "It returns the median on an odd length array" in do {
        median([5, 1, 3, 4, 2]) must equalTo(3)
    },
    "It returns the average between the two median ones on even arrays" in do {
        median([10, 1, 10, 7, 4.5, 1]) must equalTo(5.75)
    },
    "Over null input should return null" in do {
        median(null) must beNull()
    },
]

