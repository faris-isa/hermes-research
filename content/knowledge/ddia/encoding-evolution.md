---
title: "DDIA — Encoding and Evolution"
description: "Chapter 4: Schema evolution, Protobuf, Avro, backward/forward compatibility."
tags:
  - ddia
  - encoding
  - schema
  - protobuf
  - avro
---

# Encoding and Evolution

Chapter 4 of [[Designing Data-Intensive Applications]].

## The Challenge

Data outlives code. Schema changes are inevitable. The key challenge: **how to evolve schemas without breaking existing systems.**

### Compatibility Types

| Type | Definition |
|------|-----------|
| **Backward compatibility** | New code reads old data |
| **Forward compatibility** | Old code reads new data |

## Encoding Formats

### Text Formats

| Format | Pros | Cons |
|--------|------|------|
| **JSON** | Human-readable, widespread | Verbose, vague types |
| **XML** | Schema validation (XSD) | Very verbose |
| **CSV** | Simple | No schema, ambiguous |

### Binary Formats

| Format | Schema | Compatibility | Used By |
|--------|--------|---------------|---------|
| **Protocol Buffers** | Tags in schema | Backward + Forward | gRPC, Google |
| **Apache Thrift** | Tags in schema | Backward + Forward | Facebook |
| **Avro** | Writer/reader schema | Backward + Forward | Hadoop, Kafka |

### Protobuf vs Avro

| Aspect | Protobuf | Avro |
|--------|----------|------|
| **Schema** | Explicit field tags | Implicit (position-based) |
| **Code generation** | Required | Optional |
| **Dynamic schemas** | Harder | Easier (writer/reader split) |
| **Kafka integration** | Schema Registry | Schema Registry |

## Schema Evolution

### Best Practices

1. **Use default values** for new fields
2. **Never remove required fields** (rename instead)
3. **Keep field numbers stable** in Protobuf
4. **Test compatibility** before deploying

### Evolution Patterns

```
Version 1: { name: string, age: int }
Version 2: { name: string, age: int, email: string = "" }  ← new field with default
Version 3: { name: string, age: int, email: string = "", phone: string = "" }  ← another default
```

## Dataflow Modes

| Mode | Description | Schema Evolution |
|------|-------------|------------------|
| **Database** | Data outlives code | Migrations, careful evolution |
| **RPC** | Remote calls | API versioning |
| **Messaging** | Async via brokers | Producer/consumer schema |

## Related
- [[Designing Data-Intensive Applications]]
- [[DDIA — Data Models]]
