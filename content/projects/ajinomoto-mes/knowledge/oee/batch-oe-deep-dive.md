---
title: "Batch OEE Deep Dive"
description: "Detailed OEE calculation for batch manufacturing — formulas, pitfalls, phase timing, and aggregation methods."
tags:
  - oee
  - batch
  - manufacturing
---

# Batch OEE Deep Dive

## Batch OEE Formulas

### Basic
```
Batch Availability = runDuration / (runDuration + setupDuration)
Batch Performance  = idealDuration / runDuration
Batch Quality      = goodQuantity / quantity
Line/Factory OEE   = weighted average by batch duration or quantity
```

### Batch-Specific Metrics

| Metric | Formula | Purpose |
|--------|---------|---------|
| Batch Yield | `goodUnits / totalUnits` | Batch-level quality |
| Setup Efficiency | `externalSetupTime / totalSetupTime` | Setup optimization |
| Batch Cycle Time | `batchRunTime / batchQuantity` | Actual vs ideal per batch |
| Changeover Loss | `setupTime / (setupTime + runTime)` | Setup impact on OEE |

---

## Batch Phase Timing

Batch processes have distinct **recipe phases** (mixing, heating, cooling, filling) with idle time between phases.

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

> **Key Insight:** Shaving even a small amount of time from a phase results in more batches per day. Example: 10 batches/day at 144 min each → improve by 10 min → 10.7 batches/day → ~300 extra batches/year.

---

## Performance Calculation (The Tricky Part)

Performance is the hardest factor in batch OEE because batch size varies.

### Method 1: Ideal Duration (simpler)
```
Performance = idealDuration / runDuration
where idealDuration = (batchQuantity × idealCycleTimePerUnit)
```

### Method 2: Ideal Cycle Time × Total Count (standard)
```
Performance = (idealCycleTime × batchQuantity) / netRunTime
```

### Method 3: Phase-based (most accurate for complex recipes)
```
Performance = Σ(idealPhaseTime_i) / Σ(actualPhaseTime_i)
for each phase i in the batch recipe
```

> **Critical:** Use **design speed / ideal cycle time** from the recipe or machine spec, NOT historical average.

---

## Aggregation (Per-Batch → Shift/Line/Plant)

**Weighted Average by Duration (recommended):**
```
Line OEE = Σ(batchOEE_i × batchDuration_i) / Σ(batchDuration_i)
```

**Weighted Average by Quantity:**
```
Line OEE = Σ(batchOEE_i × batchQuantity_i) / Σ(batchQuantity_i)
```

> **Never use simple average** of batch OEE scores — a 2-hour batch and a 30-minute batch should not have equal weight.

---

## Additional Batch Loss Categories

| Loss | Category | Example |
|------|----------|---------|
| Batch Changeover | Availability Loss | Recipe/formula change, CIP cleaning |
| Material Wait | Availability Loss | Waiting for ingredients/raw materials |
| Quality Hold | Availability Loss | Batch awaiting lab test results |
| Rework Batch | Quality Loss | Entire batch reprocessed |
| Batch Startup Reject | Quality Loss | First units of new batch |

---

## Batch OEE Waterfall

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
      = Value Added Time (Good Batch Output)
```

---

## Batch-Specific Pitfalls

1. **Measuring downstream idle equipment** — Apply [[Batch vs Continuous OEE#4. Assembly Line / Multi-Station|Theory of Constraints]]: measure OEE at the bottleneck only
2. **Wrong cycle time target** — Use historical best-performing batch as surrogate for ideal
3. **Ignoring phase-level breakdown** — Aggregated OEE doesn't reveal which phase is the bottleneck
4. **Overlapping downtime events** — Correctly attribute to avoid double-counting
5. **Quality timing lag** — Lab results may come hours after batch completion; hold time = availability loss
6. **Equipment dependency** — Measure the constraint, not every machine

---

## Real-World Results

- **Glanbia (food):** 10% OEE improvement in 6 weeks, +0.4–1.4% yield, −8% energy
- **Chemical manufacturer:** Eliminated idle time between phases, 300 extra batches/year from 10-min improvement ($20K–$50K/batch value)
- **Pharma tablet press:** Phase-level monitoring identified ejection arm lubrication as root cause for 9.4% OEE drop

---

## Prerequisites (Implementation Checklist)

1. **Trigger points:** Batch start, phase transitions, micro-stops, batch end
2. **Cycle time targets:** Defined per recipe/product
3. **Transition tracking:** Internal vs external setup, cleaning (CIP)
4. **Quality data source:** Inline checks + offline lab results, linked to batch ID
5. **Data management:** Source data from batch management system (BMS)

---

## Related
- [[OEE — Overall Equipment Effectiveness]]
- [[Batch vs Continuous OEE]]
- [[Six Big Losses]]
- [[OEE Improvement Strategies]]
