---
title: "DDIA — Reliable, Scalable, Maintainable"
description: "Chapter 1: The three pillars of data system design."
tags:
  - ddia
  - reliability
  - scalability
---

# Reliable, Scalable, Maintainable Applications

Chapter 1 of [[Designing Data-Intensive Applications]].

## Reliability

**Definition:** System works correctly despite faults (hardware, software, human error).

### Fault vs Failure

> **Fault** = one component deviating from specs
> **Failure** = the system as a whole stops working

**Strategy:** Prefer fault tolerance over prevention.

### Types of Faults

| Type | Example | Mitigation |
|------|---------|------------|
| **Hardware** | Disk failure, network outage | Redundancy, replication |
| **Software** | Bugs, memory leaks | Testing, monitoring, rollback |
| **Human** | Misconfiguration, bad deploy | Admin interfaces, sandboxes, automation |

> **Key insight:** Software errors cause more failures than hardware in modern systems.

### Human Error Mitigation

- Admin interfaces (not direct DB access)
- Sandboxes for testing changes
- Automation of routine tasks
- Easy rollback mechanisms
- Monitoring and alerting
- Training and documentation

## Scalability

**Definition:** Good performance under increased load.

### Load Metrics

| Metric | Description |
|--------|-------------|
| Requests/sec | Throughput |
| Read/write ratio | Read-heavy vs write-heavy |
| Data size | Total storage |
| Hotspots | Uneven access patterns |

### Performance Metrics

| Percentile | Meaning |
|-----------|---------|
| **p50 (median)** | Typical user experience |
| **p95** | Slow users |
| **p99** | Very slow users |
| **p999** | Outlier latency |

> *"The customers with the slowest requests are often those who have the most data."*

**Amazon's target:** 99.9th percentile for internal services.

### Scaling Approaches

| Approach | Description | When to Use |
|----------|-------------|-------------|
| **Vertical scaling** | Upgrade hardware | Simple, single-server workloads |
| **Horizontal scaling** | Distribute across machines | High throughput, need redundancy |
| **Elastic systems** | Auto-adjust resources | Variable load patterns |

## Maintainability

**Definition:** Making life easier for engineering/ops teams.

### Three Principles

1. **Operability** — Make routine tasks easy
2. **Simplicity** — Remove accidental complexity via abstraction
3. **Evolvability** — Facilitate future changes

> Every legacy system is unpleasant — the goal is to minimize how unpleasant yours becomes.

## Related
- [[Designing Data-Intensive Applications]]
- [[DDIA — Data Models]]
