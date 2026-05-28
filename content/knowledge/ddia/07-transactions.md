     1|---
     2|title: "DDIA — Transactions"
     3|description: "Chapter 7: ACID, isolation levels, MVCC, two-phase locking."
     4|tags:
     5|  - ddia
     6|  - transactions
     7|  - acid
     8|  - mvcc
     9|  - isolation
    10|---
    11|
    12|# Transactions
    13|
    14|Chapter 7 of [[Designing Data-Intensive Applications]].
    15|
    16|## ACID Properties
    17|
    18|| Property | Definition |
    19||----------|-----------|
    20|| **Atomicity** | All or nothing (no partial writes) |
    21|| **Consistency** | Data integrity (application-defined) |
    22|| **Isolation** | Concurrent transactions don't interfere |
    23|| **Durability** | Committed data persists after faults |
    24|
    25|## Weak Isolation Problems
    26|
    27|| Problem | Description |
    28||---------|-------------|
    29|| **Dirty read** | Reading uncommitted data |
    30|| **Dirty write** | Overwriting uncommitted data |
    31|| **Read skew** | Inconsistent read across tables |
    32|| **Lost update** | Two transactions overwrite each other |
    33|| **Write skew** | Conditional writes based on stale read |
    34|
    35|## Isolation Levels
    36|
    37|### Read Committed
    38|
    39|- Prevents dirty reads and dirty writes
    40|- Default in PostgreSQL, Oracle
    41|- Most common level
    42|
    43|### Snapshot Isolation (Repeatable Read)
    44|
    45|- Prevents dirty reads, writes, and read skew
    46|- Uses **MVCC** (Multi-Version Concurrency Control)
    47|- Each transaction sees consistent snapshot
    48|
    49|### Serializable
    50|
    51|- Prevents all anomalies
    52|- Implementations:
    53|
    54|| Implementation | Description | Performance |
    55||---------------|-------------|-------------|
    56|| **Serial execution** | One transaction at a time | Poor throughput |
    57|| **Two-Phase Locking (2PL)** | Shared/exclusive locks | Deadlock risk |
    58|| **SSI (Serializable Snapshot Isolation)** | Detects read-write conflicts | Best performance |
    59|
    60|## MVCC (Multi-Version Concurrency Control)
    61|
    62|Each write creates a new version. Readers see consistent snapshot without blocking writers.
    63|
    64|```
    65|Transaction 1 (start: t1) reads version at t1
    66|Transaction 2 (start: t2) creates new version
    67|Transaction 1 still sees old version (snapshot at t1)
    68|```
    69|
    70|## Related
    71|- [[Designing Data-Intensive Applications]]
    72|- [[DDIA — Replication]]
    73|- [[DDIA — Distributed Troubles]]
    74|