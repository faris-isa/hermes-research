---
title: "4. Batch Phase Tracking"
description: "Deep dive into batch OEE calculation — what phases are, why they matter, how performance is calculated, and how to aggregate across batches."
tags:
  - oee
  - batch
  - manufacturing
  - phases
---

# Batch Phase Tracking — Understanding the Concept

Batch OEE is fundamentally different from continuous OEE. The difference isn't just in the formulas — it's in **how you think about time**.

In continuous production, a machine is either running or stopped. In batch production, a machine goes through **distinct phases**, each with its own purpose, duration, and failure modes. Understanding this distinction is the key to calculating batch OEE correctly.

## 1. What Is a Batch Phase?

A **batch phase** is a distinct stage in the production of a batch, defined by a specific operation. Each phase has:

- **Start trigger** — an event that begins the phase (e.g., "temperature reached 80°C")
- **End trigger** — an event that ends the phase (e.g., "mixing complete signal")
- **Ideal duration** — how long it SHOULD take (from recipe/machine spec)
- **Actual duration** — how long it DID take

> **Key insight:** A batch doesn't just "run" — it progresses through a sequence of phases. Each phase is a separate measurement point for OEE.

### Real-World Example: Seasoning Production

Consider a batch of 500g seasoning packets:

```
Batch Timeline:
├── Setup/Changeover (CIP, recipe change, cleaning)     [20 min]
├── Phase 1: Loading/Charging                            [15 min ideal]
│   └── Idle: waiting for raw materials                  [5 min — material delay]
├── Phase 2: Mixing                                      [30 min ideal]
│   └── Idle: transition to heating                      [3 min — equipment handoff]
├── Phase 3: Heating/Drying                              [45 min ideal]
│   └── Idle: waiting for temp sensor                    [2 min — sensor lag]
├── Phase 4: Cooling                                     [20 min ideal]
│   └── Idle: transition to filling                      [4 min — line changeover]
├── Phase 5: Filling/Packaging                           [25 min ideal]
│   └── Quality Hold: waiting for lab results            [30 min — lab wait]
└── Phase 6: Discharge/Transfer                          [10 min ideal]
```

**Total batch time:** 190 minutes
**Actual production time:** 145 minutes
**Idle + hold time:** 45 minutes

> The **idle time between phases** and the **quality hold** are where OEE losses hide. In continuous production, these would just be "downtime." In batch, they're **specific, measurable, and actionable**.

## 2. Line, Machine, and SKU — The Batch Architecture

This is the most important architectural difference between batch and continuous production. Understanding it changes how you design your data model and calculate OEE.

### Continuous vs. Batch: How Lines Work

**Continuous production:**
```
Line 1 → runs Product A → 24/7 → rarely changes
Line 2 → runs Product B → 24/7 → rarely changes
```
- One line = one product for long periods
- Changeover is rare and costly (planned shutdown)
- OEE is measured per line, per shift

**Batch production:**
```
Line 1 → dedicated to SKU-X → runs batches of SKU-X all day
Line 2 → dedicated to SKU-Y → runs batches of SKU-Y all day
Line 3 → dedicated to SKU-Z → runs batches of SKU-Z all day
```
- One line = one SKU (or narrow SKU family)
- Each line has its own recipe, its own ideal times, its own OEE
- Changeover on a line is **batch-to-batch** (CIP clean between batches of the same SKU), not **SKU-to-SKU**

> **Key insight:** In batch manufacturing, the **line IS the SKU**. When you ask "which line does SKU-X run on?" the answer is deterministic — it always runs on the same line. This is fundamentally different from continuous, where a line can switch products (with a big changeover).

### Machine vs. Line — They're Not the Same Thing

A **machine** is a single piece of equipment:
- A mixer
- A filler
- A packer
- A dryer

A **line** is a sequence of machines working together:
```
Line A = Mixer → Heating Tank → Cooler → Filler → Packer
Line B = Mixer → Reactor → Separator → Filler → Packer
```

In batch production:
- **One line = multiple machines in sequence**
- **One machine CAN serve multiple lines** (e.g., a shared mixer feeding both Line A and Line B)
- **OEE is measured per line** (per SKU), not per individual machine

> **Why this matters:** If you measure OEE per machine, you'll get misleading results. A shared mixer might show low OEE because it's idle when Line B is running — but that's expected behavior, not a loss. Measure at the **bottleneck of the line**, which is the constraint.

### The SKU → Line → Machine Hierarchy

```
Plant
├── Line A (SKU-X)
│   ├── Machine 1: Mixer
│   ├── Machine 2: Heating Tank
│   ├── Machine 3: Cooler
│   └── Machine 4: Filler
├── Line B (SKU-Y)
│   ├── Machine 1: Mixer (shared with Line A)
│   ├── Machine 5: Reactor
│   ├── Machine 6: Separator
│   └── Machine 4: Filler (shared with Line A)
└── Line C (SKU-Z)
    ├── Machine 7: Blender
    ├── Machine 8: Dryer
    └── Machine 4: Filler (shared with Line A)
```

Notice:
- **Machine 4 (Filler)** is shared across all three lines
- **Machine 1 (Mixer)** is shared between Line A and Line B
- Each line has its own dedicated machines AND some shared machines
- The **SKU determines which line** it runs on
- The **line determines which machines** are in the sequence

### Data Model Implications

```sql
-- Lines are SKU-dedicated
CREATE TABLE production_line (
  line_id     TEXT PRIMARY KEY,
  sku_id      TEXT NOT NULL,        -- one line = one SKU (typically)
  recipe_id   TEXT NOT NULL,        -- recipe for this SKU
  status      TEXT                  -- 'active', 'maintenance', 'idle'
);

-- Machines belong to lines (can be shared)
CREATE TABLE line_machine (
  line_id     TEXT,
  machine_id  TEXT,
  sequence_order INTEGER,           -- position in the line (1, 2, 3...)
  is_bottleneck  BOOLEAN,           -- OEE measured here
  PRIMARY KEY (line_id, machine_id)
);

-- Batches are tied to a line (and therefore to a SKU)
CREATE TABLE batch (
  batch_id    TEXT PRIMARY KEY,
  line_id     TEXT NOT NULL,         -- determines SKU
  sku_id      TEXT NOT NULL,         -- redundant but useful for queries
  recipe_id   TEXT NOT NULL,
  start_time  TIMESTAMPTZ,
  end_time    TIMESTAMPTZ
);
```

> **Critical design decision:** In batch, `line_id` and `sku_id` are effectively 1:1. You can derive one from the other. Store both for query convenience, but treat the line as the primary grouping for OEE calculation.

### What This Means for OEE Calculation

1. **OEE is per line, not per machine.** A line's OEE reflects the entire production sequence for that SKU.

2. **The bottleneck determines line OEE.** If the filler (Machine 4) is the slowest machine on Line A, then Line A's OEE is constrained by the filler's speed — even if the mixer is fast.

3. **Shared machines create dependencies.** If Machine 4 is busy with Line B, Line A has to wait. This is an **availability loss** for Line A — but it's a **scheduling problem**, not a machine problem.

4. **Changeover in batch is batch-to-batch, not SKU-to-SKU.** Since each line is dedicated to a SKU, the changeover between batches is CIP cleaning (same product, clean between batches). There's no "switch from SKU-X to SKU-Y" changeover on a dedicated line.

5. **SKU-level OEE comparison is valid.** Since each line = one SKU, you can compare SKU-X OEE vs SKU-Y OEE directly — they're on different lines with different equipment configurations.

### Real-World Example: Ajinomoto Seasoning Plant

```
Plant: Seasoning Production
├── Line 1: 500g seasoning packets (SKU-A)
│   ├── Mixer → Heating → Cooling → Filler → Packer
│   └── OEE measured at Filler (bottleneck)
├── Line 2: 1kg seasoning packets (SKU-B)
│   ├── Mixer → Heating → Cooling → Filler → Packer
│   └── OEE measured at Filler (bottleneck)
└── Line 3: Seasoning sachets (SKU-C)
    ├── Blender → Dryer → Filler → Packer
    └── OEE measured at Dryer (bottleneck)
```

- Line 1 and Line 2 share the same equipment type but are **physically separate lines**
- Line 3 has completely different equipment
- Each line's OEE is independent — Line 1's downtime doesn't affect Line 2
- The plant-level OEE is a **weighted average** of all line OEEs

> **Key takeaway:** In batch OEE, always ask: "Which line? Which SKU?" They're the same question. The line IS the SKU's home.

## 3. Why Phases Matter for OEE

The critical insight: **Performance calculation in batch requires knowing which phase you're in.**

### The Aggregation Trap

Consider this scenario:

| Phase | Ideal Duration | Actual Duration |
|-------|---------------|-----------------|
| Heating | 45 min | 55 min |
| Filling | 25 min | 20 min |

If you only look at **total batch time**: 55+20 = 75 min actual vs 45+25 = 70 min ideal. Looks like only 5 minutes of loss.

But **per-phase performance** tells a different story:

- **Heating:** 45/55 = **81.8% performance** ← problem!
- **Filling:** 25/20 = **125% performance** ← impossible — wrong ideal time

> **Phase-level performance reveals root causes.** Aggregated batch OEE hides them. A value over 100% indicates the Ideal Cycle Time is set too high — a calibration issue, not a performance win.

### Analogy: Cooking a Multi-Course Meal

Think of batch phases like cooking a Thanksgiving dinner:

- **Phase 1:** Prep vegetables (chopping, peeling)
- **Phase 2:** Roast turkey (long, single operation)
- **Phase 3:** Make gravy (depends on turkey drippings)
- **Phase 4:** Plate and serve

Each phase has a **different ideal time**, a **different skill requirement**, and **different failure modes** (burnt turkey vs. lumpy gravy). You can't optimize the meal by just looking at "total cooking time" — you need to know which phase was slow.

## 4. The Batch OEE Waterfall

The standard OEE waterfall adapts for batch:

```mermaid
graph TD
    A["📋 Planned Production Time"] -->|"− Batch Changeover<br/>(CIP, recipe change)"| B["⚙️ Batch Run Time"]
    A -->|"− Material Wait"| B
    A -->|"− Quality Hold"| B
    B -->|"− Slow Phases<br/>(over ideal)"| C["⏱️ Net Run Time"]
    B -->|"− Phase Idle / Micro-stops"| C
    C -->|"− Startup Rejects"| D["✅ Value Added Time"]
    C -->|"− Process Defects"| D
    C -->|"− Rework Batch"| D
```

> **Key difference from continuous:** Batch adds **Batch Changeover**, **Material Wait**, and **Quality Hold** as formal loss categories. These are availability losses specific to batch production.

### Loss Categories Specific to Batch

| Loss | Category | Example |
|------|----------|---------|
| **Batch Changeover** | Availability Loss | Recipe/formula change, CIP cleaning |
| **Material Wait** | Availability Loss | Waiting for ingredients/raw materials |
| **Quality Hold** | Availability Loss | Batch awaiting lab test results |
| **Rework Batch** | Quality Loss | Entire batch reprocessed |
| **Batch Startup Reject** | Quality Loss | First units of new batch |

## 5. Batch OEE Formulas

### Basic Batch Formulas

```
Batch Availability = runDuration / (runDuration + setupDuration)
Batch Performance  = idealDuration / runDuration
Batch Quality      = goodQuantity / quantity
Batch OEE          = Availability × Performance × Quality
```

### Batch-Specific Metrics

| Metric | Formula | What It Tells You |
|--------|---------|-------------------|
| **Batch Yield** | `goodUnits / totalUnits` | How many units passed quality |
| **First Pass Yield** | `firstPassBatches / totalBatches` | No rework needed |
| **Setup Efficiency** | `externalSetup / totalSetup` | SMED effectiveness |
| **Changeover Time** | `endTime - startTime` | How long between batches |
| **Batch Cycle Time** | `runTime / batchQuantity` | Actual production rate per batch |

### Performance Calculation — The Tricky Part

Performance is the hardest factor in batch OEE because batch size varies. Three methods:

**Method 1: Ideal Duration (simpler)**
```
Performance = idealDuration / runDuration
where idealDuration = (batchQuantity × idealCycleTimePerUnit)
```

**Method 2: Ideal Cycle Time × Total Count (standard)**
```
Performance = (idealCycleTime × batchQuantity) / netRunTime
```

**Method 3: Phase-based (most accurate for complex recipes)**
```
Performance = Σ(idealPhaseTime_i) / Σ(actualPhaseTime_i)
for each phase i in the batch recipe
```

> **Critical:** Use **design speed / ideal cycle time** from the recipe or machine spec, NOT historical average. Using standard speed places a false upper limit on improvement.

## 6. Aggregation — Per-Batch to Shift/Line/Plant

Individual batch OEE scores must be aggregated to shift, line, or plant level. The method matters.

### Weighted Average by Duration (Recommended)

```
Line OEE = Σ(batchOEE_i × batchDuration_i) / Σ(batchDuration_i)
```

### Weighted Average by Quantity

```
Line OEE = Σ(batchOEE_i × batchQuantity_i) / Σ(batchQuantity_i)
```

> **Never use simple average** of batch OEE scores — a 2-hour batch and a 30-minute batch should not have equal weight.

### When to Use Which

| Situation | Method |
|-----------|--------|
| Comparing batches of same product | Weighted by duration |
| Capacity planning | Weighted by quantity |
| Revenue analysis | Weighted by batch value |

## 7. Batch-Specific Pitfalls

1. **Measuring downstream idle equipment** — Apply Theory of Constraints: measure OEE at the bottleneck only. Don't measure OEE on every idle downstream machine.

2. **Wrong cycle time target** — Use historical best-performing batch as surrogate for ideal when design specs are unavailable.

3. **Ignoring phase-level breakdown** — Aggregated batch OEE doesn't reveal WHICH phase is the bottleneck. Drill into phase durations to find root causes.

4. **Overlapping downtime events** — Batch processes often have simultaneous events (e.g., maintenance during quality hold). Correctly attribute each to avoid double-counting.

5. **Quality timing lag** — Lab results may come hours after batch completion. Quality hold time counts as availability loss until released.

6. **Batch startup reject scope** — Startup rejects occur AFTER EACH changeover, not just daily startup. In pharma with frequent recipe changes, this can be significant.

7. **Equipment dependency** — In batch lines, equipment A feeding B feeding C creates cascading idle time. Measure the constraint, not every machine.

## 8. Real-World Results

| Case | Result | Source |
|------|--------|--------|
| **Glanbia (food)** | 10% OEE improvement in 6 weeks, +0.4–1.4% yield, −8% energy | Industry case study |
| **Chemical manufacturer** | 300 extra batches/year from 10-min improvement per batch ($20K–$50K/batch value) | Seeq case study |
| **Pharma tablet press** | Phase-level monitoring identified ejection arm lubrication as root cause for 9.4% OEE drop | Industry case study |

> **Key insight:** Shaving even a small amount of time from a phase results in more batches per day. 10 batches/day at 144 min each → improve by 10 min → 10.7 batches/day → ~300 extra batches/year.

## 9. Glossary

| Term | Definition |
|------|------------|
| **Batch Phase** | A distinct stage in batch production, defined by a specific operation (mixing, heating, cooling, filling). Each has start/end triggers, ideal duration, and actual duration. |
| **Phase Transition** | The event marking the end of one phase and the beginning of the next. Detected from PLC signals, sensor thresholds, or operator input. |
| **Ideal Duration** | The time a phase SHOULD take, based on recipe specifications or machine design speed. |
| **Actual Duration** | The time a phase DID take, measured from phase start trigger to phase end trigger. |
| **Phase Idle** | Time between phases when the machine is not performing any productive operation. |
| **Batch Changeover** | Setup time between batches — includes CIP, recipe changes, equipment cleaning. |
| **Quality Hold** | Time when a completed batch is waiting for lab test results before being released. |
| **Startup Reject** | Defective units produced at the start of a new batch, before steady state. |
| **Recipe** | The set of instructions defining how to produce a batch — phase sequence, ideal durations, parameters, quality criteria. |
| **CIP (Clean-In-Place)** | Automated cleaning process between batches, common in food/pharma. |
| **First Pass Yield (FPY)** | Percentage of batches that pass quality inspection on the first attempt, without rework. |
| **Production Line** | In batch manufacturing, a dedicated sequence of equipment configured to produce a specific SKU or recipe. Each line is SKU-dedicated. |
| **SKU (Stock Keeping Unit)** | The unique identifier for a finished product variant. In batch OEE, the SKU determines which line it runs on, which recipe it follows, and which ideal cycle times apply. |
| **Line Dedication** | The principle that each batch production line is configured for a specific SKU — changeover is batch-to-batch (CIP), not SKU-to-SKU. |
| **Machine vs. Line** | A machine is a single piece of equipment. A line is a sequence of machines. OEE is measured per line (per SKU), not per machine. |

## Related

- [[OEE — Overall Equipment Effectiveness]] — The base formula and waterfall
- [[Manufacturing Types]] — How batch compares to discrete, continuous, HMLV
- [[Calculation Methods]] — Detailed calculation approaches
- [[Mistakes and Hidden Factory]] — Common errors and untapped capacity
- [[Improvement Strategies]] — What to do after finding the problems
