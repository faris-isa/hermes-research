---
title: "OEE Calculation Deep Dive"
description: "Two OEE formulas, performance calculation nuances, and the aggregation hierarchy."
tags:
  - oee
  - calculation
  - manufacturing
---

# OEE Calculation Deep Dive

## Two OEE Formulas

### Simple (Single Calculation)
```
OEE = (Good Count × Ideal Cycle Time) / Planned Production Time
```

Valid but doesn't break down losses — **limited diagnostic value**. You get a score but no idea where to improve.

### Preferred (A × P × Q) — Always Use This
```
OEE = Availability × Performance × Quality
```

Provides both a score AND the three loss factors to target improvement.

> **Danger of looking at OEE alone:** OEE can stay flat while one factor drops and another rises, masking real problems. Always check A, P, Q individually.

---

## Performance > 100% Warning

Performance can exceed 100% if the machine runs faster than its nominal rated speed.

> **Performance should never exceed 100% in a well-calibrated system** — a value over 100% indicates the Ideal Cycle Time is set too high (or design speed is wrong). This inflates OEE and masks losses.

---

## Aggregation Hierarchy

```
Machine (per shift)
  → Line (per shift)
    → Area
      → Plant
```

Each level aggregates from below, weighted by duration or quantity.

### Weighting Methods

| Method | Formula | When to Use |
|--------|---------|-------------|
| **By Duration** | `Σ(OEE_i × duration_i) / Σ(duration_i)` | Shift/plant aggregation |
| **By Quantity** | `Σ(OEE_i × quantity_i) / Σ(quantity_i)` | Volume comparison |

> **Never use simple average** when batches or shifts have different durations.

---

## Loss Perspectives

Losses can be viewed from three angles:

1. **Part Units:** "We lost 1,000 units of potential production" (sales/capacity)
2. **Time Units:** "We lost 2 hours of production" (labor/utilization)
3. **Percentage:** "We lost 17% of Planned Production Time" (manufacturing performance)

---

## Related
- [[OEE — Overall Equipment Effectiveness]]
- [[Six Big Losses]]
- [[Batch vs Continuous OEE]]
- [[Common OEE Mistakes]]
