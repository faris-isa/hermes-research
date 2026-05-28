---
title: "Ajinomoto MES"
description: "Manufacturing Execution System — architecture, modules, and domain knowledge for Ajinomoto production."
tags:
  - ajinomoto
  - mes
  - manufacturing
  - project
---

# Ajinomoto MES

A **Manufacturing Execution System** built as a TypeScript monorepo using Turborepo, serving Ajomoto's factory operations.

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

## Project Structure

```
ajinomoto-mes-api/
├── apps/                    # Microservices
│   ├── oee-monitoring/      # OEE tracking & reporting
│   ├── shopfloor/           # Shopfloor management
│   ├── master-data/         # Master data management
│   ├── guideline/           # Guideline management
│   ├── schedule-maintenance/# Maintenance scheduling
│   ├── job-schedule/        # Job scheduling
│   ├── scheduler/           # Scheduler service
│   ├── worker/              # Background worker
│   └── seeder/              # Database seeder
├── packages/                # Shared libraries
│   ├── oee/                 # OEE calculation engine
│   ├── drizzle/             # Database ORM config
│   ├── schema/              # Database schema
│   ├── influx/              # InfluxDB client
│   ├── cassandra/           # Cassandra client
│   ├── queue/               # Queue management
│   ├── redis/               # Redis client
│   ├── hono/                # HTTP framework extensions
│   ├── config/              # Configuration management
│   ├── constant/            # Shared constants
│   └── util/                # Utility functions
└── tools/                   # Dev tooling
```

## Documentation

### [[Architecture]]
- [[Monorepo Structure]] — Turborepo workspace layout
- [[Tech Stack Details]] — Technology choices and rationale
- [[Packages Overview]] — Shared library documentation

### [[Modules]]
- [[OEE Monitoring]] — OEE tracking, reporting, and targets
- [[Shopfloor]] — Shopfloor management and real-time monitoring
- [[Master Data]] — Product, machine, and line configuration
- [[Guideline]] — Standard operating procedures
- [[Schedule Maintenance]] — Preventive and corrective maintenance
- [[Job Schedule]] — Automated job scheduling

### [[Knowledge]]
- [[OEE Knowledge Index]] — Complete OEE reference (formulas, benchmarks, strategies)
  - [[Six Big Losses]]
  - [[Hidden Factory]]
  - [[World-Class OEE and Benchmarks]]
  - [[Batch vs Continuous OEE]]
  - [[OEE Improvement Strategies]]
  - [[Common OEE Mistakes]]
  - [[OEE Calculation Deep Dive]]
  - [[Batch OEE Deep Dive]]

## Repos

- **API:** [ajinomoto-mes-api](https://github.com/molca-id/ajinomoto-mes-api)
- **UI:** [ajinomoto-mes-repo-ui](https://github.com/molca-id/ajinomoto-mes-repo-ui)

---

*This project is maintained by Molca team.*
