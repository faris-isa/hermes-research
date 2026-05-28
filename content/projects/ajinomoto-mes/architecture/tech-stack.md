---
title: "Tech Stack Details"
description: "Technology choices and rationale for Ajinomoto MES."
tags:
  - ajinomoto
  - architecture
  - tech-stack
---

# Tech Stack Details

## Core

| Technology | Role | Rationale |
|-----------|------|-----------|
| **TypeScript** | Language | Type safety across full stack |
| **Node.js** | Runtime | Non-blocking I/O for real-time data |
| **Hono** | HTTP Framework | Lightweight, fast, edge-ready |
| **Turborepo** | Monorepo | Efficient builds, shared configs |

## Data Layer

| Technology | Role | Rationale |
|-----------|------|-----------|
| **Drizzle** | ORM | Type-safe SQL, migration management |
| **PostgreSQL** | Primary DB | Relational data (master data, configs) |
| **InfluxDB** | Time Series | High-write throughput for OEE counters |
| **Cassandra** | Time Series | Historical data, high-volume reads |
| **Redis** | Cache + Queue | Real-time data, job queuing |

## Why Two Time-Series Databases?

- **InfluxDB:** Real-time OEE counters, live shopfloor data (fast writes)
- **Cassandra:** Historical aggregation, long-term storage (fast reads at scale)

## Related
- [[Monorepo Structure]]
- [[Packages Overview]]
