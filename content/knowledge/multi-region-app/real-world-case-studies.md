---
title: "Real-World Case Studies"
description: "How Netflix, Uber, Stripe, Shopify, Discord, and Cloudflare actually implement multi-region architectures."
tags:
  - multi-region
  - case-study
  - architecture
  - real-world
---

# Real-World Case Studies

Theory is useful. What actually matters is what companies deployed at scale and what they learned.

---

## Netflix — Active-Active with Chaos Engineering

**Scale:** 200M+ subscribers, 15% of global internet bandwidth.

### Topology
- **Active-active** across 3 AWS regions: US-East-1 (Virginia), US-West-2 (Oregon), EU-West-1 (Ireland)
- Users geo-routed to closest region
- Target: **99.99% availability** (≤52 min downtime/year)

### Data Layer
- **Cassandra:** Multi-directional async replication. Validated by reading 1M records written in one region from another region **500ms later** under load.
- **EVCache (Memcached):** Handles **30M+ requests/sec**, stores **hundreds of billions of objects**. End-to-end P99 replication latency: **under 1 second** (highest-volume cache: ~400ms).
- Invalidation-based: Write in Region A → SQS message → invalidate cache in Region B → force fallback to Cassandra.

### Key Tools (All Open-Sourced)
- **Denominator:** Multi-DNS-provider client (UltraDNS for geo-steering + Route53 for fast switching)
- **Zuul:** Edge service for mis-routed requests, failover, and dynamic load shedding
- **Chaos Kong:** Simulates full regional outage — shifted majority traffic to US-West-2 for **>24 hours**
- **Mimir:** Workflow tool for multi-regional deployments with automated canary analysis

### Lessons
- Continuous failure is inevitable at scale — design for it
- Addressing slow/intermittent dependencies (Latency Monkey) is harder than handling total outages
- Cross-team collaboration and rapid provisioning were critical enablers

*Source: Netflix TechBlog (2013, 2016), QCon London 2014*

---

## Uber — Tiered Failover Architecture

**Scale:** Millions of rides/day, 350+ PB data lake.

### Topology
- **2 regions** (each with multiple AZs) for microservices
- Primary data center handles **90% of data generation** (active-passive for data lake)

### Innovation: Tiered Failover (UFA)

Uber replaced the costly uniform 2× capacity model with intelligent tiered approach.

| Class | Behavior | RTO | CPU Savings |
|-------|----------|-----|-------------|
| **Always-On** (T0, T1) | In-place scale-up into failover buffers | Seconds | — |
| **Active-Migrate** (T2) | Live-migrated to burst clusters | Seconds | — |
| **Restore-Later** (T3-T5) | Terminated; restored in batch/cloud capacity | Up to 1 hour | High |
| **Terminate** (Non-Production) | Terminated; not restored until failback | None | Highest |

**Results:**
- Reduced steady-state provisioning from **2× to 1.3×**
- Increased CPU utilization from **~20% to ~30%**
- Eliminated **over 1 million CPU cores** (from baseline of ~4 million)
- Maintained **99.97% availability**

### Multi-Region Kafka
- Processes **trillions of messages and multiple petabytes daily**
- **uReplicator** (open-source): Extends MirrorMaker with **zero-data-loss guarantees**
- Two modes: Active/Active (surge pricing) and Active/Passive (with offset sync)

### Real Failover (Jan 26, 2026)
- Burst capacity available in **~8 minutes**
- Core trip availability remained **>99.97%**

*Source: Uber Engineering Blog (2020, 2026), NSDI '26 paper*

---

## Stripe — Active-Active for Payments

**Scale:** Billions of API calls, processes payments for millions of businesses.

### Topology
- **Active-active** across multiple regions
- Every region actively processes payments

### Consistency Mechanisms
- **Paxos/Raft consensus** for critical state (account balances, ledgers)
- Critical writes require **quorum of regions** for linearizability
- **Globally unique, immutable idempotency keys** prevent duplicate charges on retries/failovers
- All transaction replicas validate idempotency key against **globally replicated log**

### Anti-Entropy
- Background jobs compare ledgers using **Merkle trees**
- Drift triggers reconciliation workflows
- Failed regions **re-synchronize from the global transaction log** on recovery

### Failure Flow
1. Request lands in both EU and US regions
2. EU fails; only US continues processing
3. Idempotency key prevents double-processing on retry
4. Consensus layer commits only if **quorum of healthy regions** confirms
5. On recovery, failed region re-synchronizes from global transaction log

### Design Principles
- Strong consensus for critical operations
- Idempotency for user-facing endpoints
- Relentless background reconciliation to eliminate drift

*Source: Stripe engineering, krishsoni.co analysis*

---

## Shopify — Sharded MySQL to Distributed SQL

**Scale:** 175+ countries, 1 billion unique online buyers, petabyte-scale data.

### Evolution
- Started as single-database single-datacenter Rails app
- Evolved to **tens of thousands of custom-sharded MySQL nodes**
- **1,500+ relational tables**

### Current Migration: YugabyteDB
- **160 nodes** with **7,000 CPU cores** supporting global commerce
- **1.4 PB raw storage** across US-EU stretched cluster
- **200,000 QPS** successfully migrated from legacy sharded MySQL
- Single global namespace with multi-regional quorum-based writes
- **Geo-partitioning** via tablespaces for continental/regional placement

### Key Benefits
- Eliminated application-level sharding
- PostgreSQL compatibility limited application changes
- Operational continental and regional tablespaces for latency + data sovereignty

*Source: YugabyteDB case study, USENIX SREcon16 Europe*

---

## Discord — Trillions of Messages

**Scale:** Trillions of messages, billions of API calls.

### Migration: Cassandra → ScyllaDB
- **Latency:** 200ms → **5ms** (96% reduction)
- **Disk utilization:** 53% reduction
- **Node count:** Halved vs Cassandra cluster
- Migration completed in **9 days** (initially estimated 3 months) after rewriting data migrator in **Rust** (3.2M records/second)

### Architecture
- **Data Service Library (Rust):** Sits between API and database via gRPC; performs **request coalescing** (consolidates multiple requests for same message into single DB query)
- **"Superdisk" hardware:** Combined 1.5TB persistent disk + 1.5TB NVMe SSD in RAID1
  - Writes go to persistent disks; reads served from fast NVMe SSDs
- **Consistent routing:** All requests for a given Channel ID go to the same instance

### Lessons
- Language choice matters: Rust enabled high-performance request coalescing
- Hardware-software co-design (Superdisk) creatively combined storage technologies
- Strategic migration order: Migrated other data first to learn before tackling critical messaging

*Source: The New Stack, ScyllaDB Tech Talks, InfoQ*

---

## Cloudflare — Edge-First Global Architecture

**Scale:** 300+ edge locations, serves ~20% of web traffic.

### Topology
- **Global by default** — code deploys to every edge location simultaneously
- **Anycast routing** for lower latency
- No multi-region configuration needed — it's the foundation

### Platform
- **Workers:** Compute at edge (JS, TS, Python, WASM)
- **Durable Objects:** Globally-unique, strongly-consistent stateful actors
- **KV:** Global key-value storage
- **D1:** Relational database at edge
- **R2:** Object storage (no egress fees)

### Cost Model
- Billed for **CPU time, not wait time**
- DDoS protection, TLS, network optimization **included automatically**
- **Egress costs eliminated** (unlike hyperscalers)
- **Sub-50ms TTFB** for users worldwide

### Constraints
- 128 MB memory per request (12 GB with Containers)
- 5 minutes CPU time limit
- Best for: global APIs, latency-sensitive auth, real-time coordination

*Source: Architecting on Cloudflare (book), Cloudflare documentation*

---

## Google Spanner — The Gold Standard

**Scale:** Global, 99.999% availability (≤5.3 min downtime/year).

### TrueTime
- Uses **atomic clocks + GPS clocks** for globally consistent timeline
- Uncertainty typically **under 10 milliseconds**
- Enables **Global External Consistency** — transactions serialized in the same global order

### Replication
- **Paxos-based:** Each split managed by a Paxos group across multiple zones
- Leader elected for writes; followers handle reads
- Automatic leader election on failure

### Read/Write Patterns
- **Strong reads:** Always return latest committed data via leader
- **Stale reads:** Up to 10 seconds old for lower latency
- Multi-split writes use **two-phase commit** with coordinator leader

*Source: Google Research paper, ByteByteGo, Google Cloud documentation*

---

## Cross-Cutting Patterns

| Pattern | Companies |
|---------|-----------|
| Active-Active | Netflix, Stripe, Uber (surge pricing) |
| Active-Passive | Uber (data lake), Shopify (legacy) |
| Edge-first | Cloudflare |
| Strong Consistency | Google Spanner, Stripe (critical writes) |
| Eventual Consistency | Netflix (EVCache), Spotify, Discord |
| Consensus (Paxos/Raft) | Google Spanner, Stripe, Shopify (YugabyteDB) |
| Geo-partitioning | Shopify, CockroachDB users |

## Universal Lessons

1. **Data is the hardest part** — compute is easy, replication/consistency is the real challenge
2. **Idempotency is non-negotiable** in multi-region systems
3. **Background reconciliation** must be relentless (Stripe's Merkle trees)
4. **Hardware-software co-design** unlocks dramatic improvements (Discord's Superdisk)
5. **Test failure constantly** — Netflix's Simian Army, Uber's 43 production drills
6. **Dependencies create cascading failures** — Uber found 4,155 fail-close violations
7. **Failure modes compound at scale** — Uber found catastrophic failovers average <20 hours/year

---

## Crosslinks

- [[Deployment Topologies]] — Topology patterns used by these companies
- [[Data Replication Strategies]] — Replication approaches detailed here
- [[Failure Modes and Recovery]] — How these companies handle failures
- [[Cost and Trade-offs]] — Uber's cost optimization approach
- [[Multi-Region Databases]] — Database-specific details for these systems

---

## Glossary

| Term | Definition |
|------|------------|
| **Active-Active** | All regions serve full traffic simultaneously (Netflix, Stripe). |
| **Chaos Kong** | Netflix tool that simulates full regional outage for 24+ hours. |
| **Idempotency Key** | Globally unique key that prevents duplicate operations on retries/failovers. |
| **Anti-Entropy** | Background process that compares and reconciles data across regions. |
| **Merkle Tree** | Hash tree used to efficiently compare large datasets for drift detection. |
| **Tiered Failover** | Uber's approach of classifying services by criticality for intelligent failover. |
| **uReplicator** | Uber's open-source Kafka replication tool with zero-data-loss guarantees. |
