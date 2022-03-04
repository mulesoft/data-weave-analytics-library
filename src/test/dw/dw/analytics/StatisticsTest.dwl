%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts

import * from dw::analytics::Statistics
---
"Statistics Test" describedBy  [
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
        "Over null input should return null" in do {
            frequencies(null) must beNull()
        },
    ],
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
    ],
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
    ],
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
        "Over null input should return null" in do {
            modes(null) must beNull()
        },
    ],
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
    ],
    "Test quantilesOf" describedBy [
        "On empty array it should return null" in do {
            quantilesOf(4, []) must beNull()
        },
        "On small n it should return null" in do {
            quantilesOf(1, [1, 2, 3, 4]) must beNull()
        },
        "On odd array with n=2 it should return the medium point" in do {
            quantilesOf(2, [2, 3, -10]) must equalTo([2])
        },
        "Big array" in do {
            quantilesOf(4, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) must equalTo([3, 5.5, 8])
        },
        "It should work on n = sizeOf(array) + 1" in do {
            quantilesOf(3, [1, 2]) must equalTo([1, 2])
        },
        "Over null input should return null" in do {
            quantilesOf(true, null) must beNull()
        },
    ],
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
    ],
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
]
