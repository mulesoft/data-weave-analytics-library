
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test org::mule::weave::summaries::JsonSummary" describedBy [
    "Assert default" in do {
        runMapping("analytics/summaries/JsonSummary.dwl", inputsOf("analytics/summaries/JsonSummary/default"),"application/json") must
                  equalTo(outputOf("analytics/summaries/JsonSummary/default"))
    }
]
