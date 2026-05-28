---
title: "Shopfloor"
description: "Real-time shopfloor operations and monitoring."
tags:
  - ajinomoto
  - modules
  - shopfloor
---

# Shopfloor

Real-time shopfloor operations and monitoring module.

## Purpose

- Live machine status monitoring
- Operator input collection (production counts, downtime reasons)
- Real-time event streaming
- Shift-based production tracking

## Architecture

Standard Hono app following the module pattern (`app.ts` → `main.ts` → `api/`).

## Data Sources

- **InfluxDB:** Real-time machine signals, sensor data
- **Redis:** Live status cache, current shift state
- **PostgreSQL:** Shift configs, operator assignments

## Related
- [[OEE Monitoring]]
- [[Master Data]]
