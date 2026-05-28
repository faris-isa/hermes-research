---
title: "DDIA — Distributed Troubles"
description: "Chapter 8: Clocks, timeouts, failure detection in distributed systems."
tags:
  - ddia
  - distributed
  - clocks
  - failure-detection
---

# The Trouble with Distributed Systems

Chapter 8 of [[Designing Data-Intensive Applications]].

> *"Everything fails, all the time."* — Werner Vogels

## Types of Unreliability

| Problem | Description |
|---------|-------------|
| **Network unreliability** | Packets lost, delayed, reordered |
| **Clock drift** | Clocks diverge over time |
| **Process pauses** | GC, page faults, scheduling delays |

## Clocks

### Time-of-Day Clock

- System clock (e.g., `System.currentTimeMillis()`)
- Synced via NTP (Network Time Protocol)
- **Problem:** Can jump forward/backward
- **Use for:** Timestamps, human-readable time

### Monotonic Clock

- Always moves forward (e.g., `System.nanoTime()`)
- Good for measuring durations
- **Cannot** be synced across machines
- **Use for:** Timeouts, measuring elapsed time

### Clock Synchronization Issues

| Issue | Description |
|-------|-------------|
| **NTP drift** | Clocks diverge between syncs |
| **Clock jump** | NTP adjusts time forward/backward |
| **Quartz drift** | Hardware clock drift (~6 sec/day) |

> **Key insight:** You cannot assume `time(A) < time(B)` just because A happened before B in real time.

## Process Pauses

### GC (Garbage Collection)

- Stop-the-world GC can pause for seconds
- Application doesn't know it's paused
- Other nodes may declare it dead

**Mitigation:**
- Low-latency GC (ZGC, Shenandoah)
- Removing time-sensitive logic from application

### Response Time Guarantees

| Approach | Description |
|----------|-------------|
| **Real-time systems** | Guaranteed response times (rare in practice) |
| **Timeouts** | Detect suspected failures |
| **Retry with backoff** | Handle transient failures |

## Failure Detection

### Heartbeats

Nodes periodically send "I'm alive" messages.

**Timeout-based:**
- If no heartbeat for N seconds → declare dead
- **Problem:** Too short = false positives, too long = slow detection

### Accrual Failure Detection

Instead of binary alive/dead, output **suspicion level** (probability of failure).

**Examples:** Phi Accrual Failure Detector (used in Cassandra)

## Related
- [[Designing Data-Intensive Applications]]
- [[DDIA — Consistency and Consensus]]
