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
| [[Shopfloor]] | Real-time shopfloor operations |
| [[Master Data]] | Product, machine, and line configuration |
| [[Guideline]] | Standard operating procedures |
| [[Schedule Maintenance]] | Preventive and corrective maintenance |
| [[Job Schedule]] | Automated job scheduling |

## Repos

- **API:** [ajinomoto-mes-api](https://github.com/molca-id/ajinomoto-mes-api)
- **UI:** [ajinomoto-mes-repo-ui](https://github.com/molca-id/ajinomoto-mes-repo-ui)
- **Downtime Detector:** [ajinomoto-downtime-detector-go](https://github.com/molca-id/ajinomoto-downtime-detector-go)
