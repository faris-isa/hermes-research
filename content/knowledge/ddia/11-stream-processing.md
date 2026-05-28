     1|---
     2|title: "DDIA — Stream Processing"
     3|description: "Chapter 11: Event logs, change data capture, complex event processing."
     4|tags:
     5|  - ddia
     6|  - stream-processing
     7|  - kafka
     8|  - event-sourcing
     9|---
    10|
    11|# Stream Processing
    12|
    13|Chapter 11 of [[Designing Data-Intensive Applications]].
    14|
    15|## Batch vs Stream
    16|
    17|| Aspect | Batch | Stream |
    18||--------|-------|--------|
    19|| **Input** | Finite dataset | Unbounded stream |
    20|| **Latency** | Minutes to hours | Milliseconds to seconds |
    21|| **Output** | New dataset | Updated results |
    22|
    23|## Event Streams
    24|
    25|### Event Log
    26|
    27|Append-only sequence of events.
    28|
    29|```
    30|Event 1: user123 clicked "buy"
    31|Event 2: user456 viewed product
    32|Event 3: user123 completed purchase
    33|```
    34|
    35|### Kafka Architecture
    36|
    37|```
    38|Producer → Topic (partitioned) → Consumer Group
    39|```
    40|
    41|- Topics split into partitions
    42|- Partitions provide ordering guarantee
    43|- Consumer groups distribute load
    44|
    45|## Change Data Capture (CDC)
    46|
    47|Capture changes from database and stream them.
    48|
    49|### Methods
    50|
    51|| Method | Description | Pros/Cons |
    52||--------|-------------|-----------|
    53|| **Trigger-based** | Database triggers on change | Slow, invasive |
    54|| **Log-based** | Read database WAL/binlog | Fast, non-invasive |
    55|| **Polling** | Periodic SELECT queries | Simple but slow |
    56|
    57|### CDC Pipeline
    58|
    59|```
    60|PostgreSQL → Debezium → Kafka → Elasticsearch (search index)
    61|                          ↓
    62|                      Cassandra (analytics)
    63|```
    64|
    65|## Stream Processing Patterns
    66|
    67|### Windowing
    68|
    69|| Window Type | Description |
    70||-------------|-------------|
    71|| **Tumbling** | Fixed, non-overlapping |
    72|| **Sliding** | Overlapping |
    73|| **Session** | Activity-based (gap = session end) |
    74|
    75|### Joins
    76|
    77|- **Stream-Stream:** Join two streams by time window
    78|- **Stream-Table:** Join stream with lookup table
    79|- **Table-Table:** Join two materialized views
    80|
    81|### Exactly-Once Semantics
    82|
    83|Ensure each event processed exactly once (no duplicates, no misses).
    84|
    85|**Techniques:**
    86|- Transactional writes (atomic commit)
    87|- Idempotent operations (safe to retry)
    88|- Deduplication (event IDs)
    89|
    90|## Related
    91|- [[Designing Data-Intensive Applications]]
    92|- [[DDIA — Batch Processing]]
    93|- [[Ajinomoto MES]]
    94|- [[System Architecture]]
    95|