
%dw 2.0
import * from dw::test::Tests
import * from dw::test::Asserts
---
"Test org::mule::weave::summaries::CSVSummary" describedBy [
    "Assert default" in do {
        evalPath("analytics/summaries/CSVSummary.dwl", inputsFrom("analytics/summaries/CSVSummary/default"),"application/json") must
                  equalTo(outputFrom("analytics/summaries/CSVSummary/default"))
    },
    "Assert One Column" in do {
        evalPath("analytics/summaries/CSVSummary.dwl", inputsFrom("analytics/summaries/CSVSummary/One Column"),"application/json") must
                  equalTo(outputFrom("analytics/summaries/CSVSummary/One Column"))
    }
]
