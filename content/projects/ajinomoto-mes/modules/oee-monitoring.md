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

## OEE Calculation Implementation

The OEE calculation follows a **waterfall approach** — each step subtracts losses from the previous level.

### Time Waterfall

```
Calendar Time (shift duration, e.g., 8 hours)
  − Schedule Loss (Planned Downtime: maintenance, rest times)
  = Loading Time
    − Availability Loss (Unplanned Downtime)
    = Operating Time
      − Performance Loss (Small Stops + Reduce Speed)
      = Net Operating Time
        − Quality Loss (Reject + Rework)
        = Value Added Time
          − Anomaly, Up Speed
          = Finish Good (effective production)
```

### Formulas

| Metric | Formula |
|--------|---------|
| **Availability** | `Operating Time / Loading Time` |
| **Performance** | `Net Operating Time / Operating Time` |
| **Quality** | `Value Added Time / Net Operating Time` |
| **OEE** | `Availability × Performance × Quality` |
| **Utilization** | `Loading Time / Calendar Time` |
| **TEEP** | `OEE × Utilization` |

### Reliability Metrics

| Metric | Formula | Meaning |
|--------|---------|---------|
| **MTBF** | `(Loading Time − Unplanned Downtime) / Unplanned Downtime Frequency` | Mean Time Between Failures |
| **MTTR** | `Unplanned Downtime / Unplanned Downtime Frequency` | Mean Time To Repair |
| **MTTF** | `|MTBF − MTTR|` | Mean Time To Failure |

### How Each Metric Is Calculated

**Planned Downtime:** Sum of all `PLANNED` category downtime records from Cassandra (maintenance windows, rest times).

**Unplanned Downtime:** Sum of all `UNPLANNED` category downtime records. Count = failure frequency.

**Small Stop Downtime:** Sum of all `SMALL_STOP` category records.

**Reduce Speed:** Difference between ideal cycle time and actual cycle time (from InfluxDB counters).

**Quality Loss:** Reject count + rework count, converted to time using ideal cycle time.

## Hierarchy

```
Product (SKU level)
  → Machine (hwCode level)
    → Line (group of machines)
      → Area
        → Plant
```

Each level calculates OEE independently, then aggregates upward.

### Machine Level

The `Machine` class in `packages/oee/src/lib/oee/core/hierarchy/machine.ts`:
- Queries Cassandra for downtime records
- Queries InfluxDB for production counters
- Calculates A × P × Q per machine
- Generates waterfall data for visualization

### Line Level

The `Line` class aggregates machine OEEs:
- Sums downtime across all machines on the line
- Uses **constraint-based aggregation** (bottleneck determines line throughput)
- Merges SKU intervals across machines

### Product Level

The `Product` class calculates OEE per SKU:
- Tracks production per product variant
- Handles SKU-specific ideal cycle times

## Machine Configuration (OeeCodeMapper)

The `OeeCodeMapper` in `packages/oee/src/lib/kaili/mapper.ts` maps machines to their OEE configuration:

| Config Field | Purpose |
|-------------|---------|
| `productionMachine` | Main machine producing output |
| `finishGoodMachine` | Final counter for good output |
| `rejectorMachine` | Machines counting rejects |
| `actionType` | A (finish good), B (weight), C (reject), D (production), E (error), R (rework) |

Each machine has:
- `code` — hardware identifier (hwCode)
- `productionUnit` — unit of measurement
- `supposedCode` — expected code for validation
- `weightActionType` — W (weight), G (gross), F (fine)

## Data Sources

| Source | Data |
|--------|------|
| **Cassandra** | Downtime records (PLANNED, UNPLANNED, SMALL_STOP), timeline events |
| **InfluxDB** | Production counters (D messages), real-time sensor data |
| **PostgreSQL** | Schedule maintenance, job schedules, master data, yearly targets |

## Report Structure

Each report includes:
- OEE statistics (A, P, Q, OEE, TEEP, utilization)
- Loss breakdown (schedule, availability, performance, quality)
- Waterfall data (visual timeline of losses)
- Timeline events (PLANNED, UNPLANNED, SMALL_STOP, RUNTIME)
- Per-machine OEE breakdown
- MTBF, MTTR, MTTF

## Feature Configuration

Uses YAML-based feature flags loaded via `feature-reader.ts`:
- Supports `.yaml` and `.json` config files
- Looks for `feature.yaml` in app root or `apps/oee-monitoring/`
- Validates config against schema before use

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

## Related
- [[OEE Knowledge Index]]
- [[System Architecture]]
- [[Shopfloor]]
- [[Master Data]]
