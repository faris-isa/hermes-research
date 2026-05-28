---
title: "DDIA — Stream Processing"
description: "Chapter 11: Event logs, change data capture, complex event processing."
tags:
  - ddia
  - stream-processing
  - kafka
  - event-sourcing
---

# Stream Processing

Chapter 11 of [[Designing Data-Intensive Applications]].

## Batch vs Stream

| Aspect | Batch | Stream |
|--------|-------|--------|
| **Input** | Finite dataset | Unbounded stream |
| **Latency** | Minutes to hours | Milliseconds to seconds |
| **Output** | New dataset | Updated results |

## Event Streams

### Event Log

Append-only sequence of events.

```
Event 1: user123 clicked "buy"
Event 2: user456 viewed product
Event 3: user123 completed purchase
```

### Kafka Architecture

```
Producer → Topic (partitioned) → Consumer Group
```

- Topics split into partitions
- Partitions provide ordering guarantee
- Consumer groups distribute load

## Change Data Capture (CDC)

Capture changes from database and stream them.

### Methods

| Method | Description | Pros/Cons |
|--------|-------------|-----------|
| **Trigger-based** | Database triggers on change | Slow, invasive |
| **Log-based** | Read database WAL/binlog | Fast, non-invasive |
| **Polling** | Periodic SELECT queries | Simple but slow |

### CDC Pipeline

```
PostgreSQL → Debezium → Kafka → Elasticsearch (search index)
                          ↓
                      Cassandra (analytics)
```

## Stream Processing Patterns

### Windowing

| Window Type | Description |
|-------------|-------------|
| **Tumbling** | Fixed, non-overlapping |
| **Sliding** | Overlapping |
| **Session** | Activity-based (gap = session end) |

### Joins

- **Stream-Stream:** Join two streams by time window
- **Stream-Table:** Join stream with lookup table
- **Table-Table:** Join two materialized views

### Exactly-Once Semantics

Ensure each event processed exactly once (no duplicates, no misses).

**Techniques:**
- Transactional writes (atomic commit)
- Idempotent operations (safe to retry)
- Deduplication (event IDs)

## Related
- [[Designing Data-Intensive Applications]]
- [[DDIA — Batch Processing]]
- [[Ajinomoto MES]]
- [[System Architecture]]
