---
title: "Knowledge Base"
description: "Domain knowledge and technical references."
tags:
  - knowledge
---

# 📚 Knowledge Base

Domain knowledge and technical references. These are **standalone concepts** — not tied to any specific project.

## Topics

### [[OEE Knowledge Index]]
Complete reference for Overall Equipment Effectiveness:
- [[OEE Calculation Deep Dive]] — Formulas, hierarchy, aggregation
- [[Six Big Losses]] — The six categories of production loss
- [[Hidden Factory]] — Untapped capacity without capital investment
- [[World-Class OEE and Benchmarks]] — Targets and industry data
- [[Batch vs Continuous OEE]] — Manufacturing paradigm differences
- [[Batch OEE Deep Dive]] — Batch-specific calculations and pitfalls
- [[OEE Improvement Strategies]] — TPM, SMED, error-proofing
- [[Common OEE Mistakes]] — Calculation pitfalls and measurement errors

### [[Designing Data-Intensive Applications]]
Martin Kleppmann's definitive guide to distributed systems and data-intensive applications:
- [[Part 01 — Reliable, Scalable, Maintainable]] — The three pillars of data system design
- [[Part 02 — Data Models and Query Languages]] — Relational, document, and graph models
- [[Part 03 — Storage and Retrieval]] — LSM-trees, B-trees, column-oriented storage
- [[Part 04 — Encoding and Evolution]] — Schema evolution, Protobuf, Avro
- [[Part 05 — Replication]] — Single-leader, multi-leader, leaderless replication
- [[Part 06 — Partitioning]] — Key range vs hash partitioning
- [[Part 07 — Transactions]] — ACID, isolation levels, MVCC
- [[Part 08 — The Trouble with Distributed Systems]] — Clocks, timeouts, failure detection
- [[Part 09 — Consistency and Consensus]] — Linearizability, consensus algorithms
- [[Part 10 — Batch Processing]] — MapReduce, Spark, dataflow engines
- [[Part 11 — Stream Processing]] — Event logs, CDC, complex event processing
- [[Part 12 — The Future of Data Systems]] — Ethics, data as assets

### [[A Philosophy of Software Design]]
John Ousterhout's core principles for managing complexity:
- [[Complexity and Its Symptoms]] — change amplification, cognitive load, unknown unknowns
- [[Deep Modules]] — simple interface, powerful implementation
- [[Information Hiding and Leakage]] — encapsulate design decisions
- [[Pull Complexity Downwards]] — the golden rule of software design
- [[Error Handling]] — define errors out of existence
- [[Design Process]] — design it twice, top-down and bottom-up
- [[Comments as Design]] — write comments first, document the why
- [[Obvious Code]] — readability beats writability
- [[Software Trends Critique]] — TDD, short methods, AI code generation

---

*Add new topics as `content/knowledge/<topic>/index.md`*
