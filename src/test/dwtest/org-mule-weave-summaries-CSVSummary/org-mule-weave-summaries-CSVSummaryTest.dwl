
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test org::mule::weave::summaries::CSVSummary" describedBy [
    "Assert default" in do {
        runMapping("org/mule/weave/summaries/CSVSummary.dwl", inputsOf("org-mule-weave-summaries-CSVSummary/default"),"application/json") must
                  equalTo(outputOf("org-mule-weave-summaries-CSVSummary/default"))
    },
    "Assert One Column" in do {
        runMapping("org/mule/weave/summaries/CSVSummary.dwl", inputsOf("org-mule-weave-summaries-CSVSummary/One Column"),"application/json") must
                  equalTo(outputOf("org-mule-weave-summaries-CSVSummary/One Column"))
    }
]
