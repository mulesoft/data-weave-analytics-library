
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test quantilesOf" describedBy [
    "Assert Big Examples" in do {
        runMapping("IntegrationTests/quantilesOf.dwl", inputsOf("IntegrationTests/quantilesOf/Big Examples"),"application/json") must
                  equalTo(outputOf("IntegrationTests/quantilesOf/Big Examples"))
    },
]

