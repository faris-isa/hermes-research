---
title: "Manufacturing Types and Industry Implementation"
description: "How OEE differs across discrete, batch, continuous, assembly, HMLV, and hybrid manufacturing — with industry-specific notes."
tags:
  - oee
  - manufacturing
  - batch
  - continuous
  - discrete
---

# Manufacturing Types and Industry Implementation

Different manufacturing types require fundamentally different OEE approaches. Using the wrong method produces misleading results. This page covers the six main paradigms and how to handle each.

## 1. Discrete Manufacturing

Individual units produced one at a time — automotive parts, electronics, machined components.

```
OEE = Availability × Performance × Quality
Performance = (idealCycleTime × totalCount) / runTime
```

| Aspect | Detail |
|--------|--------|
| Output counting | Individual units (sensor, barcode, vision) |
| Cycle time | Constant per product variant (lookup by SKU) |
| Changeover | Moderate — tooling change, fixture swap |
| Quality | Per-unit inline inspection (vision, gauging) |
| Main losses | Equipment failure, speed loss, minor stops |
| **Typical OEE** | **55–70%** (industry average), 80–85% world-class |

## 2. Batch Manufacturing

Groups of units processed together through recipe-based phases. Common in food, pharma, chemicals.

### Batch-Specific Formulas

```
Batch Availability = runDuration / (runDuration + setupDuration)
Batch Performance  = idealDuration / runDuration
Batch Quality      = goodQuantity / quantity
```

### Batch Phase Timing

Batch processes have distinct **recipe phases** (mixing, heating, cooling, filling) with idle time between phases:

```
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

**Key Insight:** Shaving even a small amount from a phase = more batches per day. Example: 10 batches/day at 144 min → improve by 10 min → 10.7 batches/day → ~300 extra batches/year.

### Performance Calculation (The Tricky Part)

Performance is hardest in batch because batch size varies:

| Method | Formula | When to Use |
|--------|---------|-------------|
| **Ideal Duration** | `idealDuration / runDuration` | Simple recipes |
| **Ideal Cycle Time × Count** | `(idealCycleTime × batchQuantity) / netRunTime` | Standard approach |
| **Phase-based** | `Σ(idealPhaseTime) / Σ(actualPhaseTime)` | Complex recipes with many phases |

> **Critical:** Use design speed from recipe or machine spec, NOT historical average.

### Batch-Specific Pitfalls

1. **Measuring downstream idle equipment** — measure OEE at the bottleneck only
2. **Wrong cycle time target** — use historical best-performing batch as surrogate
3. **Ignoring phase-level breakdown** — aggregated OEE doesn't reveal which phase is the bottleneck
4. **Quality timing lag** — lab results may come hours after batch completion; hold time = availability loss
5. **Equipment dependency** — measure the constraint, not every machine

### Batch OEE Waterfall

```
Planned Production Time
  - Batch Changeover (CIP, recipe change)     → Availability Loss
  - Material Wait / Quality Hold              → Availability Loss
  = Batch Run Time
    - Slow Phases (over ideal)                → Performance Loss
    - Phase Idle / Micro-stops                → Performance Loss
    = Net Run Time
      - Startup Rejects (post-changeover)     → Quality Loss
      - Process Defects (mid-batch)           → Quality Loss
      - Rework Batch                          → Quality Loss
      = Good Batch Output
```

- **Typical OEE:** 50–70%

## 3. Continuous / Process Manufacturing

Uninterrupted flow — chemicals, oil refining, beverages, paper.

```
Performance = actualRate / designRate
Quality     = goodOutput / totalOutput
```

| Aspect | Detail |
|--------|--------|
| Output counting | Flow rate (kg/hr, L/hr, tonnes/day) |
| Cycle time | Not unit-based — use design throughput rate |
| Changeover | Rare but very long (product transition, flushing) |
| Quality | Lab samples at intervals, not per-unit |
| Main losses | Speed reduction, unplanned shutdowns, off-spec production |
| **Typical OEE** | **70–85%** (higher because fewer changeovers) |

> **Key difference from discrete:** No "unit count" — performance measured against design rate, not cycle time.

## 4. Assembly Line / Multi-Station

Sequential stations where each station's output feeds the next. **The bottleneck determines line throughput.**

### Aggregation Methods (Critical)

| Method | Formula | Use When |
|--------|---------|----------|
| Simple Average | `Σ(stationOEE) / N` | ❌ Independent machines only |
| Weighted Average | `Σ(lineOEE × volume) / Σ(volume)` | Multi-line facility comparison |
| **Constraint-Based** | `actualOutput / bottleneckCapacity` | **✅ Sequential lines (correct)** |

> **Common mistake:** A line with 5 stations at 85% does NOT have 85% line OEE if one station is the bottleneck. Always use constraint-based for sequential lines.

### Multi-Level OEE

- **Station-Level:** A × P × Q per machine → diagnostic tool for improvement
- **Line-Level:** Constraint-based → answers "how much scheduled capacity did we deliver?"
- **Facility-Level:** Weighted average by line volume → executive trend reporting

- **Typical OEE:** 55–75%

## 5. High-Mix Low-Volume (HMLV)

Frequent changeovers, many product variants, small batch sizes.

**Unique challenges:**
- **Availability dominates losses** — setup/changeover can exceed 30–50% of planned time
- **Performance harder to measure** — ideal cycle time varies per variant
- **Changeover sequencing matters** — smart sequencing reduces total changeover time

### Adapted Formulas

```
Availability = (plannedTime - Σ(changeoverTime) - downtime) / plannedTime
Performance  = Σ(idealCycleTime_i × quantity_i) / runTime  (per-variant weighting)
Quality      = Σ(goodCount_i) / Σ(totalCount_i)  (across all variants)
```

**Best practices:**
- Use **product-family grouping** — calculate OEE per family, then aggregate
- Track **changeover matrix** — which transitions are fastest/slowest
- Apply SMED aggressively — this is where the biggest gains are
- Consider **OLE (Operator Labor Effectiveness)** alongside OEE

## 6. Hybrid Manufacturing

Mix of batch and continuous on the same line (e.g., batch reactor → continuous packaging).

**Approach:**
- Measure **each segment** with its appropriate method
- Batch segment: per-batch OEE, then aggregated (weighted by duration)
- Continuous segment: standard OEE against design rate
- Line-level: constraint-based — the slowest segment determines throughput

> **Key insight:** Don't force one calculation method across the entire line. Segment and aggregate appropriately.

---

## Industry-Specific Notes

### Pharmaceutical (GMP)

Pharma has unique constraints that lower typical OEE:

| Factor | Typical | World-Class |
|--------|---------|-------------|
| Availability | 55–70% | 80%+ |
| Performance | 80–90% | 95%+ |
| Quality | 95–99% | 99.9%+ |
| **OEE** | **40–60%** | **70%+** |

**Why pharma OEE is lower:**
- GMP validation requirements (21 CFR Part 11)
- Mandatory cleaning between batches (CIP/SIP)
- Quality hold time (waiting for lab results)
- Electronic Batch Record (EBR) integration requirements

### Food & Beverage

- Cleaning cycles between product runs (allergen changeovers)
- Perishable materials → schedule sensitivity
- Seasonal demand → utilization swings
- **Typical OEE:** 55–75%

### Chemicals (Continuous)

- Off-spec production as quality loss
- Unplanned shutdowns are expensive (reactor cleaning)
- Fewer changeovers → typically higher OEE
- **Typical OEE:** 70–85%

### Automotive

- Setup time and variant complexity dominate
- High automation → good performance tracking
- **Typical OEE:** 65–80%

---

## Related

- [[OEE Calculation Methods]] — how to calculate each factor
- [[OEE Improvement Strategies]] — TPM, SMED, error-proofing
- [[Common Mistakes and Hidden Factory]] — what goes wrong
