---
title: "DDIA — Data Models"
description: "Chapter 2: Relational, document, and graph data models."
tags:
  - ddia
  - data-models
  - sql
  - nosql
---

# Data Models and Query Languages

Chapter 2 of [[Designing Data-Intensive Applications]].

## Three Data Models

### Relational Model

Tables with rows and columns. Strong support for joins and many-to-many relationships.

**Pros:**
- Better joins
- Better many-to-one and many-to-many relationships
- Schema on write (data integrity enforced)
- Mature query optimization

**Cons:**
- Rigid schema
- Object-relational impedance mismatch

### Document Model

JSON/BSON documents. Good for document-like structures.

**Pros:**
- Schema flexibility (schema on read)
- Better performance due to data locality
- Natural mapping to application objects

**Cons:**
- Weak at joins
- Updates require rewrite of whole document
- Read always fetches whole document

**Examples:** MongoDB, Couchbase, Elasticsearch

### Graph Model

Vertices and edges with properties. Ideal for many-to-many relationships and path traversals.

**Use cases:**
- Social networks
- Recommendation engines
- Knowledge graphs
- Dependency tracking

**Examples:** Neo4j (property graphs), Amazon Neptune, triple-stores (SPARQL)

## Comparison

| Aspect | Relational | Document | Graph |
|--------|-----------|----------|-------|
| **Best for** | Complex queries, joins | Hierarchical data | Many-to-many relationships |
| **Schema** | Rigid (on write) | Flexible (on read) | Flexible |
| **Joins** | Excellent | Poor (manual) | Native traversal |
| **Scalability** | Vertical (traditionally) | Horizontal | Varies |
| **Consistency** | Strong | Eventual | Varies |

## Convergence

The boundaries are blurring:
- **PostgreSQL** supports JSON columns
- **MongoDB** added joins (lookup aggregation)
- **MySQL** supports JSON

> **Key insight:** Choose the model that fits your access pattern, not the one that's "trendy."

## Query Languages

| Language | Type | Used By |
|----------|------|---------|
| **SQL** | Declarative | Relational databases |
| **MongoDB Aggregation Pipeline** | Declarative (JSON) | MongoDB |
| **Cypher** | Declarative | Neo4j |
| **SPARQL** | Declarative | Triple-stores |
| **MapReduce** | Imperative (function-based) | Hadoop, early MongoDB |

## Related
- [[Designing Data-Intensive Applications]]
- [[DDIA — Storage and Retrieval]]
