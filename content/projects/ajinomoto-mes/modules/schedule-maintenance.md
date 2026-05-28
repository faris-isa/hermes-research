---
title: "Schedule Maintenance"
description: "Preventive and corrective maintenance scheduling — RECURRENT and ONE_TIME types that overwrite downtime to PLANNED."
tags:
  - ajinomoto
  - modules
  - maintenance
---

# Schedule Maintenance

Preventive and corrective maintenance scheduling module. This module directly affects OEE categorization — any downtime within a scheduled maintenance window is marked as **PLANNED**.

## Purpose

- Define maintenance windows (when machines should be maintained)
- Two types: **RECURRENT** and **ONE_TIME**
- Overwrites downtime category to PLANNED during maintenance windows

## Types

| Type | Use Case | Example |
|------|----------|---------|
| **RECURRENT** | Repeating time windows | Rest times (lunch breaks), recurring maintenance |
| **ONE_TIME** | Specific one-off events | Major overhaul, specific repair |

## How It Affects OEE

When a scheduled maintenance window is active:
1. Downtime detector queries PostgreSQL for active maintenance
2. Any downtime during the window is categorized as **PLANNED**
3. This reduces Availability losses in OEE calculation

**Important:** Rest times (lunch breaks) are configured as RECURRENT scheduled maintenance. They count as PLANNED downtime, which affects the Availability metric.

## Integration with Downtime Detector

The downtime detector (`ajinomoto-downtime-detector-go`) pulls schedule maintenance data from PostgreSQL:

```
schedule_maintenances (table)
  ├── schedule_maintenance_machines (which machines)
  ├── schedule_maintenance_exceptions (cancel dates)
  └── schedule_maintenance_repeat_days (days of week for RECURRENT)
```

At maintenance **start**:
- Closes current downtime at `maintenanceStart - 1ms`
- Creates new PLANNED downtime at `maintenanceStart`

At maintenance **end**:
- Closes PLANNED downtime at `maintenanceEnd`
- Creates new downtime at `maintenanceEnd + 1ms` (category based on job schedule)

## Timezone Handling

Each schedule has its own timezone (e.g., `Asia/Jakarta`). The downtime detector converts to UTC for comparison.

## Feature Configuration

Uses the same `feature-reader.ts` pattern as [[OEE Monitoring]] for YAML-based feature flags.

## Related
- [[System Architecture]]
- [[OEE Monitoring]]
- [[Master Data]]
