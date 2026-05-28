     1|---
     2|title: "DDIA — Batch Processing"
     3|description: "Chapter 10: MapReduce, Spark, dataflow engines."
     4|tags:
     5|  - ddia
     6|  - batch-processing
     7|  - mapreduce
     8|  - spark
     9|---
    10|
    11|# Batch Processing
    12|
    13|Chapter 10 of [[Designing Data-Intensive Applications]].
    14|
    15|## What Is Batch Processing?
    16|
    17|Process large datasets in bulk. Input is finite, output is new data.
    18|
    19|**Use cases:**
    20|- Daily/weekly reports
    21|- ETL (Extract, Transform, Load)
    22|- Machine learning training
    23|- Search index building
    24|
    25|## Unix Philosophy
    26|
    27|```
    28|cat access.log | sort | uniq -c | sort -rn | head -20
    29|```
    30|
    31|- Each tool does one thing well
    32|- Pipes connect tools
    33|- Works on streams of data
    34|
    35|## MapReduce
    36|
    37|### The Model
    38|
    39|```
    40|map(key, value) → list of (key, value)
    41|reduce(key, list of values) → single value
    42|```
    43|
    44|### Example: Word Count
    45|
    46|```python
    47|def map(key, value):
    48|    for word in value.split():
    49|        emit(word, 1)
    50|
    51|def reduce(key, values):
    52|    emit(key, sum(values))
    53|```
    54|
    55|### Execution
    56|
    57|1. Split input into chunks
    58|2. Run map on each chunk (parallel)
    59|3. Shuffle (group by key)
    60|4. Run reduce on each group (parallel)
    61|
    62|### Problems
    63|
    64|| Problem | Description |
    65||---------|-------------|
    66|| **Write amplification** | Intermediate data written to disk |
    67|| **Map-side joins** | Require sorted input |
    68|| **Small files** | Many small outputs = overhead |
    69|| **Debugging** | Hard to debug distributed logic |
    70|
    71|## Dataflow Engines
    72|
    73|### Spark
    74|
    75|- In-memory processing (10-100x faster than MapReduce)
    76|- Lazy evaluation
    77|- Rich API (SQL, DataFrame, MLlib)
    78|
    79|### Flink
    80|
    81|- True stream processing (can also batch)
    82|- Event time processing
    83|- Exactly-once semantics
    84|
    85|### Comparison
    86|
    87|| Aspect | MapReduce | Spark | Flink |
    88||--------|-----------|-------|-------|
    89|| **Speed** | Slow | Fast | Fast |
    90|| **Fault tolerance** | Disk-based | RDD lineage | Checkpointing |
    91|| **State management** | Limited | Limited | Rich |
    92|| **Streaming** | No | Micro-batch | True streaming |
    93|
    94|## Related
    95|- [[Designing Data-Intensive Applications]]
    96|- [[DDIA — Stream Processing]]
    97|