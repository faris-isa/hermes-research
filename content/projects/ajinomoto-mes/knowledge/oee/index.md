---
title: "OEE Knowledge Index"
description: "Complete OEE reference: formula, benchmarks, Six Big Losses, Hidden Factory, batch vs continuous production, and improvement strategies."
tags:
  - oee
  - manufacturing
  - mes
  - factory
---

# OEE — Overall Equipment Effectiveness

**OEE** is the gold-standard metric for measuring manufacturing productivity. It shows how close a factory gets to perfect production — producing only good parts, as fast as possible, with no downtime.

## The Formula

```
OEE = Availability × Performance × Quality
```

| Metric | Formula | What It Measures |
|--------|---------|------------------|
| **Availability** | `runTime / plannedProductionTime` | Downtime losses |
| **Performance** | `(idealCycleTime × totalCount) / runTime` | Speed losses |
| **Quality** | `goodCount / totalCount` | Defect losses |

## Time Waterfall

```
Calendar Time
  → -Schedule Loss
  = Planned Production Time
    → -Availability Loss
    = Run Time
      → -Performance Loss
      = Net Run Time
        → -Quality Loss
        = Fully Productive Time → Good Output
```

## World-Class Targets

| Factor | Target |
|--------|--------|
| Availability | 90% |
| Performance | 95% |
| Quality | 99.9% |
| **OEE** | **85%** |

> Even achieving 90% in ALL three factors yields only **73% OEE** (0.9³). The 85% target is extremely ambitious.

Most manufacturing companies average **~55–60% OEE**. More companies are below 45% than above 85%.

## Key Topics

- [[Six Big Losses]] — the six categories that eat into OEE
- [[Hidden Factory]] — untapped capacity without capital investment
- [[World-Class OEE and Benchmarks]] — targets, real-world data, industry comparisons
- [[Batch vs Continuous OEE]] — how OEE differs across manufacturing types
- [[OEE Improvement Strategies]] — TPM, SMED, error-proofing, and more
- [[Common OEE Mistakes]] — pitfalls in calculation and measurement
- [[OEE Calculation Deep Dive]] — simple vs preferred formulas, performance > 100% warning

## OEE Hierarchy

Machine (per shift) → Line (per shift) → Area → Plant

Each level aggregates from below, weighted by duration or quantity.

## Quick Rules

1. **Never look at OEE alone** — always check A, P, Q individually
2. **Use design speed**, not historical average, for Ideal Cycle Time
3. **First Pass Yield** — reworked parts count as quality loss
4. **Performance > 100%** means Ideal Cycle Time is wrong
5. **Compare similar processes only** — don't benchmark dissimilar lines

---

*Reference compiled by Hermes Agent. Source: Seiichi Nakajima (TPM), Evocon, industry benchmarks.*
