     1|---
     2|title: "DDIA — Storage and Retrieval"
     3|description: "Chapter 3: LSM-trees, B-trees, column-oriented storage, OLTP vs OLAP."
     4|tags:
     5|  - ddia
     6|  - storage
     7|  - lsm-tree
     8|  - b-tree
     9|  - oltp
    10|  - olap
    11|---
    12|
    13|# Storage and Retrieval
    14|
    15|Chapter 3 of [[Designing Data-Intensive Applications]].
    16|
    17|## OLTP vs OLAP
    18|
    19|| Aspect | OLTP | OLAP |
    20||--------|------|------|
    21|| **Purpose** | Transaction processing | Analytics |
    22|| **Access pattern** | High volume, small queries | Low volume, complex queries |
    23|| **Bottleneck** | Disk seek time | Disk bandwidth |
    24|| **Data model** | Row-oriented | Column-oriented |
    25|| **Examples** | PostgreSQL, MySQL | ClickHouse, BigQuery |
    26|
    27|## Log-Structured Storage (LSM-Trees)
    28|
    29|### How It Works
    30|
    31|1. **Write** goes to in-memory memtable (sorted)
    32|2. When memtable is full → flush to disk as **SSTable** (sorted string table)
    33|3. **Compaction** merges SSTables in background
    34|
    35|### Key Concepts
    36|
    37|| Concept | Description |
    38||---------|-------------|
    39|| **SSTable** | Immutable, sorted file on disk |
    40|| **Memtable** | In-memory sorted buffer |
    41|| **Compaction** | Background merging of SSTables |
    42|| **Write Amplification** | Single logical write → multiple physical writes |
    43|| **Bloom Filter** | Probabilistic check to avoid unnecessary disk reads |
    44|
    45|### Pros/Cons
    46|
    47|**Pros:**
    48|- Excellent write throughput (append-only)
    49|- Good compression (sorted data)
    50|- No random writes
    51|
    52|**Cons:**
    53|- Write amplification during compaction
    54|- Compaction can consume I/O
    55|- Range queries require merging multiple SSTables
    56|
    57|**Examples:** LevelDB, RocksDB, Cassandra, Lucene/Elasticsearch
    58|
    59|## B-Trees
    60|
    61|### How It Works
    62|
    63|- Balanced tree of fixed-size pages
    64|- O(log n) depth
    65|- Updates modify pages in place
    66|- Uses WAL (Write-Ahead Log) for crash recovery
    67|
    68|### Key Concepts
    69|
    70|| Concept | Description |
    71||---------|-------------|
    72|| **Page** | Fixed-size block (typically 4KB) |
    73|| **Branching factor** | Number of children per node |
    74|| **WAL** | Append-only log for crash recovery |
    75|| **Copy-on-write** | COW B-trees avoid in-place updates |
    76|
    77|### Pros/Cons
    78|
    79|**Pros:**
    80|- Good read performance (single path from root to leaf)
    81|- No compaction needed
    82|- Predictable performance
    83|
    84|**Cons:**
    85|- Random writes (slower than sequential)
    86|- Page fragmentation
    87|- Write amplification (full page written for small update)
    88|
    89|**Examples:** PostgreSQL, MySQL/InnoDB, SQLite
    90|
    91|## LSM-Tree vs B-Tree
    92|
    93|| Aspect | LSM-Tree | B-Tree |
    94||--------|----------|--------|
    95|| **Write throughput** | Higher (sequential) | Lower (random) |
    96|| **Read throughput** | Lower (multiple SSTables) | Higher (single path) |
    97|| **Write amplification** | Higher (compaction) | Lower |
    98|| **Space amplification** | Lower (compression) | Higher (fragmentation) |
    99|| **Latency predictability** | Variable (compaction spikes) | More predictable |
   100|
   101|## Column-Oriented Storage
   102|
   103|### How It Works
   104|
   105|Store each column separately instead of each row.
   106|
   107|```
   108|Row-oriented:                Column-oriented:
   109|┌────┬────┬────┐            ┌────┬────┬────┐
   110|│ A1 │ B1 │ C1 │            │ A1 │ A2 │ A3 │
   111|│ A2 │ B2 │ C2 │            │ B1 │ B2 │ B3 │
   112|│ A3 │ B3 │ C3 │            │ C1 │ C2 │ C3 │
   113|└────┴────┴────┘            └────┴────┴────┘
   114|```
   115|
   116|### Benefits
   117|
   118|- **Compression:** Similar values in same column compress well
   119|- **Vectorized processing:** Process entire columns at once
   120|- **Column pruning:** Only read needed columns
   121|
   122|### When to Use
   123|
   124|- OLAP workloads (aggregations, analytics)
   125|- Read-heavy with specific column access
   126|- Large datasets where compression matters
   127|
   128|**Examples:** ClickHouse, Apache Parquet, BigQuery, Redshift
   129|
   130|## Materialized Views
   131|
   132|Precomputed query results stored as tables.
   133|
   134|**Trade-offs:**
   135|- Faster reads (precomputed)
   136|- Slower writes (must update view)
   137|- Storage overhead
   138|
   139|## Related
   140|- [[Designing Data-Intensive Applications]]
   141|- [[DDIA — Data Models]]
   142|- [[DDIA — Encoding and Evolution]]
   143|