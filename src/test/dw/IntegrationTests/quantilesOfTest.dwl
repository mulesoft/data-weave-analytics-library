
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test quantilesOf" describedBy [
    "Assert Big Examples" in do {
        evalPath("IntegrationTests/quantilesOf.dwl", inputsFrom("IntegrationTests/quantilesOf/Big Examples"),"application/json") must
                  equalTo(outputFrom("IntegrationTests/quantilesOf/Big Examples"))
    },
]

