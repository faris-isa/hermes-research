---
title: "OEE Monitoring"
description: "OEE tracking, reporting, and target management module."
tags:
  - ajinomoto
  - modules
  - oee
---

# OEE Monitoring

The core module for [[OEE Knowledge Index|OEE]] tracking and reporting.

## Purpose

- Real-time OEE calculation per machine, line, and plant
- Yearly OEE target management
- Report generation (daily, weekly, monthly)
- Hierarchy aggregation (Machine → Line → Area → Plant)

## Architecture

```
apps/oee-monitoring/src/
├── app.ts                 # Hono app setup
├── main.ts                # Entry point
├── api/index.ts           # Route definitions
├── core/
│   └── feature-reader.ts  # YAML feature config loader
└── type/
    ├── report-type.ts     # Report type definitions
    └── yearly-target.ts   # Target management types
```

## Key Concepts

### Feature Configuration
Uses YAML-based feature flags loaded via `feature-reader.ts`:
- Supports `.yaml` and `.json` config files
- Looks for `feature.yaml` in app root or `apps/oee-monitoring/`
- Validates config against schema before use

### OEE Calculation
Leverages `packages/oee` for core [[OEE Knowledge Index|OEE calculation]]:
- Reads from InfluxDB (real-time counters)
- Reads from Cassandra (historical aggregation)
- Writes calculated OEE to PostgreSQL via Drizzle

### Reporting
- **Report types:** `report-type.ts` defines daily/weekly/monthly/shift reports
- **Yearly targets:** `yearly-target.ts` manages annual OEE goals

## Data Flow

```
Shopfloor Sensors → InfluxDB (counters)
                      ↓
              oee-monitoring reads counters
                      ↓
              packages/oee calculates A×P×Q
                      ↓
              PostgreSQL (results + reports)
                      ↓
              UI Dashboard
```

## Related
- [[OEE Knowledge Index]]
- [[Shopfloor]]
- [[Master Data]]
