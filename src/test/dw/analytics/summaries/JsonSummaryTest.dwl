
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test org::mule::weave::summaries::JsonSummary" describedBy [
    "Assert default" in do {
        evalPath("analytics/summaries/JsonSummary.dwl", inputsFrom("analytics/summaries/JsonSummary/default"),"application/json") must
                  equalTo(outputFrom("analytics/summaries/JsonSummary/default"))
    }
]
