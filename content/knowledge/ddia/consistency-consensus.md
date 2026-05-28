---
title: "DDIA — Consistency and Consensus"
description: "Chapter 9: Linearizability, total ordering, consensus algorithms."
tags:
  - ddia
  - consistency
  - consensus
  - linearizability
---

# Consistency and Consensus

Chapter 9 of [[Designing Data-Intensive Applications]].

## Consistency Models

### Eventual Consistency

If no new writes, eventually all replicas converge to same value.

**Weak but:** Simple, performant, sufficient for many use cases.

### Linearizability (Strong Consistency)

Every operation appears to take effect atomically at some point between invocation and response.

**Strong but:** Performance cost, harder to implement.

### Causal Consistency

Preserves causal ordering of operations.

**Middle ground:** Stronger than eventual, weaker than linearizable.

## Total Ordering

### Leader-Based

Leader defines total order. Simple but single point of failure.

### Lamport Timestamps

```
counter++ on each event
on communication: counter = max(local, received) + 1
```

**Problem:** Doesn't define unique total order (concurrent events).

### Vector Clocks

Track causality per node.

```
[node1: 3, node2: 2, node3: 1]
```

**Problem:** Complex, high overhead.

## Consensus Algorithms

### The Problem

Get multiple nodes to agree on a value.

### Paxos

- Leader-based
- Two phases: prepare, accept
- Complex to implement correctly
- Used in Chubby, Spanner

### Raft

- Leader-based (simpler than Paxos)
- Leader election + log replication
- More understandable
- Used in etcd, CockroachDB, TiKV

### ZAB

- Leader-based
- Used in ZooKeeper
- Similar to Raft

## Distributed Transactions

### Two-Phase Commit (2PC)

```
Coordinator → Prepare → Participants vote YES/NO
            → Commit/Abort → Participants apply
```

**Problem:** Blocking protocol (coordinator failure blocks all).

### Three-Phase Commit (3PC)

- Adds pre-commit phase
- Non-blocking in theory
- Rarely used in practice

## Related
- [[Designing Data-Intensive Applications]]
- [[DDIA — Replication]]
- [[DDIA — Transactions]]
