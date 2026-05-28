     1|---
     2|title: "DDIA — Replication"
     3|description: "Chapter 5: Single-leader, multi-leader, leaderless replication and consistency."
     4|tags:
     5|  - ddia
     6|  - replication
     7|  - consistency
     8|  - distributed
     9|---
    10|
    11|# Replication
    12|
    13|Chapter 5 of [[Designing Data-Intensive Applications]].
    14|
    15|## Why Replicate?
    16|
    17|| Goal | Description |
    18||------|-------------|
    19|| **High availability** | System stays up if nodes fail |
    20|| **Disconnected operation** | Continue working offline |
    21|| **Low latency** | Serve reads from nearby replicas |
    22|| **Read scalability** | Distribute read load |
    23|
    24|## Replication Topologies
    25|
    26|### Single-Leader Replication
    27|
    28|```
    29|Clients → Leader → Followers (replicas)
    30|         (writes)  (reads)
    31|```
    32|
    33|- Writes go to leader only
    34|- Followers receive change stream
    35|- Reads can go to any node
    36|
    37|**Replication methods:**
    38|
    39|| Method | Description | Risk |
    40||--------|-------------|------|
    41|| **Synchronous** | Leader waits for follower confirmation | Write latency increases |
    42|| **Asynchronous** | Leader doesn't wait | Data loss on leader failure |
    43|| **Semi-synchronous** | Some followers synchronous | Compromise |
    44|
    45|### Multi-Leader Replication
    46|
    47|```
    48|Clients → Leader A ←→ Leader B ←→ Leader C
    49|         (writes)     (writes)     (writes)
    50|```
    51|
    52|- Multiple nodes accept writes
    53|- Leaders replicate to each other
    54|- Use case: multi-datacenter, offline clients
    55|
    56|**Conflict resolution:**
    57|- Last-write-wins (LWW)
    58|- Merge values
    59|- Custom resolution logic
    60|
    61|### Leaderless Replication
    62|
    63|```
    64|Clients → Node A
    65|         → Node B  (quorum reads/writes)
    66|         → Node C
    67|```
    68|
    69|- No single leader
    70|- Reads/writes to multiple nodes
    71|- Quorum: `r + w > n` for consistency
    72|
    73|**Examples:** Cassandra, DynamoDB, Riak
    74|
    75|## Replication Lag Problems
    76|
    77|| Problem | Description | Solution |
    78||---------|-------------|----------|
    79|| **Read-after-write** | Don't see own writes | Read from leader |
    80|| **Monotonic reads** | Data goes backward in time | Consistent prefix |
    81|| **Consistent prefix** | Out-of-order causation | Causal ordering |
    82|
    83|## Related
    84|- [[Designing Data-Intensive Applications]]
    85|- [[DDIA — Partitioning]]
    86|- [[DDIA — Consistency and Consensus]]
    87|