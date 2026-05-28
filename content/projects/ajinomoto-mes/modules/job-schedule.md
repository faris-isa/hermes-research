---
title: "Job Schedule"
description: "Daily production planning — marks machines as 'should run' without affecting OEE calculation."
tags:
  - ajinomoto
  - modules
  - scheduling
---

# Job Schedule

Daily production planning module. This is a **planning tool only** — it does not affect OEE calculation or downtime categorization.

## Purpose

- Plan what products to produce on each machine for the day
- Mark machines as "should run" during specific time windows
- Provide production targets for reference

## How It Works

- Tells operators: "Machine X should produce Product A from 8am-12pm"
- Does **NOT** affect OEE Availability calculation
- Does **NOT** affect downtime categorization (PLANNED/UNPLANNED)
- Does **NOT** interact with the downtime detector

## What It Does NOT Do

| Assumption | Reality |
|-----------|---------|
| "Job schedule tells OEE the ideal cycle time" | ❌ No — ideal cycle time comes from Master Data |
| "Job schedule marks time as 'should run'" | ✅ Yes — but only for planning reference |
| "Job schedule affects downtime categorization" | ❌ No — only Schedule Maintenance does that |

## Relationship to Other Modules

```
Job Schedule (planning)
  → Tells operators what to produce
  → Does NOT affect OEE calculation

Schedule Maintenance (maintenance windows)
  → Overwrites downtime to PLANNED
  → DOES affect OEE calculation

Downtime Detector (sensor-based)
  → Detects stops from Kafka messages
  → Categorizes: SMALL_STOP / UNPLANNED / PLANNED
  → PLANNED comes from Schedule Maintenance, NOT Job Schedule
```

## Related
- [[Schedule Maintenance]]
- [[OEE Monitoring]]
- [[System Architecture]]
