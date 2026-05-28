---
title: "DDIA — Transactions"
description: "Chapter 7: ACID, isolation levels, MVCC, two-phase locking."
tags:
  - ddia
  - transactions
  - acid
  - mvcc
  - isolation
---

# Transactions

Chapter 7 of [[Designing Data-Intensive Applications]].

## ACID Properties

| Property | Definition |
|----------|-----------|
| **Atomicity** | All or nothing (no partial writes) |
| **Consistency** | Data integrity (application-defined) |
| **Isolation** | Concurrent transactions don't interfere |
| **Durability** | Committed data persists after faults |

## Weak Isolation Problems

| Problem | Description |
|---------|-------------|
| **Dirty read** | Reading uncommitted data |
| **Dirty write** | Overwriting uncommitted data |
| **Read skew** | Inconsistent read across tables |
| **Lost update** | Two transactions overwrite each other |
| **Write skew** | Conditional writes based on stale read |

## Isolation Levels

### Read Committed

- Prevents dirty reads and dirty writes
- Default in PostgreSQL, Oracle
- Most common level

### Snapshot Isolation (Repeatable Read)

- Prevents dirty reads, writes, and read skew
- Uses **MVCC** (Multi-Version Concurrency Control)
- Each transaction sees consistent snapshot

### Serializable

- Prevents all anomalies
- Implementations:

| Implementation | Description | Performance |
|---------------|-------------|-------------|
| **Serial execution** | One transaction at a time | Poor throughput |
| **Two-Phase Locking (2PL)** | Shared/exclusive locks | Deadlock risk |
| **SSI (Serializable Snapshot Isolation)** | Detects read-write conflicts | Best performance |

## MVCC (Multi-Version Concurrency Control)

Each write creates a new version. Readers see consistent snapshot without blocking writers.

```
Transaction 1 (start: t1) reads version at t1
Transaction 2 (start: t2) creates new version
Transaction 1 still sees old version (snapshot at t1)
```

## Related
- [[Designing Data-Intensive Applications]]
- [[DDIA — Replication]]
- [[DDIA — Distributed Troubles]]
