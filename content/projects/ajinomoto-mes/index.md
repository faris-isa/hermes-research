---
title: "Ajinomoto MES"
description: "Manufacturing Execution System — architecture, modules, and how it applies domain knowledge."
tags:
  - ajinomoto
  - mes
  - manufacturing
  - project
---

# Ajinomoto MES

A **Manufacturing Execution System** built as a TypeScript monorepo using Turborepo, serving Ajinomoto's factory operations.

## Business Context

### Problem Solved

Before the MES, operators **manually wrote production counts** and calculated OEE themselves. This was:
- Error-prone (manual counting)
- Time-consuming (operators spending time on calculations instead of production)
- Inaccurate (estimates instead of real sensor data)

### Value Delivered

The MES automates data collection and OEE calculation. The business result: **reduced overtime costs** through data-driven decisions. When you can see which lines are underperforming and why, you don't need to schedule extra shifts to compensate.

### How Managers Use It

Plant managers **review** OEE data to:
- Justify investments ("Line 3 has 45% OEE — we need new equipment")
- Compare lines ("Line 1 is at 75%, why is Line 6 only at 55%?")
- Identify root causes of losses

The MES is a **monitoring and reporting tool**, not an execution tool. Actual work happens on the floor.

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Runtime | Node.js + TypeScript |
| HTTP Framework | Hono |
| ORM | Drizzle |
| Time Series | InfluxDB + Cassandra |
| Cache | Redis |
| Queue | Custom queue package |
| Build | Turborepo |

## Domain Knowledge Applied

This project implements concepts from:

- [[OEE Knowledge Index]] — [[OEE Monitoring]] module applies the [[Six Big Losses]], [[OEE Calculation Deep Dive|A×P×Q formula]], and [[Hidden Factory]] concepts
- [[Batch vs Continuous OEE]] — Handles both batch and continuous production lines
- [[OEE Improvement Strategies]] — [[Schedule Maintenance]] module supports TPM workflows

## Architecture

- [[Monorepo Structure]] — Turborepo workspace layout
- [[Tech Stack Details]] — Technology choices and rationale
- [[Packages Overview]] — Shared library documentation
- [[System Architecture]] — How modules connect, data flow between services

## Modules

| Module | Purpose |
|--------|---------|
| [[OEE Monitoring]] | OEE tracking, reporting, yearly targets |
| [[Shopfloor]] | Real-time shopfloor operations (sensor-driven) |
| [[Master Data]] | Product, machine, and line configuration |
| [[Guideline]] | Standard operating procedures |
| [[Schedule Maintenance]] | Preventive and corrective maintenance (PLANNED overwrites) |
| [[Job Schedule]] | Daily production planning (no OEE impact) |

## Production Lines

11 production lines (FI2-1 through FI2-11, plus FI2-13) with machines from:
- MITSUM, ANRITSU, YAMATO, SIEMENS, OMRON, Sanko, Auto-Wrap, Auto-Carton

Each line has multiple machines (production, finish good, rejector) configured via the `OeeCodeMapper`.

## Shifts

| Shift | Time (GMT+7) |
|-------|-------------|
| Shift 1 | 07:00 - 14:59 |
| Shift 2 | 15:00 - 22:59 |
| Shift 3 | 23:00 - 06:59 |

## Known Issues

- [[OEE Monitoring#Force-Planned Downtime on Zero Production|Force-planned downtime]] hides real availability losses when machines aren't started

## Repos

- **API:** [ajinomoto-mes-api](https://github.com/molca-id/ajinomoto-mes-api)
- **UI:** [ajinomoto-mes-repo-ui](https://github.com/molca-id/ajinomoto-mes-repo-ui)
- **Downtime Detector:** [ajinomoto-downtime-detector-go](https://github.com/molca-id/ajinomoto-downtime-detector-go)
