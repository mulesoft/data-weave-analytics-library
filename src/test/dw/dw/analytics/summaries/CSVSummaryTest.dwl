
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test org::mule::weave::summaries::CSVSummary" describedBy [
    "Assert default" in do {
        runMapping("dw/analytics/summaries/CSVSummary.dwl", inputsOf("dw/analytics/summaries/CSVSummary/default"),"application/json") must
                  equalTo(outputOf("dw/analytics/summaries/CSVSummary/default"))
    },
    "Assert One Column" in do {
        runMapping("dw/analytics/summaries/CSVSummary.dwl", inputsOf("dw/analytics/summaries/CSVSummary/One Column"),"application/json") must
                  equalTo(outputOf("dw/analytics/summaries/CSVSummary/One Column"))
    }
]
