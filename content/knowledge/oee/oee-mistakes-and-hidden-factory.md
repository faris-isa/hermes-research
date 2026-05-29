---
title: "Common Mistakes and Hidden Factory"
description: "The Hidden Factory concept, Six Big Losses in detail, and the calculation mistakes that will break your OEE system."
tags:
  - oee
  - mistakes
  - hidden-factory
  - six-big-losses
  - manufacturing
---

# Common Mistakes and Hidden Factory

This is where the real problems live. Getting OEE wrong is worse than not measuring it at all — bad numbers lead to bad decisions.

## The Hidden Factory

The **Hidden Factory** is the untapped production capacity that can be unlocked **without capital investment**. Coined by Armand Feigenbaum (late 1970s), originally focused on quality waste, now covers all manufacturing waste.

```
Fully Productive Time = Good Pieces × Ideal Cycle Time
Hidden Factory Time  = All Time (24/7) − Fully Productive Time
```

For many manufacturers, the **hidden factory is larger than actual output**. The four loss zones:

| Zone | What It Is | Typical Impact |
|------|-----------|----------------|
| **Schedule Loss** | Time not scheduled for production | Largest for 1–2 shift operations |
| **Availability Loss** | Downtime during scheduled time | Largest during scheduled time |
| **Performance Loss** | Small stops and slow cycles | Often hidden — operators don't report |
| **Quality Loss** | Defects, rework, scrap | Smallest but highest customer risk |

**Key Insight:** When companies switch from manual to automatic measurement, the Hidden Factory suddenly becomes visible — and it's usually enormous.

---

## The Six Big Losses

The Six Big Losses framework categorizes all production losses into three groups that map directly to the [[OEE Calculation Methods|OEE formula]].

### Availability Losses (Equipment is stopped)

| # | Loss | What It Is | Examples |
|---|------|-----------|----------|
| 1 | **Equipment Failure** | Significant downtime due to failure or unplanned event | Tooling failure, breakdowns, unplanned maintenance, lack of operators/materials, starved/blocked by upstream/downstream |
| 2 | **Setup & Adjustment** | Downtime due to changeover or adjustment | Changeovers, major adjustments, cleaning, warmup, planned maintenance |

**Threshold:** The line between "Equipment Failure" and "Minor Stop" is flexible. Common rule: downtime > 2 min = Equipment Failure; ≤ 2 min = Minor Stop. **Be consistent** — whatever you choose, apply it everywhere.

### Performance Losses (Equipment running below optimal speed)

| # | Loss | What It Is | Examples |
|---|------|-----------|----------|
| 3 | **Idling & Minor Stops** | Short stops (1–2 min) resolved by operator without maintenance | Misfeeds, material jams, obstructed flow, incorrect settings, misaligned sensors |
| 4 | **Reduced Speed** | Running slower than Ideal Cycle Time | Dirty/worn equipment, poor lubrication, substandard materials, operator inexperience |

**Key insight:** Minor stops are chronic and often overlooked but accumulate significantly. Most companies don't track them accurately.

### Quality Losses (Parts that don't meet specifications)

| # | Loss | What It Is | Examples |
|---|------|-----------|----------|
| 5 | **Process Defects** | Defective parts during **stable (steady-state) production** — includes scrap AND rework | Incorrect settings, operator errors, lot expiration |
| 6 | **Reduced Yield** | Defective parts from **startup until stable production** — most common after changeovers | Suboptimal changeovers, incorrect settings, equipment warmup cycles |

> **Quality = First Pass Yield**, not just scrap rate. Reworked parts count as quality loss because they consume time and resources.

### Six Big Losses Waterfall

```
Planned Production Time
  → -Equipment Failure (breakdowns)        → Availability Loss
  → -Setup & Adjustment (changeovers)      → Availability Loss
  = Run Time
    → -Idling & Minor Stops                → Performance Loss
    → -Reduced Speed                       → Performance Loss
    = Net Run Time
      → -Process Defects (mid-batch)       → Quality Loss
      → -Reduced Yield (startup rejects)   → Quality Loss
      = Fully Productive Time (Good Output)
```

---

## Common Calculation Mistakes

### 1. Misclassifying Stops as "Planned"

Changeovers and setup are **availability losses**, not acceptable downtime. Classifying them as "planned" inflates OEE and hides improvement opportunities.

> Setup time is planned in the schedule — but it's still a loss that reduces OEE.

### 2. Excluding Operators

Operators have the **deepest machine knowledge**. Excluding them from data collection leads to:
- Poor data quality (guessing instead of measuring)
- No buy-in for improvement initiatives
- Missed root causes

### 3. Using Standard Speed Instead of Design Speed

Historical average speed places a **false upper limit** on improvement. If the machine was designed to run at 100 units/min but averages 80, using 80 as the target says "we can't improve."

**Always use design speed** (Ideal Cycle Time from spec) for Performance calculations.

### 4. Insufficient Data Collection

Manual/paper-based monitoring is error-prone:
- Operators guess downtimes
- Minor stops go unrecorded
- Cycle times are rounded or estimated
- Quality data is batched, not real-time

### 5. Focusing Only on OEE Score

Two lines with the same OEE can have completely different loss profiles. Improvement actions depend on **WHICH factor is weakest**. OEE can stay flat while one factor drops and another rises.

### 6. Performance > 100%

Performance exceeding 100% means the **Ideal Cycle Time is set too high**. This inflates OEE and masks real losses.

### 7. Assuming 100% Quality

Without real-time quality tracking, quality is often **guessed** — and usually guessed optimistically.

### 8. Setting One Target for All Lines

Different products, complexities, and batch sizes produce different OEE profiles. A line making 10 products should naturally have lower OEE than a single-product line — **this is expected and correct**.

---

## Related

- [[OEE Calculation Methods]] — how to calculate correctly
- [[OEE Improvement Strategies]] — what to do about these problems
- [[Manufacturing Types and Industry Implementation]] — how context changes everything
