     1|---
     2|title: "DDIA — Partitioning"
     3|description: "Chapter 6: Key range vs hash partitioning, secondary indexes."
     4|tags:
     5|  - ddia
     6|  - partitioning
     7|  - sharding
     8|  - distributed
     9|---
    10|
    11|# Partitioning
    12|
    13|Chapter 6 of [[Designing Data-Intensive Applications]].
    14|
    15|## Why Partition?
    16|
    17|- Dataset too large for one machine
    18|- Spread load across multiple nodes
    19|- Reduce hotspots
    20|
    21|## Partitioning Methods
    22|
    23|### Key Range Partitioning
    24|
    25|```
    26|Partition 1: A - G
    27|Partition 2: H - N
    28|Partition 3: O - Z
    29|```
    30|
    31|**Pros:**
    32|- Efficient range queries
    33|- Clear ordering
    34|
    35|**Cons:**
    36|- Risk of hotspots (sequential keys)
    37|- Rebalancing requires splitting ranges
    38|
    39|### Hash Partitioning
    40|
    41|```
    42|hash(key) % num_partitions
    43|```
    44|
    45|**Pros:**
    46|- Even distribution
    47|- No hotspots (with good hash function)
    48|
    49|**Cons:**
    50|- Destroys ordering (range queries inefficient)
    51|- Fixed partition count (rehashing is expensive)
    52|
    53|**Best practice:** `partition_count > node_count` (not `hash mod N`)
    54|
    55|## Secondary Indexes
    56|
    57|### Document-Partitioned (Local)
    58|
    59|Index lives in same partition as data.
    60|
    61|```
    62|Partition 1: { doc1, doc2 } → Index: { doc1, doc2 }
    63|Partition 2: { doc3, doc4 } → Index: { doc3, doc4 }
    64|```
    65|
    66|- ✅ Writes are local
    67|- ❌ Reads scatter across partitions
    68|
    69|### Term-Partitioned (Global)
    70|
    71|Index itself is partitioned.
    72|
    73|```
    74|Index Partition A: { term1 → [doc1, doc3] }
    75|Index Partition B: { term2 → [doc2, doc4] }
    76|```
    77|
    78|- ✅ Reads are local
    79|- ❌ Writes affect multiple partitions
    80|
    81|## Rebalancing
    82|
    83|| Strategy | Description |
    84||----------|-------------|
    85|| **Fixed number of partitions** | More partitions than nodes, assign to nodes |
    86|| **Dynamic partitioning** | Split/merge partitions based on size |
    87|| **Proportional to nodes** | Each node has same number of partitions |
    88|
    89|## Related
    90|- [[Designing Data-Intensive Applications]]
    91|- [[DDIA — Replication]]
    92|- [[DDIA — Transactions]]
    93|