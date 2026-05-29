---
title: "Manufacturing Types and Industry Implementation"
description: "How OEE calculation and interpretation varies across discrete, batch, continuous, assembly, HMLV, and hybrid manufacturing."
date: 2025-05-29
tags:
  - oee
  - manufacturing
  - discrete
  - batch
  - continuous
  - assembly
  - hmlv
  - industry
---

# Manufacturing Types and Industry Implementation

OEE is not one-size-fits-all. The calculation method, expected ranges, and dominant losses vary significantly by manufacturing type. This page covers how to adapt OEE for your specific environment.

See [[oee-calculation]] for the base formulas and [[oee-concept]] for the foundational concepts.

---

## Discrete Manufacturing

**What it is:** Production of distinct, countable units (widgets, components, assemblies). Each unit has a defined cycle time per SKU.

**Examples:** CNC machining, stamping, injection molding (single cavity), 3D printing, PCB assembly

| Parameter | Value |
|-----------|-------|
| Typical OEE Range | 60-85% |
| Key Calculation Factor | Constant ideal cycle time per SKU |
| Primary Losses | Setup/changeover, equipment failure, defects |

### How to Calculate

- **Ideal Cycle Time** is well-defined per product/SKU
- **Total Count** = number of units produced (physical counter or PLC)
- **Good Count** = units passing inspection
- Setup time is often the dominant availability loss

### Pitfalls

- Cycle time changes between SKUs — you must set **per-SKU ideal cycle times**
- Multi-cavity molds produce multiple parts per cycle — account for cavity count
- Rework loops can inflate Total Count if not properly tracked

```plaintext
Example:
  SKU-A ideal cycle time: 4.0 sec/unit
  SKU-B ideal cycle time: 6.5 sec/unit
  If running mixed: calculate Performance per SKU, then weighted average
```

---

## Batch Manufacturing

**What it is:** Production in defined batches following a recipe or process sequence. Each batch goes through phases (mixing, processing, packaging).

**Examples:** Pharmaceutical tablets, food production, chemical compounding, coatings

| Parameter | Value |
|-----------|-------|
| Typical OEE Range | 40-65% |
| Key Calculation Factor | Batch-level yield, setup dominance |
| Primary Losses | Setup/changeover (cleaning, validation), batch failures, recipe deviations |

### How to Calculate

- **Planned Production Time** includes batch setup (cleaning, validation, line clearance)
- **Run Time** = total time across all batches in the period
- **Quality** = batch yield (output within spec / theoretical output)
- Often calculated at the **batch level** first, then aggregated

### Pitfalls

- Setup/cleaning time can consume 30-50% of available time in pharma
- Batch failures are catastrophic — one failed batch = 100% quality loss for that batch
- "Minor stops" don't exist in the traditional sense — stops are either planned (phase transitions) or unplanned (equipment failure)
- Startup yield losses are often batch-related, not unit-related

```plaintext
Example (Pharma tablet line):
  Batch size: 100,000 tablets
  Setup time: 3 hours (cleaning + validation)
  Run time: 2 hours
  Good output: 95,000 tablets
  Quality = 95,000 / 100,000 = 95%
  (But the 5,000 reject tablets may be reworkable — track rework separately)
```

---

## Continuous / Process Manufacturing

**What it is:** Uninterrupted flow production where material moves continuously through the process. Measured in flow rate (tons/hour, liters/hour), not unit count.

**Examples:** Chemical plants, refineries, paper mills, cement, steel, glass

| Parameter | Value |
|-----------|-------|
| Typical OEE Range | 70-90% |
| Key Calculation Factor | Design throughput rate, rarely changes |
| Primary Losses | Equipment failure (major), reduced speed, off-spec product |

### How to Calculate

- **Ideal Cycle Time** becomes **Design Throughput Rate** (e.g., 50 tons/hour)
- **Performance** = actual throughput / design throughput
- **Quality** = on-spec output / total output (often measured by grade analysis)
- Setup/changeover is minimal — the process runs continuously until shutdown

### Pitfalls

- Design throughput may vary with raw material quality, ambient conditions
- "Reduced speed" is the dominant performance loss — often driven by upstream/downstream constraints
- Quality losses can be subtle (slightly off-spec product that is still sellable at lower grade)
- Scheduled turnarounds (maintenance shutdowns) are massive planned downtime events

```plaintext
Example (Chemical reactor):
  Design throughput: 100 tons/hour
  Actual throughput: 85 tons/hour (limited by upstream feed)
  On-spec product: 97% of output
  Performance = 85%, Quality = 97%
  If available 80% of scheduled time: OEE = 80% × 85% × 97% = 66%
```

---

## Assembly / Multi-Station Manufacturing

**What it is:** Sequential production lines where product flows through multiple workstations. The **bottleneck station** determines line output.

**Examples:** Automotive final assembly, electronics assembly lines, appliance assembly

| Parameter | Value |
|-----------|-------|
| Typical OEE Range | 55-80% |
| Key Calculation Factor | Bottleneck station drives line OEE |
| Primary Losses | Line imbalance, material flow disruption, station failures |

### How to Calculate

- **Line OEE ≠ average of station OEE** — this is a critical distinction
- Line Performance is determined by the **bottleneck station's** performance
- Line Availability = minimum of all station availabilities (a down station stops the line)
- See [[oee-hierarchy]] for the correct aggregation method

### Pitfalls

- Naively averaging station OEE produces misleading results
- Material flow issues between stations are neither equipment failure nor speed loss
- Buffer stations can mask individual station problems
- Line balancing affects Performance — an unbalanced line has artificial speed losses

```plaintext
Example (5-station assembly line):
  Station 1 OEE: 88%
  Station 2 OEE: 91%
  Station 3 OEE: 76% ← Bottleneck
  Station 4 OEE: 85%
  Station 5 OEE: 82%

  Naive average: 84.4% (misleading!)
  Actual line OEE: ~76% (bottleneck-constrained)
```

---

## HMLV (High-Mix, Low-Volume)

**What it is:** Production of many different products in small quantities. Frequent changeovers and high variant complexity.

**Examples:** Job shops, custom metal fabrication, specialty chemicals, contract manufacturing

| Parameter | Value |
|-----------|-------|
| Typical OEE Range | 35-60% |
| Key Calculation Factor | Setup dominance, variant complexity |
| Primary Losses | Setup/changeover (often >40% of time), material handling, engineering changes |

### How to Calculate

- Setup/changeover time is typically the dominant loss
- Performance comparison between products is difficult due to varying complexity
- **Focus on setup reduction** rather than OEE optimization on individual machines
- Consider grouping products by changeover similarity (family grouping)

### Pitfalls

- OEE will always be lower than high-volume lines — this is expected, not a failure
- Comparing HMLV OEE to dedicated line OEE is meaningless
- Changeover standardization is more important than OEE measurement
- Some "setup" activities (programming, first-article inspection) are genuinely necessary

```plaintext
Example (CNC job shop):
  Available time: 8 hours
  Changeover time: 3.5 hours (44% of time!)
  Run time: 4.5 hours
  Average batch size: 50 units
  Even with 95% Performance and 99% Quality:
  OEE = 56% × 95% × 99% = 53%
```

---

## Hybrid Manufacturing

**What it is:** Processes combining batch and continuous elements, or mixed discrete/batch within a single facility.

**Examples:** Beverage production (continuous mixing → batch bottling), automotive (continuous stamping → batch paint → continuous assembly), food (continuous cooking → batch packaging)

| Parameter | Value |
|-----------|-------|
| Typical OEE Range | 45-75% (varies by segment) |
| Key Calculation Factor | Segment-specific calculation |
| Primary Losses | Transition losses between segments, segment-specific dominant losses |

### How to Calculate

- **Calculate OEE per segment**, not for the whole facility
- Each segment may use different formulas (batch yield vs. unit count vs. flow rate)
- Aggregate using [[oee-hierarchy]] constraint-based method

---

## Industry-Specific Notes

### Automotive

- Final assembly: Assembly/Multi-Station type, bottleneck-driven
- Stamping: Discrete with very short cycle times (seconds)
- Paint shop: Batch-like (color changeovers are major setup events)
- **Benchmark:** World-class automotive plants achieve 80-85% OEE
- **Key focus:** Line balancing, material flow, changeover reduction

### Pharmaceutical

- Tablet manufacturing: Classic batch with validation-driven setup
- Packaging: Discrete with frequent changeovers (different SKUs)
- **Benchmark:** 40-60% is common; >70% is excellent
- **Key focus:** Cleaning validation time reduction, batch failure prevention
- **Regulatory note:** GMP constraints may prevent certain OEE optimizations

### Food & Beverage

- Continuous processes (brewing, dairy) with batch packaging
- Cleaning/sanitation between products is mandatory (similar to pharma validation)
- Seasonal demand creates variable planned production time
- **Benchmark:** 50-70% depending on process type
- **Key focus:** Cleaning time reduction, changeover standardization

### Chemical / Process

- Continuous processes with occasional batch campaigns
- Grade changes are analogous to changeovers
- Safety constraints limit speed optimization
- **Benchmark:** 70-85% (continuous processes tend higher)
- **Key focus:** Throughput optimization, off-spec reduction

### Electronics

- Surface Mount Technology (SMT): Discrete with very short cycle times
- Component placement: High-speed discrete (0.05 sec/component)
- Testing: Often the bottleneck (not the placement machines)
- **Benchmark:** 70-85% for SMT lines
- **Key focus:** Nozzle/feeder maintenance, component changeover, defect reduction

---

## Decision Guide: What Type Am I?

```
Is your output countable individual units?
├── YES → Do you produce many different products in small quantities?
│         ├── YES → HMLV
│         └── NO  → Discrete (or Assembly if multi-station)
└── NO  → Is it a continuous flow (tons/hour, liters/hour)?
          ├── YES → Continuous/Process
          └── NO  → Is it recipe-based with defined batch sizes?
                    ├── YES → Batch
                    └── NO  → Hybrid (analyze by segment)
```

## Related Pages

- [[oee-calculation]] — Base OEE formulas and the time waterfall
- [[oee-concept]] — What OEE means and how to interpret it
- [[oee-mistakes-and-hidden-factory]] — Common errors in OEE calculation
- [[oee-hierarchy]] — How to aggregate OEE across stations and lines
- [[oee-improvement]] — Improvement strategies by manufacturing type
