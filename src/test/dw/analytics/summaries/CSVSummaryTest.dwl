
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test org::mule::weave::summaries::CSVSummary" describedBy [
    "Assert default" in do {
        runMapping("analytics/summaries/CSVSummary.dwl", inputsOf("analytics/summaries/CSVSummary/default"),"application/json") must
                  equalTo(outputOf("analytics/summaries/CSVSummary/default"))
    },
    "Assert One Column" in do {
        runMapping("analytics/summaries/CSVSummary.dwl", inputsOf("analytics/summaries/CSVSummary/One Column"),"application/json") must
                  equalTo(outputOf("analytics/summaries/CSVSummary/One Column"))
    }
]
