---
title: "System Architecture"
description: "How the Ajinomoto MES modules connect and flow data between services."
tags:
  - ajinomoto
  - architecture
  - system-design
---

# System Architecture

How the [[Ajinomoto MES]] modules connect and exchange data.

## Services Overview

```
┌─────────────────────────────────────────────────────────┐
│                    Kafka Cluster                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐  │
│  │ Machine Data │  │  Shift Data  │  │  Recovery    │  │
│  │   Topic      │  │   Topic      │  │  Topic       │  │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘  │
└─────────┼─────────────────┼─────────────────┼───────────┘
          │                 │                 │
          ▼                 ▼                 │
┌─────────────────────────────────────┐      │
│     Downtime Detector (Go)          │      │
│  • Consumes sensor messages         │      │
│  • Detects stops via timers         │      │
│  • Categorizes: SMALL_STOP /        │      │
│    UNPLANNED / PLANNED              │      │
│  • Splits at shift boundaries       │      │
│  • Splits at maintenance windows    │      │
└──────────┬──────────────────────────┘      │
           │                                 │
           ▼                                 ▼
┌──────────────────────┐    ┌──────────────────────────┐
│    Cassandra          │    │     PostgreSQL            │
│  • Downtime records   │    │  • Schedule maintenance   │
│  • Small stop records │    │  • Job schedules          │
│  • Time-series data   │    │  • Master data            │
└──────────┬───────────┘    │  • Machine configs        │
           │                └──────────────────────────┘
           ▼
┌──────────────────────────────────────┐
│        OEE Monitoring (TypeScript)    │
│  • Queries Cassandra for downtime    │
│  • Calculates A × P × Q             │
│  • Aggregates: Machine → Line → Plant│
│  • Generates reports                 │
│  • Manages yearly targets            │
└──────────────────────────────────────┘
```

## Data Flow

### 1. Machine Status → Downtime Detection

**Source:** Sensors on production machines
**Transport:** Kafka
**Consumer:** Downtime Detector (Go service)

Each sensor message contains:
- `hwCode` — machine identifier
- `actionType` — D (producing) or E (error/stop)
- `value` — counter value
- `quality` — quality indicator
- `timestamp` — event time
- `sku` — current product

### 2. Downtime Detection → Categorization

The downtime detector uses **three detection methods**:

| Method | Trigger | Threshold |
|--------|---------|-----------|
| Timer-based | No messages arrive | 3 min → SMALL_STOP, 5 min → DOWNTIME |
| Watchdog fallback | Inactivity poll (1s) | Recovers if timer callbacks miss |
| Same-value | Counter doesn't change | Same thresholds as timer |

**Category assignment:**

| Category | Condition |
|----------|-----------|
| `SMALL_STOP` | Stop < 5 minutes |
| `PLANNED` | Scheduled maintenance window active (RECURRENT or ONE_TIME) |
| `UNPLANNED` | Full downtime, no scheduled maintenance |

### 3. Scheduled Maintenance → Downtime Overwrite

**Source:** PostgreSQL `schedule_maintenances` table
**Types:**
- `RECURRENT` — repeating windows (rest times, recurring maintenance)
- `ONE_TIME` — specific maintenance events

**Behavior:**
- When a scheduled maintenance window starts, any active downtime is split
- The portion within the window is categorized as **PLANNED**
- When the window ends, new downtime is categorized as **UNPLANNED** (or based on job schedule)

### 4. Shift Boundaries → Record Splitting

**Default shifts (GMT+7):**

| Shift | Start | End |
|-------|-------|-----|
| Shift 1 | 07:00 | 14:59 |
| Shift 2 | 15:00 | 22:59 |
| Shift 3 | 23:00 | 06:59 |

At shift end, all active downtime records are split so each shift has its own record.

### 5. Operator Input → Reason Tagging

Operators can tag downtime records with reasons:
- Select from predefined dropdown (for reporting aggregation)
- Optional free text (for context)
- Updates Cassandra record directly

### 6. OEE Calculation → Reporting

**Source:** Cassandra downtime records + InfluxDB counters
**Consumer:** OEE Monitoring (TypeScript)

```
Availability = runTime / plannedProductionTime
Performance  = (idealCycleTime × totalCount) / runTime
Quality      = goodCount / totalCount
```

Aggregation hierarchy: Machine → Line → Area → Plant

## Three Independent Systems

| System | Responsibility | Does NOT affect |
|--------|---------------|-----------------|
| **Job Schedule** | Planning — marks machine as "should run" | OEE calculation, downtime categorization |
| **Schedule Maintenance** | Marks time windows as PLANNED | Job schedule, OEE Performance |
| **Downtime Detector** | Detects stops from sensor data | Job schedule, maintenance schedule |

The only interaction: Schedule Maintenance → Downtime Detector (overwrites category to PLANNED).

## Repos

| Repo | Language | Purpose |
|------|----------|---------|
| [ajinomoto-mes-api](https://github.com/molca-id/ajinomoto-mes-api) | TypeScript | MES backend (OEE, shopfloor, master data) |
| [ajinomoto-mes-repo-ui](https://github.com/molca-id/ajinomoto-mes-repo-ui) | TypeScript | MES frontend |
| [ajinomoto-downtime-detector-go](https://github.com/molca-id/ajinomoto-downtime-detector-go) | Go | Real-time downtime detection from Kafka |

## Related
- [[OEE Monitoring]]
- [[Schedule Maintenance]]
- [[OEE Knowledge Index]]
