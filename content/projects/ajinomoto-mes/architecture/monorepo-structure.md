---
title: "Monorepo Structure"
description: "Turborepo workspace layout for ajinomoto-mes-api."
tags:
  - ajinomoto
  - architecture
  - turborepo
---

# Monorepo Structure

The [[Ajinomoto MES]] API uses **Turborepo** for monorepo management.

## Workspace Layout

```
ajinomoto-mes-api/
├── apps/                    # Deployable microservices
│   ├── oee-monitoring/      → OEE tracking service
│   ├── shopfloor/           → Shopfloor operations
│   ├── master-data/         → Reference data management
│   ├── guideline/           → SOP management
│   ├── schedule-maintenance/# Maintenance scheduling
│   ├── job-schedule/        → Job automation
│   ├── scheduler/           → Cron-like scheduler
│   ├── worker/              → Background job processor
│   └── seeder/              → DB initialization
├── packages/                # Shared libraries (not independently deployable)
│   ├── oee/                 → OEE calculation engine
│   ├── drizzle/             → ORM configuration
│   ├── schema/              → Database schema + migrations
│   ├── influx/              → InfluxDB time-series client
│   ├── cassandra/           → Cassandra time-series client
│   ├── queue/               → Job queue abstraction
│   ├── redis/               → Redis client wrapper
│   ├── hono/                → HTTP middleware & utilities
│   ├── config/              → Feature flag & config management
│   ├── constant/            → Enums, constants
│   └── util/                → Shared utilities
└── tools/                   # Dev tooling (generators, etc.)
```

## Conventions

- **Apps** follow `src/app.ts` (Hono app) + `src/main.ts` (entry) pattern
- **Packages** export from `src/index.ts`
- **E2E tests** live alongside apps as `<app-name>-e2e/`
- **Feature configs** use YAML files (`feature.yaml`) per app

## Dependency Flow

```
apps → packages (shared)
apps → other apps (rare, avoid)
packages → packages (OK, keep shallow)
```

## Related
- [[Tech Stack Details]]
- [[Packages Overview]]
