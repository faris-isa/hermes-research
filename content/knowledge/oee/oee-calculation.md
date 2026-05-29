---
title: "OEE Calculation Methods"
description: "How to calculate OEE — simple formula, A×P×Q, the time waterfall, and the rules you must follow."
tags:
  - oee
  - calculation
  - manufacturing
  - waterfall
---

# OEE Calculation Methods

There is no single "right way" to calculate OEE. The method depends on your manufacturing context. But some approaches are better than others for diagnostics.

## Formula 1: Simple (Single Calculation)

```
OEE = (Good Count × Ideal Cycle Time) / Planned Production Time
```

This gives you a valid OEE number, but **limited diagnostic value**. You get a score but no idea where to improve — you can't tell if the problem is downtime, speed, or quality.

**Use when:** Quick summary, executive reporting, no need for root cause analysis.

## Formula 2: A × P × Q (Preferred — Always Use This for Improvement)

```
OEE = Availability × Performance × Quality
```

| Factor | Formula | What It Measures |
|--------|---------|------------------|
| **Availability** | `Run Time / Planned Production Time` | Downtime losses |
| **Performance** | `(Ideal Cycle Time × Total Count) / Run Time` | Speed losses |
| **Quality** | `Good Count / Total Count` | Defect losses |

This provides both a score AND the three loss factors to target improvement.

**Use when:** Root cause analysis, improvement projects, daily shopfloor management.

## The Time Waterfall

The waterfall shows where time goes and what each loss level represents:

```
Calendar Time (24/7/365)
  → -Schedule Loss (no demand, no shift)
  = Planned Production Time
    → -Availability Loss (breakdowns, changeovers)
    = Run Time
      → -Performance Loss (slow cycles, micro-stops)
      = Net Run Time
        → -Quality Loss (defects, rework, startup rejects)
        = Fully Productive Time → Good Output
```

Each level subtracts a different type of loss. **Each loss type requires a different improvement approach:**
- Schedule Loss → better planning
- Availability Loss → [[OEE Improvement Strategies|TPM and SMED]]
- Performance Loss → root cause analysis, operator engagement
- Quality Loss → error-proofing, standardized work

## Formula 3: Batch-Specific

For batch manufacturing, the calculation differs because output is counted per batch, not per unit:

```
Batch Availability = Run Duration / (Run Duration + Setup Duration)
Batch Performance  = Ideal Duration / Run Duration
Batch Quality      = Good Quantity / Quantity
```

See [[Manufacturing Types and Industry Implementation]] for full batch calculation details.

## Calculation Rules

These rules apply regardless of which formula you use:

1. **Always use design speed / ideal cycle time** — not historical average. Historical average places a false upper limit on improvement.

2. **Performance > 100% means your Ideal Cycle Time is wrong.** A value over 100% inflates OEE and masks losses. Fix the cycle time, don't celebrate the number.

3. **Quality = First Pass Yield.** Reworked parts count as quality loss because they consume time and resources.

4. **Never use simple average** when aggregating across batches or shifts with different durations. Use weighted average by duration or quantity.

5. **Check A, P, Q individually.** OEE can stay flat while one factor drops and another rises — masking real problems.

6. **The threshold between "Equipment Failure" and "Minor Stop" is flexible.** Common rule: downtime > 2 min = Equipment Failure; ≤ 2 min = Minor Stop. Be consistent.

## Loss Perspectives

Losses can be viewed from three angles:

1. **Part Units:** "We lost 1,000 units of potential production" (sales/capacity perspective)
2. **Time Units:** "We lost 2 hours of production" (labor/utilization perspective)
3. **Percentage:** "We lost 17% of Planned Production Time" (manufacturing performance perspective)

All three are valid — they serve different audiences. The percentage view is most useful for improvement targeting.

## Related

- [[OEE Concept and Interpretation]] — what the numbers mean
- [[Common Mistakes and Hidden Factory]] — what goes wrong in calculation
- [[Manufacturing Types and Industry Implementation]] — how context changes the math
- [[OEE Hierarchy and Aggregation]] — why simple averaging is wrong
