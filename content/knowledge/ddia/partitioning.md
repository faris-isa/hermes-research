---
title: "DDIA — Partitioning"
description: "Chapter 6: Key range vs hash partitioning, secondary indexes."
tags:
  - ddia
  - partitioning
  - sharding
  - distributed
---

# Partitioning

Chapter 6 of [[Designing Data-Intensive Applications]].

## Why Partition?

- Dataset too large for one machine
- Spread load across multiple nodes
- Reduce hotspots

## Partitioning Methods

### Key Range Partitioning

```
Partition 1: A - G
Partition 2: H - N
Partition 3: O - Z
```

**Pros:**
- Efficient range queries
- Clear ordering

**Cons:**
- Risk of hotspots (sequential keys)
- Rebalancing requires splitting ranges

### Hash Partitioning

```
hash(key) % num_partitions
```

**Pros:**
- Even distribution
- No hotspots (with good hash function)

**Cons:**
- Destroys ordering (range queries inefficient)
- Fixed partition count (rehashing is expensive)

**Best practice:** `partition_count > node_count` (not `hash mod N`)

## Secondary Indexes

### Document-Partitioned (Local)

Index lives in same partition as data.

```
Partition 1: { doc1, doc2 } → Index: { doc1, doc2 }
Partition 2: { doc3, doc4 } → Index: { doc3, doc4 }
```

- ✅ Writes are local
- ❌ Reads scatter across partitions

### Term-Partitioned (Global)

Index itself is partitioned.

```
Index Partition A: { term1 → [doc1, doc3] }
Index Partition B: { term2 → [doc2, doc4] }
```

- ✅ Reads are local
- ❌ Writes affect multiple partitions

## Rebalancing

| Strategy | Description |
|----------|-------------|
| **Fixed number of partitions** | More partitions than nodes, assign to nodes |
| **Dynamic partitioning** | Split/merge partitions based on size |
| **Proportional to nodes** | Each node has same number of partitions |

## Related
- [[Designing Data-Intensive Applications]]
- [[DDIA — Replication]]
- [[DDIA — Transactions]]
