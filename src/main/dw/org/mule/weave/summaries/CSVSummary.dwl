%dw 2.0
import * from org::mule::weave::summaries::Common

input payload csv
output application/json


var keys = keysOf(payload[0])

---
keys reduce ((item, accumulator = {}) -> accumulator ++
    {(item): summary(payload[item])}
)