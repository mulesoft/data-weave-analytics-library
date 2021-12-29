%dw 2.0

output application/json

import * from org::mule::weave::Statistics
---

{
    a: 2 quantilesOf [1, 2, 3, 4, 5],
    b: 3 quantilesOf [1, 2, 3, 4, 5],
    c: 4 quantilesOf [1, 2, 3, 4, 5],
    d: 5 quantilesOf [1, 2, 3, 4, 5],
    
    e: 2 quantilesOf [1, 1, 1],
    f: 3 quantilesOf [1, 1, 1],

    g: 2 quantilesOf []
}