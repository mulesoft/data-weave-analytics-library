
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test org::mule::weave::summaries::JsonSummary" describedBy [
    "Assert default" in do {
        runMapping("org/mule/weave/summaries/JsonSummary.dwl", inputsOf("org-mule-weave-summaries-JsonSummary/default"),"application/json") must
                  equalTo(outputOf("org-mule-weave-summaries-JsonSummary/default"))
    }
]
