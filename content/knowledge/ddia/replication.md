---
title: "DDIA — Replication"
description: "Chapter 5: Single-leader, multi-leader, leaderless replication and consistency."
tags:
  - ddia
  - replication
  - consistency
  - distributed
---

# Replication

Chapter 5 of [[Designing Data-Intensive Applications]].

## Why Replicate?

| Goal | Description |
|------|-------------|
| **High availability** | System stays up if nodes fail |
| **Disconnected operation** | Continue working offline |
| **Low latency** | Serve reads from nearby replicas |
| **Read scalability** | Distribute read load |

## Replication Topologies

### Single-Leader Replication

```
Clients → Leader → Followers (replicas)
         (writes)  (reads)
```

- Writes go to leader only
- Followers receive change stream
- Reads can go to any node

**Replication methods:**

| Method | Description | Risk |
|--------|-------------|------|
| **Synchronous** | Leader waits for follower confirmation | Write latency increases |
| **Asynchronous** | Leader doesn't wait | Data loss on leader failure |
| **Semi-synchronous** | Some followers synchronous | Compromise |

### Multi-Leader Replication

```
Clients → Leader A ←→ Leader B ←→ Leader C
         (writes)     (writes)     (writes)
```

- Multiple nodes accept writes
- Leaders replicate to each other
- Use case: multi-datacenter, offline clients

**Conflict resolution:**
- Last-write-wins (LWW)
- Merge values
- Custom resolution logic

### Leaderless Replication

```
Clients → Node A
         → Node B  (quorum reads/writes)
         → Node C
```

- No single leader
- Reads/writes to multiple nodes
- Quorum: `r + w > n` for consistency

**Examples:** Cassandra, DynamoDB, Riak

## Replication Lag Problems

| Problem | Description | Solution |
|---------|-------------|----------|
| **Read-after-write** | Don't see own writes | Read from leader |
| **Monotonic reads** | Data goes backward in time | Consistent prefix |
| **Consistent prefix** | Out-of-order causation | Causal ordering |

## Related
- [[Designing Data-Intensive Applications]]
- [[DDIA — Partitioning]]
- [[DDIA — Consistency and Consensus]]
