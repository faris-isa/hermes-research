---
title: "Shopfloor"
description: "Real-time shopfloor operations — sensor-driven, minimal operator interaction."
tags:
  - ajinomoto
  - modules
  - shopfloor
---

# Shopfloor

Real-time shopfloor operations and monitoring module. The system is **almost entirely sensor-driven** — operators interact with it minimally.

## Purpose

- Real-time machine status monitoring
- Operator input collection (downtime reasons only)
- Real-time event streaming
- Shift-based production tracking

## Operator Workflow

### What Operators Do

1. **Walk up to machine and start working** — no login, no scan, no button press
2. **MES detects activity automatically** via sensors (Kafka messages)
3. **Product changes detected automatically** via SKU codes in sensor messages
4. **Only manual interaction:** Tag downtime reasons when they see unplanned stops

### What Operators Do NOT Do

- ❌ Log in to the system
- ❌ Scan barcodes to start production
- ❌ Manually count output
- ❌ Manually calculate OEE
- ❌ Enter production data

## Sensor-Driven Detection

The shopfloor relies on the downtime detector (`ajinomoto-downtime-detector-go`) to process sensor data:

| Sensor Action | MES Response |
|--------------|--------------|
| Machine starts producing | D messages → runtime tracking |
| Machine stops | E messages → downtime detection begins |
| Counter stops changing | Same-value detection → small stop or downtime |
| SKU code changes | Product changeover detected |
| Weight sensor rejects unit | Reject count incremented |

## Quality Detection

Quality is **automated via weight sensors**:

1. **Production machine** counts output (D messages)
2. **Weight sensor** checks each unit (B messages)
3. **Rejector machine** counts rejects if weight is out of spec (C messages)
4. **Finish good machine** counts good units (A messages)

No human inspection in the loop — purely sensor-based.

## Data Sources

- **InfluxDB:** Real-time machine signals, sensor data
- **Redis:** Live status cache, current shift state
- **PostgreSQL:** Shift configs, operator assignments

## Related
- [[OEE Monitoring]]
- [[Master Data]]
- [[System Architecture]]
