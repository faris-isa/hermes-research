---
title: "Packages Overview"
description: "Shared library documentation for ajinomoto-mes-api packages."
tags:
  - ajinomoto
  - architecture
  - packages
---

# Packages Overview

Shared libraries under `packages/` in the [[Ajinomoto MES]] monorepo.

## Data & Storage

| Package | Purpose | Used By |
|---------|---------|---------|
| **drizzle** | ORM config, connection management | All apps |
| **schema** | Database schema definitions + migrations | All apps |
| **influx** | InfluxDB client for time-series writes | oee-monitoring, shopfloor |
| **cassandra** | Cassandra client for historical reads | oee-monitoring |
| **redis** | Redis client wrapper | All apps |

## Business Logic

| Package | Purpose |
|---------|---------|
| **oee** | [[OEE Knowledge Index\|OEE]] calculation engine — A×P×Q, hierarchy aggregation, unit conversion |
| **queue** | Job queue abstraction (add, process, retry) |

## Framework

| Package | Purpose |
|---------|---------|
| **hono** | HTTP middleware, error handling, feature flags |
| **config** | Feature configuration management (YAML/JSON) |
| **constant** | Enums, shared constants |
| **util** | General utility functions |

## OEE Package Deep Dive

The `packages/oee` package contains the core [[OEE Knowledge Index|OEE calculation]] logic:

```
packages/oee/src/
├── lib/
│   ├── oee/
│   │   ├── oee.ts              # Main exports
│   │   ├── custom-oee.ts       # Custom OEE variants
│   │   ├── core/
│   │   │   ├── oee-factory.ts  # OEE block factory
│   │   │   ├── hierarchy/      # Machine → Line → Plant aggregation
│   │   │   │   ├── machine.ts
│   │   │   │   ├── line.ts
│   │   │   │   └── product.ts
│   │   │   ├── drizzle-query.ts# DB queries via Drizzle
│   │   │   ├── influx-query.ts # Time-series queries
│   │   │   ├── cassandra-query.ts # Historical queries
│   │   │   └── unit-converter.ts  # Unit normalization
│   │   └── types/
│   │       ├── oee.ts          # OEE type definitions
│   │       └── config.ts       # Configuration types
│   └── kaili/                  # Kaili integration
│       ├── kaili.ts
│       └── mapper.ts
```

## Related
- [[Monorepo Structure]]
- [[Tech Stack Details]]
