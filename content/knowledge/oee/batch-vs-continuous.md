---
title: "Batch vs Continuous OEE"
description: "How OEE calculation differs across discrete, batch, continuous, and assembly line manufacturing."
tags:
  - oee
  - manufacturing
  - batch
  - continuous
---

# Batch vs Continuous OEE

Different manufacturing types require different OEE approaches. Using the wrong method produces misleading results.

## Manufacturing Paradigms

### 1. Discrete Manufacturing
Individual units produced one at a time (automotive parts, electronics).

```
OEE = Availability × Performance × Quality
Performance = (idealCycleTime × totalCount) / runTime
```

- Output: Individual units (sensor, barcode, vision)
- Cycle time: Constant per product variant
- Typical OEE: 55–70%

### 2. Batch Manufacturing
Groups of units processed together through recipe-based phases.

```
Batch Availability = runDuration / (runDuration + setupDuration)
Batch Performance  = idealDuration / runDuration
Batch Quality      = goodQuantity / quantity
```

**Key difference:** Batch size varies, so Performance calculation is trickier. See [[Batch OEE Deep Dive]] for details.

- Output: Batch totals
- Cycle time: Varies by batch size
- Typical OEE: 50–70%

### 3. Continuous / Process Manufacturing
Uninterrupted flow of material (chemicals, oil refining, beverages).

```
Performance = actualRate / designRate
Quality     = goodOutput / totalOutput
```

- Output: Flow rate (kg/hr, L/hr, tonnes/day)
- No unit count — measured against design rate
- Typical OEE: 70–85% (higher due to fewer changeovers)

### 4. Assembly Line / Multi-Station
Sequential stations feeding each other.

**Three aggregation methods:**

| Method | Formula | Use When |
|--------|---------|----------|
| Simple Average | `Σ(stationOEE) / N` | ❌ Independent machines only |
| Weighted Average | `Σ(lineOEE × volume) / Σ(volume)` | Multi-line facility comparison |
| **Constraint-Based** | `actualOutput / bottleneckCapacity` | **✅ Sequential lines (correct)** |

> **Common mistake:** Averaging station OEEs for line OEE. Always use constraint-based for sequential lines.

### 5. High-Mix Low-Volume (HMLV)
Frequent changeovers, many variants, small batches.

**Adaptations:**
```
Availability = (plannedTime - Σ(changeoverTime) - downtime) / plannedTime
Performance  = Σ(idealCycleTime_i × quantity_i) / runTime  (per-variant)
Quality      = Σ(goodCount_i) / Σ(totalCount_i)
```

**Best practices:**
- Use product-family grouping
- Track changeover matrix (which transitions are fastest/slowest)
- Apply [[OEE Improvement Strategies#SMED (Single-Minute Exchange of Die)|SMED]] aggressively
- Consider OLE (Operator Labor Effectiveness) alongside OEE

### 6. OLE (Operator Labor Effectiveness)

Complements OEE in semi-automated environments.

```
Total System Effectiveness = OEE × OLE
```

| OLE Factor | Measures |
|------------|----------|
| Availability | % of scheduled time operator is present and working |
| Performance | % of standard tasks completed per unit time |
| Quality | % of operator-initiated tasks completed correctly |

---

## Key Differences Summary

| Aspect | Continuous | Batch |
|--------|-----------|-------|
| Output counting | Real-time flow | Batch total |
| Cycle time | Constant | Varies by batch size |
| Changeover | Just downtime | Major event (cleaning, recipe) |
| Quality check | Per unit (inline) | Per batch (pass/fail, lab) |
| OEE window | Shift-based | Per-batch, then aggregated |
| Startup/Shutdown | Minimal | Significant per batch |

---

## Related
- [[OEE — Overall Equipment Effectiveness]]
- [[Batch OEE Deep Dive]]
- [[Six Big Losses]]
