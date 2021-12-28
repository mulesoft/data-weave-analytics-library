%dw 2.0

output application/json

import * from org::mule::weave::Statistics
---

{
    a: [1, 2, 3, 4, 5] quantiles 2,
    b: [1, 2, 3, 4, 5] quantiles 3,
    c: [1, 2, 3, 4, 5] quantiles 4,
    d: [1, 2, 3, 4, 5] quantiles 5,
    
    e: [1, 1, 1] quantiles 2,
    f: [1, 1, 1] quantiles 3,

    g: [] quantiles 2
}