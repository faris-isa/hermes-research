---
title: "Modules"
description: "Microservice modules in the Ajinomoto MES system."
tags:
  - ajinomoto
  - modules
---

# Modules

Microservice modules in the [[Ajinomoto MES]] system. Each app is an independently deployable Hono service.

## Modules

| Module | Purpose | Status |
|--------|---------|--------|
| [[OEE Monitoring]] | OEE tracking, reporting, yearly targets | Active |
| [[Shopfloor]] | Real-time shopfloor operations | Active |
| [[Master Data]] | Product, machine, line configuration | Active |
| [[Guideline]] | Standard operating procedures | Active |
| [[Schedule Maintenance]] | Preventive/corrective maintenance | Active |
| [[Job Schedule]] | Automated job scheduling | Active |

## Supporting Services

| Service | Purpose |
|---------|---------|
| **Scheduler** | Cron-like task scheduling |
| **Worker** | Background job processing |
| **Seeder** | Database initialization and seeding |

## Common Patterns

All modules follow:
- `src/app.ts` — Hono app creation via `createPublicApp()`
- `src/main.ts` — Entry point
- `src/api/index.ts` — Route definitions
- `src/core/feature-reader.ts` — Feature flag loading from YAML

## Related
- [[Architecture]]
- [[Packages Overview]]
