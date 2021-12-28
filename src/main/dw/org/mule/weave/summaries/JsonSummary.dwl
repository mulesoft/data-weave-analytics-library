%dw 2.0

import * from org::mule::weave::summaries::Common

input payload json
output application/json

---
payload mapObject ((value, key, index) -> {(key): summary(value)})