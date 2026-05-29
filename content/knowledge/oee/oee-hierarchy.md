---
title: "OEE Hierarchy and Aggregation"
description: "Why OEE aggregation is not straightforward, three methods for calculating line-level OEE, and multi-level reporting strategies."
date: 2025-05-29
tags:
  - oee
  - hierarchy
  - aggregation
  - line-oee
  - plant-oee
  - bottleneck
  - capacity-planning
---

# OEE Hierarchy and Aggregation

## Why Aggregation Is Not Straightforward

A common mistake: averaging OEE across machines to get a line or plant score. This is mathematically wrong for most manufacturing environments.

The problem: OEE factors are **multiplicative**, not additive. In a sequential line, one station's loss cascades through the entire line. Naive averaging ignores these dependencies.

See [[oee-concept]] for OEE fundamentals and [[oee-calculation]] for calculation details.

---

## The Hierarchy

OEE operates at four levels, each with a different purpose:

```
Machine Level
    │
    ▼
Line Level
    │
    ▼
Area Level
    │
    ▼
Plant Level
```

### Machine Level

- **Purpose:** Diagnostics and maintenance
- **Granularity:** Individual equipment
- **Data source:** PLC, sensors, direct measurement
- **Use case:** Identifying specific equipment problems, maintenance scheduling
- **OEE range:** Widest variation (some machines at 90%, others at 40%)

### Line Level

- **Purpose:** Capacity planning and production scheduling
- **Granularity:** Sequential stations forming a production line
- **Data source:** Aggregated from machine-level data
- **Use case:** Determining line throughput, bottleneck identification
- **OEE range:** Typically lower than individual machine OEE (constrained by bottleneck)

### Area Level

- **Purpose:** Operational management
- **Granularity:** Group of related lines
- **Data source:** Aggregated from line-level data
- **Use case:** Shift performance, area supervisor reporting
- **OEE range:** Reflects mixed product/machine types

### Plant Level

- **Purpose:** Executive reporting and strategic decisions
- **Granularity:** Entire facility
- **Data source:** Aggregated from area/line-level data
- **Use case:** Capital expenditure justification, benchmarking
- **OEE range:** Highest-level summary, least actionable detail

---

## Three Aggregation Methods

### Method 1: Simple Average

$$
\text{Line OEE} = \frac{\sum \text{Machine OEE}}{n}
$$

**When it's valid:** Only for **independent machines in a job shop** where each machine operates independently and contributes separately to total output.

**When it's WRONG:** Sequential production lines. Averaging assumes all machines contribute equally and independently — which is false in a line.

**Example of why it's wrong:**

```
5-station assembly line:
  Station 1: 88% OEE
  Station 2: 91% OEE
  Station 3: 76% OEE (bottleneck)
  Station 4: 85% OEE
  Station 5: 82% OEE

  Simple average: (88+91+76+85+82)/5 = 84.4%

  But Station 3 is the bottleneck!
  Line output is constrained by Station 3's throughput.
  Actual line OEE ≈ 76%, not 84.4%.
```

**Use case:** Job shops with independent machines, multi-line facilities where lines are independent.

---

### Method 2: Weighted Average

$$
\text{Plant OEE} = \frac{\sum (\text{Line OEE}_i \times \text{Line Duration}_i)}{\sum \text{Line Duration}_i}
$$

Or weighted by quantity:

$$
\text{Plant OEE} = \frac{\sum (\text{Line OEE}_i \times \text{Line Output}_i)}{\sum \text{Line Output}_i}
$$

**When it's valid:** Multi-line facilities where each line runs for different durations or produces different quantities.

**Advantage:** Gives proportionally more weight to lines that run longer or produce more.

**Example:**

```
Line A: 80% OEE, runs 16 hours/day, produces 10,000 units
Line B: 65% OEE, runs 8 hours/day, produces 4,000 units

Weighted by time: (80×16 + 65×8) / (16+8) = 75.0%
Weighted by quantity: (80×10000 + 65×4000) / (10000+4000) = 75.7%

Simple average (WRONG for this case): (80+65)/2 = 72.5%
```

**Use case:** Multi-line facilities, shift-level aggregation, comparing plants of different sizes.

---

### Method 3: Constraint-Based (Bottleneck)

$$
\text{Line OEE} = \frac{\text{Good Output from Line}}{\text{Theoretical Max Output (at bottleneck design speed)}}
$$

**When it's valid:** Sequential production lines where the bottleneck station determines throughput. **This is the CORRECT method for most manufacturing lines.**

**How it works:**

1. Identify the **bottleneck station** (lowest throughput)
2. Use the bottleneck's **design capacity** as the theoretical maximum
3. Line output = actual good units produced by the line
4. Line OEE = actual good output / theoretical max at bottleneck speed

**Example:**

```
5-station line, all rated at 100 units/hour design speed:
  Station 1: 95 units/hour actual (95% Performance)
  Station 2: 98 units/hour actual (98% Performance)
  Station 3: 82 units/hour actual (82% Performance) ← Bottleneck
  Station 4: 91 units/hour actual (91% Performance)
  Station 5: 89 units/hour actual (89% Performance)

  Line throughput: 82 units/hour (constrained by Station 3)
  Theoretical max: 100 units/hour (design speed)

  Line Performance = 82/100 = 82%

  If Quality = 97% and Availability = 90%:
  Line OEE = 90% × 82% × 97% = 71.5%

  NOT the average of 95%, 98%, 82%, 91%, 89%!
```

**Key insight:** Improving any station *other than the bottleneck* does NOT improve line output. Only improving the bottleneck improves the line.

---

## When to Use Which Method

| Method | Valid For | Invalid For | Key Assumption |
|--------|----------|-------------|----------------|
| Simple Average | Independent machines, job shops | Sequential lines | All machines contribute independently |
| Weighted Average | Multi-line facilities, shift comparison | Single sequential line (use constraint-based) | Weighting factor is relevant to output |
| Constraint-Based | Sequential production lines, assembly | Independent machines (use simple average) | Bottleneck determines line throughput |

### Decision Tree

```
Are the machines independent (job shop)?
├── YES → Simple Average
└── NO  → Is it a sequential line?
          ├── YES → Constraint-Based
          └── NO  → Is it multiple independent lines?
                    ├── YES → Weighted Average
                    └── NO  → Analyze by segment, apply appropriate method per segment
```

---

## Multi-Level OEE Reporting

### Station Level — For Diagnostics

- Drill down to individual machine losses
- Identify specific failure modes, speed issues, quality problems
- Guide maintenance and improvement actions
- Report: A, P, Q decomposition per machine

### Line Level — For Capacity Planning

- Determine actual line throughput vs. theoretical capacity
- Identify bottleneck and constraint propagation
- Guide investment decisions (bottleneck improvement vs. new line)
- Report: Constraint-based OEE, bottleneck identification

### Facility Level — For Executive Reporting

- High-level summary of overall equipment effectiveness
- Trend over time (are we improving?)
- Compare facilities (with caution — see [[oee-concept#never-compare-dissimilar-processes]])
- Report: Weighted average OEE across lines, TEEP for total capacity view

### Reporting Hierarchy Table

| Level | Primary Audience | Method | Key Metric | Frequency |
|-------|-----------------|--------|------------|-----------|
| Station | Maintenance/Engineering | Direct measurement | A, P, Q per machine | Real-time |
| Line | Production Manager | Constraint-based | Line OEE, bottleneck | Per shift |
| Area | Plant Manager | Weighted average | Area OEE, trend | Daily/Weekly |
| Plant | Executive | Weighted average + TEEP | Plant OEE, TEEP | Monthly/Quarterly |

---

## The Bottleneck Principle

This is the most important concept in OEE hierarchy:

> **A line with 5 stations at 85% OEE does NOT have 85% line OEE if one station is the bottleneck.**

### Why

In a sequential line, every unit must pass through *every* station. The bottleneck station limits the entire line's throughput. Even if 4 stations are running at 95%, the line can only produce at the bottleneck's rate.

### Implications

1. **Don't spread improvement resources evenly** — focus on the bottleneck
2. **A balanced line is better than a high-average line** — 85/85/85/85/85 beats 95/95/85/95/95
3. **Moving the bottleneck matters** — when you improve the bottleneck, a different station becomes the new bottleneck
4. **Buffer inventory** can decouple stations, but adds cost and lead time

### The Balancing Paradox

```
Before improvement:
  Station A: 95%    Station B: 80%    Station C: 90%
  Line OEE: ~80% (bottleneck at B)

After improving B to 90%:
  Station A: 95%    Station B: 90%    Station C: 90%
  Line OEE: ~90% (bottleneck now shared between B and C)

After improving C to 95%:
  Station A: 95%    Station B: 90%    Station C: 95%
  Line OEE: ~90% (bottleneck at B again — improving C didn't help!)
```

**Lesson:** Always identify the bottleneck *before* investing in improvement. See [[oee-improvement]] for prioritization guidance.

---

## Common Aggregation Mistakes

### Mistake 1: Averaging Station OEE for Line OEE

As demonstrated above, this overstates line performance. Always use constraint-based aggregation for sequential lines.

### Mistake 2: Reporting Plant OEE as a Simple Average

Different lines have different products, complexities, and run times. Use weighted averages.

### Mistake 3: Comparing OEE Across Different Lines

Two lines producing different products at different volumes have different loss profiles. OEE comparison is only meaningful for [[oee-concept#never-compare-dissimilar-processes|identical or very similar processes]].

### Mistake 4: Not Identifying the Bottleneck

If you don't know which station is the constraint, you can't properly calculate or improve line OEE. Invest in bottleneck detection — it's the highest-leverage activity.

### Mistake 5: Ignoring Off-Line Stations

If a line has 5 stations but 1 is offline for maintenance, the line OEE calculation changes. The "line" is now a 4-station line with different dynamics. Reassess the bottleneck.

---

## Implementation Roadmap

1. **Start at machine level** — get accurate OEE per station [[oee-calculation]]
2. **Identify the bottleneck** — which station limits line throughput?
3. **Calculate line OEE** using constraint-based method
4. **Establish baseline** — measure for 4+ weeks before making changes [[oee-improvement#the-oee-drop-warning]]
5. **Improve the bottleneck** — this is the only way to improve line output
6. **Re-identify the bottleneck** — after improvement, reassess
7. **Aggregate to plant level** — use weighted averages for multi-line facilities
8. **Report at appropriate level** — station for diagnostics, line for planning, plant for executives

---

## Related Pages

- [[oee-concept]] — OEE fundamentals and interpretation
- [[oee-calculation]] — How to calculate OEE at machine level
- [[oee-manufacturing-types]] — How hierarchy applies to different manufacturing types
- [[oee-improvement]] — Bottleneck-focused improvement strategies
- [[oee-extended-metrics]] — TEEP, OAE, OLE for broader context
- [[oee-mistakes-and-hidden-factory]] — Common errors in OEE calculation
