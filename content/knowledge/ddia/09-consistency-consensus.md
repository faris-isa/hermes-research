     1|---
     2|title: "DDIA — Consistency and Consensus"
     3|description: "Chapter 9: Linearizability, total ordering, consensus algorithms."
     4|tags:
     5|  - ddia
     6|  - consistency
     7|  - consensus
     8|  - linearizability
     9|---
    10|
    11|# Consistency and Consensus
    12|
    13|Chapter 9 of [[Designing Data-Intensive Applications]].
    14|
    15|## Consistency Models
    16|
    17|### Eventual Consistency
    18|
    19|If no new writes, eventually all replicas converge to same value.
    20|
    21|**Weak but:** Simple, performant, sufficient for many use cases.
    22|
    23|### Linearizability (Strong Consistency)
    24|
    25|Every operation appears to take effect atomically at some point between invocation and response.
    26|
    27|**Strong but:** Performance cost, harder to implement.
    28|
    29|### Causal Consistency
    30|
    31|Preserves causal ordering of operations.
    32|
    33|**Middle ground:** Stronger than eventual, weaker than linearizable.
    34|
    35|## Total Ordering
    36|
    37|### Leader-Based
    38|
    39|Leader defines total order. Simple but single point of failure.
    40|
    41|### Lamport Timestamps
    42|
    43|```
    44|counter++ on each event
    45|on communication: counter = max(local, received) + 1
    46|```
    47|
    48|**Problem:** Doesn't define unique total order (concurrent events).
    49|
    50|### Vector Clocks
    51|
    52|Track causality per node.
    53|
    54|```
    55|[node1: 3, node2: 2, node3: 1]
    56|```
    57|
    58|**Problem:** Complex, high overhead.
    59|
    60|## Consensus Algorithms
    61|
    62|### The Problem
    63|
    64|Get multiple nodes to agree on a value.
    65|
    66|### Paxos
    67|
    68|- Leader-based
    69|- Two phases: prepare, accept
    70|- Complex to implement correctly
    71|- Used in Chubby, Spanner
    72|
    73|### Raft
    74|
    75|- Leader-based (simpler than Paxos)
    76|- Leader election + log replication
    77|- More understandable
    78|- Used in etcd, CockroachDB, TiKV
    79|
    80|### ZAB
    81|
    82|- Leader-based
    83|- Used in ZooKeeper
    84|- Similar to Raft
    85|
    86|## Distributed Transactions
    87|
    88|### Two-Phase Commit (2PC)
    89|
    90|```
    91|Coordinator → Prepare → Participants vote YES/NO
    92|            → Commit/Abort → Participants apply
    93|```
    94|
    95|**Problem:** Blocking protocol (coordinator failure blocks all).
    96|
    97|### Three-Phase Commit (3PC)
    98|
    99|- Adds pre-commit phase
   100|- Non-blocking in theory
   101|- Rarely used in practice
   102|
   103|## Related
   104|- [[Designing Data-Intensive Applications]]
   105|- [[DDIA — Replication]]
   106|- [[DDIA — Transactions]]
   107|