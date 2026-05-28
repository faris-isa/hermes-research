---
title: "DDIA — Batch Processing"
description: "Chapter 10: MapReduce, Spark, dataflow engines."
tags:
  - ddia
  - batch-processing
  - mapreduce
  - spark
---

# Batch Processing

Chapter 10 of [[Designing Data-Intensive Applications]].

## What Is Batch Processing?

Process large datasets in bulk. Input is finite, output is new data.

**Use cases:**
- Daily/weekly reports
- ETL (Extract, Transform, Load)
- Machine learning training
- Search index building

## Unix Philosophy

```
cat access.log | sort | uniq -c | sort -rn | head -20
```

- Each tool does one thing well
- Pipes connect tools
- Works on streams of data

## MapReduce

### The Model

```
map(key, value) → list of (key, value)
reduce(key, list of values) → single value
```

### Example: Word Count

```python
def map(key, value):
    for word in value.split():
        emit(word, 1)

def reduce(key, values):
    emit(key, sum(values))
```

### Execution

1. Split input into chunks
2. Run map on each chunk (parallel)
3. Shuffle (group by key)
4. Run reduce on each group (parallel)

### Problems

| Problem | Description |
|---------|-------------|
| **Write amplification** | Intermediate data written to disk |
| **Map-side joins** | Require sorted input |
| **Small files** | Many small outputs = overhead |
| **Debugging** | Hard to debug distributed logic |

## Dataflow Engines

### Spark

- In-memory processing (10-100x faster than MapReduce)
- Lazy evaluation
- Rich API (SQL, DataFrame, MLlib)

### Flink

- True stream processing (can also batch)
- Event time processing
- Exactly-once semantics

### Comparison

| Aspect | MapReduce | Spark | Flink |
|--------|-----------|-------|-------|
| **Speed** | Slow | Fast | Fast |
| **Fault tolerance** | Disk-based | RDD lineage | Checkpointing |
| **State management** | Limited | Limited | Rich |
| **Streaming** | No | Micro-batch | True streaming |

## Related
- [[Designing Data-Intensive Applications]]
- [[DDIA — Stream Processing]]
