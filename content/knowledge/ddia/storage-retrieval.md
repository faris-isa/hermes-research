---
title: "DDIA — Storage and Retrieval"
description: "Chapter 3: LSM-trees, B-trees, column-oriented storage, OLTP vs OLAP."
tags:
  - ddia
  - storage
  - lsm-tree
  - b-tree
  - oltp
  - olap
---

# Storage and Retrieval

Chapter 3 of [[Designing Data-Intensive Applications]].

## OLTP vs OLAP

| Aspect | OLTP | OLAP |
|--------|------|------|
| **Purpose** | Transaction processing | Analytics |
| **Access pattern** | High volume, small queries | Low volume, complex queries |
| **Bottleneck** | Disk seek time | Disk bandwidth |
| **Data model** | Row-oriented | Column-oriented |
| **Examples** | PostgreSQL, MySQL | ClickHouse, BigQuery |

## Log-Structured Storage (LSM-Trees)

### How It Works

1. **Write** goes to in-memory memtable (sorted)
2. When memtable is full → flush to disk as **SSTable** (sorted string table)
3. **Compaction** merges SSTables in background

### Key Concepts

| Concept | Description |
|---------|-------------|
| **SSTable** | Immutable, sorted file on disk |
| **Memtable** | In-memory sorted buffer |
| **Compaction** | Background merging of SSTables |
| **Write Amplification** | Single logical write → multiple physical writes |
| **Bloom Filter** | Probabilistic check to avoid unnecessary disk reads |

### Pros/Cons

**Pros:**
- Excellent write throughput (append-only)
- Good compression (sorted data)
- No random writes

**Cons:**
- Write amplification during compaction
- Compaction can consume I/O
- Range queries require merging multiple SSTables

**Examples:** LevelDB, RocksDB, Cassandra, Lucene/Elasticsearch

## B-Trees

### How It Works

- Balanced tree of fixed-size pages
- O(log n) depth
- Updates modify pages in place
- Uses WAL (Write-Ahead Log) for crash recovery

### Key Concepts

| Concept | Description |
|---------|-------------|
| **Page** | Fixed-size block (typically 4KB) |
| **Branching factor** | Number of children per node |
| **WAL** | Append-only log for crash recovery |
| **Copy-on-write** | COW B-trees avoid in-place updates |

### Pros/Cons

**Pros:**
- Good read performance (single path from root to leaf)
- No compaction needed
- Predictable performance

**Cons:**
- Random writes (slower than sequential)
- Page fragmentation
- Write amplification (full page written for small update)

**Examples:** PostgreSQL, MySQL/InnoDB, SQLite

## LSM-Tree vs B-Tree

| Aspect | LSM-Tree | B-Tree |
|--------|----------|--------|
| **Write throughput** | Higher (sequential) | Lower (random) |
| **Read throughput** | Lower (multiple SSTables) | Higher (single path) |
| **Write amplification** | Higher (compaction) | Lower |
| **Space amplification** | Lower (compression) | Higher (fragmentation) |
| **Latency predictability** | Variable (compaction spikes) | More predictable |

## Column-Oriented Storage

### How It Works

Store each column separately instead of each row.

```
Row-oriented:                Column-oriented:
┌────┬────┬────┐            ┌────┬────┬────┐
│ A1 │ B1 │ C1 │            │ A1 │ A2 │ A3 │
│ A2 │ B2 │ C2 │            │ B1 │ B2 │ B3 │
│ A3 │ B3 │ C3 │            │ C1 │ C2 │ C3 │
└────┴────┴────┘            └────┴────┴────┘
```

### Benefits

- **Compression:** Similar values in same column compress well
- **Vectorized processing:** Process entire columns at once
- **Column pruning:** Only read needed columns

### When to Use

- OLAP workloads (aggregations, analytics)
- Read-heavy with specific column access
- Large datasets where compression matters

**Examples:** ClickHouse, Apache Parquet, BigQuery, Redshift

## Materialized Views

Precomputed query results stored as tables.

**Trade-offs:**
- Faster reads (precomputed)
- Slower writes (must update view)
- Storage overhead

## Related
- [[Designing Data-Intensive Applications]]
- [[DDIA — Data Models]]
- [[DDIA — Encoding and Evolution]]
