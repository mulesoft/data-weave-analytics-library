%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import frequencies from org::mule::weave::Statistics
---
"Test frequencies" describedBy [
    "Empty array returns empty array" in do {
        frequencies([]) must equalTo([])
    },
    "Unique element array" in do {
        frequencies([1, 1, 1]) must equalTo([{value: 1, occurrences: 3}])
    },
    "Multiple elemnts array" in do {
        frequencies([1, 2, 11, 1, 1, 2]) must equalTo([
            {value: 1, occurrences: 3},
            {value: 2, occurrences: 2},
            {value: 11, occurrences: 1}
        ])
    },
]
