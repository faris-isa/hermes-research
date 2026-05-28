---
title: "Designing Data-Intensive Applications"
description: "Complete reference for Martin Kleppmann's DDIA — distributed systems, storage engines, replication, and data processing."
tags:
  - ddia
  - distributed-systems
  - databases
  - architecture
---

# Designing Data-Intensive Applications

**DDIA** by Martin Kleppmann is the definitive guide to building systems that handle large volumes of data, high traffic, and complex distributed workflows.

> *"If you're serious about building systems that handle lots of data, high traffic, or complex distributed workflows, this book is a must-read."*

## Book Structure

### Part I: Foundations of Data Systems

- [[Reliable Scalable Maintainable]] — The three pillars of data system design
- [[Data Models]] — Relational, document, and graph models
- [[Storage and Retrieval]] — LSM-trees, B-trees, column-oriented storage
- [[Encoding and Evolution]] — Schema evolution, Protobuf, Avro, compatibility

### Part II: Distributed Data

- [[Replication]] — Single-leader, multi-leader, leaderless replication
- [[Partitioning]] — Key range vs hash partitioning, secondary indexes
- [[Transactions]] — ACID, isolation levels, MVCC, 2PL
- [[Distributed Troubles]] — Clocks, timeouts, failure detection
- [[Consistency and Consensus]] — Linearizability, consensus algorithms

### Part III: Derived Data

- [[Batch Processing]] — MapReduce, Spark, dataflow engines
- [[Stream Processing]] — Event logs, change data capture, complex event processing
- [[Future of Data Systems]] — Ethical considerations, data as assets

## Key Principles

### The Three Properties

| Property | Definition | Key Concern |
|----------|-----------|-------------|
| **Reliability** | System works correctly despite faults | Fault tolerance vs prevention |
| **Scalability** | Good performance under increased load | Tail latency (p99, p999) |
| **Maintainability** | Easy for teams to work with | Operability, simplicity, evolvability |

### Fault vs Failure

> **Fault** = one component deviating from specs
> **Failure** = the system as a whole stops working

Prefer **fault tolerance** over fault prevention.

## Why This Matters for Manufacturing

Understanding DDIA concepts directly applies to the [[Ajinomoto MES]]:

| DDIA Concept | MES Application |
|-------------|-----------------|
| [[Replication]] | Cassandra replication for downtime data |
| [[Partitioning]] | Time-based partitioning in InfluxDB |
| [[Storage and Retrieval]] | Cassandra's LSM-tree storage engine |
| [[Stream Processing]] | Kafka → Downtime Detector |
| [[Batch Processing]] | OEE report generation |

## Related
- [[Ajinomoto MES]]
- [[System Architecture]]
