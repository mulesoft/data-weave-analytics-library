/** Transform a JSON file into a summary of some important statistics.
 */
%dw 2.0

import * from analytics::summaries::Common

input payload json
output application/json

---
payload mapObject ((value, key, index) -> {(key): summary(value)})