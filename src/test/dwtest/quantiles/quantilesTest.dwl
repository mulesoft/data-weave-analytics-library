
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test quantiles" describedBy [
    "Assert Big Examples" in do {
        runMapping("quantiles.dwl", inputsOf("quantiles/Big Examples"),"application/json") must
                  equalTo(outputOf("quantiles/Big Examples"))
    },
]
