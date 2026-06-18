---
title: "Knowledge Base"
description: "Domain knowledge and technical references."
tags:
  - knowledge
---

# 📚 Knowledge Base

Domain knowledge and technical references. These are **standalone concepts** — not tied to any specific project.

## Topics

### [[OEE Knowledge Index|1. OEE — Overall Equipment Effectiveness]]
Complete reference for Overall Equipment Effectiveness:
- [[2. OEE Calculation Methods]] — Formulas, hierarchy, aggregation
- [[3. Manufacturing Types and OEE]] — How batch, discrete, continuous differ
- [[4. Batch Phase Tracking]] — Batch-specific calculations and pitfalls
- [[5. Mistakes and Hidden Factory]] — Common errors and untapped capacity
- [[5. OEE Improvement]] — TPM, SMED, error-proofing
- [[6. Extended Metrics — TEEP, OAE, OLE]] — When OEE isn't enough

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

### [[Multi-Region Applications]]
Patterns, strategies, and trade-offs for deploying applications across multiple geographic regions:
- [[Deployment Topologies]] — Active-active, active-passive, active-warm patterns
- [[Data Replication Strategies]] — Sync, async, semi-sync replication and conflict resolution
- [[Traffic Routing and Latency]] — GeoDNS, anycast, global load balancers, edge compute
- [[Multi-Region Databases]] — CockroachDB, Spanner, YugabyteDB, DynamoDB Global Tables
- [[Multi-Region Kubernetes]] — Federation, Istio service mesh, GitOps, blue-green deployments
- [[Failure Modes and Recovery]] — Regional outages, split-brain, cascading failures
- [[Testing, Chaos Engineering and Observability]] — Failover testing, LitmusChaos, distributed tracing, SLOs
- [[Real-World Case Studies]] — Netflix, Uber, Stripe, Shopify, Discord, Cloudflare, Spanner
- [[Cost and Trade-offs]] — When multi-region is worth it and cost optimization

### [[Cloud Architecture Patterns]]
Proven patterns for designing resilient, scalable, and cost-effective cloud applications:
- [[Decomposition Patterns]] — Strangler Fig, Database per Service, API Composition, CQRS, Event Sourcing
- [[Communication Patterns]] — Saga, Circuit Breaker, Retry, Bulkhead, Timeout
- [[Data Patterns]] — Event-Driven Architecture, CDC, Outbox Pattern, CQRS + Event Sourcing
- [[Deployment Patterns]] — Sidecar, Ambassador, Blue-Green, Canary, Feature Flags
- [[Serverless Patterns]] — Fan-Out/Fan-In, API Gateway, Strangler Fig with Serverless
- [[Security Patterns]] — Zero Trust Architecture, Identity-Aware Proxy
- [[Anti-Patterns]] — Distributed Monolith, Shared Database, Synchronous Chains

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
