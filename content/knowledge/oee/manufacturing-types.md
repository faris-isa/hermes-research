---
title: "Manufacturing Types and OEE"
description: "How discrete, batch, continuous, assembly, and HMLV manufacturing change OEE calculation and interpretation."
tags:
  - oee
  - manufacturing
  - batch
  - continuous
  - discrete
---

# Manufacturing Types and OEE

Different manufacturing types require different OEE approaches. Using the wrong method produces misleading results. **Context is not optional.**

## 1. Discrete Manufacturing

Individual units produced one at a time — automotive parts, electronics, machined components.

```
OEE = Availability × Performance × Quality
Performance = (idealCycleTime × totalCount) / runTime
```

- **Output:** Individual units (sensor, barcode, vision counting)
- **Cycle time:** Constant per product variant
- **Typical OEE:** 55–70%
- **Key challenge:** Variant complexity — different products have different ideal cycle times

> **Developer note:** Your data model needs a `product_variant` field on every cycle record. Without it, Performance calculations are meaningless when you run 10 different products.

## 2. Batch Manufacturing

Groups of units processed together through recipe-based phases — food, chemicals, pharmaceuticals.

```
Batch Availability = runDuration / (runDuration + setupDuration)
Batch Performance  = idealDuration / runDuration
Batch Quality      = goodQuantity / quantity
```

- **Output:** Batch totals
- **Cycle time:** Varies by batch size
- **Typical OEE:** 50–70%
- **Key challenge:** Batch size varies, so Performance calculation is tricky

### Batch Phase Timing

Batch processes have distinct recipe phases with idle time between them:

```
Batch Timeline:
├── Setup/Changeover (CIP, recipe change, cleaning)
├── Phase 1: Loading/Charging
│   └── Idle: waiting for materials
├── Phase 2: Processing (mixing, heating, reaction)
│   └── Idle: transition to next phase
├── Phase 3: Discharge/Transfer
│   └── Idle: waiting for downstream equipment
├── Quality Hold (waiting for lab results)
└── Teardown/Cleaning
```

> **Key insight:** Shaving even a small amount of time from a phase results in more batches per day. Example: 10 batches/day at 144 min each → improve by 10 min → 10.7 batches/day → ~300 extra batches/year.

### Batch-Specific Pitfalls

1. **Measuring downstream idle equipment** — Measure OEE at the bottleneck only
2. **Wrong cycle time target** — Use historical best-performing batch as surrogate for ideal
3. **Ignoring phase-level breakdown** — Aggregated OEE doesn't reveal which phase is the bottleneck
4. **Overlapping downtime events** — Correctly attribute to avoid double-counting
5. **Quality timing lag** — Lab results may come hours after batch completion; hold time = availability loss

> **Developer note:** Batch OEE needs a `batch_id` that links to recipe phases, quality hold events, and lab results. Your data model is more complex than discrete — plan for it.

## 3. Continuous / Process Manufacturing

Uninterrupted flow of material — chemicals, oil refining, beverages.

```
Performance = actualRate / designRate
Quality     = goodOutput / totalOutput
```

- **Output:** Flow rate (kg/hr, L/hr, tonnes/day)
- **No unit count** — measured against design rate
- **Typical OEE:** 70–85% (higher due to fewer changeovers)
- **Key challenge:** Off-spec production, unplanned shutdowns

> **Developer note:** No `totalCount` field. Your data model needs `actual_rate` and `design_rate` as floats, not integers. Quality is measured by deviation from spec, not by counting defects.

## 4. Assembly Line / Multi-Station

Sequential stations feeding each other — automotive assembly, electronics assembly.

**Three aggregation methods:**

| Method | Formula | Use When |
|--------|---------|----------|
| Simple Average | `Σ(stationOEE) / N` | ❌ Independent machines only |
| Weighted Average | `Σ(lineOEE × volume) / Σ(volume)` | Multi-line facility comparison |
| **Constraint-Based** | `actualOutput / bottleneckCapacity` | **✅ Sequential lines (correct)** |

> **Common mistake:** Averaging station OEEs for line OEE. This is mathematically wrong for sequential lines. The bottleneck determines throughput. See [[Calculation Methods]].

## 5. High-Mix Low-Volume (HMLV)

Frequent changeovers, many variants, small batches — job shops, contract manufacturing.

```
Availability = (plannedTime - Σ(changeoverTime) - downtime) / plannedTime
Performance  = Σ(idealCycleTime_i × quantity_i) / runTime  (per-variant)
Quality      = Σ(goodCount_i) / Σ(totalCount_i)
```

- **Key challenge:** Changeover dominates — sometimes >50% of planned time
- **Typical OEE:** 30–55% (lower is expected and correct)

**Best practices:**
- Use product-family grouping for meaningful comparisons
- Track changeover matrix (which transitions are fastest/slowest)
- Consider [[Extended Metrics#OLE — Overall Labor Effectiveness|OLE]] alongside OEE

> **Developer note:** HMLV needs per-variant cycle time lookup tables. Your `ideal_cycle_time` is not a single value — it's a function of `product_variant`. Plan your schema accordingly.

## 6. OLE — Operator Labor Effectiveness

Complements OEE in semi-automated environments. Two lines with identical OEE can have different economic results due to team performance.

```
Total System Effectiveness = OEE × OLE
```

| OLE Factor | Measures |
|------------|----------|
| Availability | % of scheduled time operator is present and working |
| Performance | % of standard tasks completed per unit time |
| Quality | % of operator-initiated tasks completed correctly |

> **When to use OLE:** Manual operations (assembly, packaging, inspection). Not needed for fully automated lines.

## Key Differences Summary

| Aspect | Continuous | Batch | Discrete | HMLV |
|--------|-----------|-------|----------|------|
| Output counting | Real-time flow | Batch total | Individual units | Per-variant |
| Cycle time | Constant | Varies by batch size | Per variant | Per variant |
| Changeover | Just downtime | Major event (cleaning, recipe) | Product-dependent | Dominant factor |
| Quality check | Per unit (inline) | Per batch (pass/fail, lab) | Per unit | Per unit |
| OEE window | Shift-based | Per-batch, then aggregated | Per-shift | Per-shift |
| Startup/Shutdown | Minimal | Significant per batch | Minimal | Minimal |
| Typical OEE | 70–85% | 50–70% | 55–70% | 30–55% |

## Industry Benchmarks

| Industry | Typical OEE | World-Class | Key Limiting Factor |
|----------|-------------|-------------|---------------------|
| **Automotive** | 65–80% | ≥ 85% | Setup time, tool wear, variant complexity |
| **Pharma** | 50–70% | ≥ 70% | GMP validation, cleaning, batch changeovers |
| **Food & Beverage** | 55–75% | ≥ 80% | Cleaning cycles, perishable materials |
| **Plastics** | 60–80% | ≥ 85% | Cycle time consistency, tool maintenance |
| **Metal Processing** | 50–70% | ≥ 75% | High-mix/low-volume, setup dominance |
| **Electronics/Assembly** | 55–75% | ≥ 80% | Manual intervention, test station bottlenecks |
| **Chemicals (continuous)** | 70–85% | ≥ 90% | Off-spec production, unplanned shutdowns |

**Why benchmarks are incomparable:**
1. Product mix & batch size
2. Automation level
3. Measurement definition (what counts as "planned" vs "unplanned")
4. Time frame (multi-week data only)
5. Manual vs automatic capture — **biggest comparability killer**

> **Developer opinion:** Don't hardcode industry benchmarks into your system. Let users configure their own baselines. A pharma OEE of 60% might be excellent; an automotive OEE of 60% might be a problem. Context determines meaning.

## Pharma-Specific Considerations

Pharmaceutical manufacturing adds compliance layers:

- **Data Integrity (21 CFR Part 11):** Automated, time-stamped, tamper-proof records required
- **Deviation Management:** OEE flags deviations, but formal CAPA workflow is separate
- **Validation Required:** Any software affecting product quality must be validated
- **Electronic Batch Record Integration:** OEE data feeds into EBR

| Factor | Typical Pharma | World-Class Pharma |
|--------|---------------|-------------------|
| Availability | 55–70% | 80%+ |
| Performance | 80–90% | 95%+ |
| Quality | 95–99% | 99.9%+ |
| **OEE** | **40–60%** | **70%+** |

> **Developer note:** Pharma OEE is lower due to GMP validation, cleaning requirements, and batch changeovers. Don't compare pharma to automotive.

## Related

- [[OEE — Overall Equipment Effectiveness]]
- [[Calculation Methods]]
- [[Mistakes and Hidden Factory]]
