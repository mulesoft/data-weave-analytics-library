
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test org::mule::weave::summaries::JsonSummary" describedBy [
    "Assert default" in do {
        runMapping("dw/analytics/summaries/JsonSummary.dwl", inputsOf("dw-analytics-summaries-JsonSummary/default"),"application/json") must
                  equalTo(outputOf("dw-analytics-summaries-JsonSummary/default"))
    }
]
