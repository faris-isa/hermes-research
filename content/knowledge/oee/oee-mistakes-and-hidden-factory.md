---
title: "Common Mistakes and Hidden Factory"
description: "The Hidden Factory concept, the Six Big Losses framework, and the most common OEE calculation errors."
date: 2025-05-29
tags:
  - oee
  - hidden-factory
  - six-big-losses
  - mistakes
  - losses
  - tpm
---

# Common Mistakes and Hidden Factory

## The Hidden Factory

The **Hidden Factory** concept was introduced by **Armand Feigenbaum** in the 1950s. It refers to the untapped capacity that already exists in your equipment — capacity you can unlock *without capital investment*.

Most manufacturers operate at 40-60% OEE. The remaining 40-60% is the Hidden Factory — wasted time, speed, and quality that represents a massive improvement opportunity hiding in plain sight.

### The Formula

$$
\text{Fully Productive Time} = \text{Good Count} \times \text{Ideal Cycle Time}
$$

$$
\text{Hidden Factory} = \text{Planned Production Time} - \text{Fully Productive Time}
$$

**Example:**

- Planned Production Time: 28,800 sec (8 hours)
- Good Count: 18,000 units
- Ideal Cycle Time: 1.0 sec/unit
- Fully Productive Time: 18,000 sec
- Hidden Factory: 28,800 - 18,000 = **10,800 sec (37.5%)**

That 37.5% is capacity you're *paying for* but not using. No new equipment needed — just stop wasting what you have.

### The Four Loss Zones

The Hidden Factory decomposes into four zones mapped to [[oee-calculation|OEE factors]]:

```
Planned Production Time (100%)
│
├── Zone 1: Availability Loss ──── Equipment Failure + Setup/Adjustment
│
├── Zone 2: Performance Loss ──── Idling/Minor Stops + Reduced Speed
│
├── Zone 3: Quality Loss ──────── Process Defects + Reduced Yield
│
└── Zone 4: Fully Productive ──── The "visible factory"
```

Each zone maps to the Six Big Losses below.

---

## The Six Big Losses

The TPM framework identifies six categories of loss that erode OEE. Understanding these is essential for targeted improvement.

### Availability Losses

#### 1. Equipment Failure (Breakdown)

**What it is:** Any unplanned stop lasting **>2 minutes** that halts production.

**Examples:**
- Mechanical failure (bearing, gearbox, drive)
- Electrical fault (sensor failure, PLC error)
- Tool breakage
- Material jam causing extended stop

**How to distinguish from Minor Stops:** The 2-minute threshold is the standard dividing line. If an operator can resolve the issue within 2 minutes without calling maintenance, it's a minor stop. If maintenance must be called or the fix takes >2 minutes, it's a failure.

**Typical impact:** 5-20% availability loss in most plants

**Key metric:** Mean Time Between Failures (MTBF), Mean Time To Repair (MTTR)

---

#### 2. Setup and Adjustment

**What it is:** Time lost when changing over from one product to another, or adjusting the machine after setup.

**Examples:**
- Die/mold changes
- Changeover between SKUs
- First-article inspection and adjustment
- Tooling changes
- Recipe loading and validation

**How to distinguish from Equipment Failure:** Setup is *planned* (you know it's coming) but the time it consumes is still an availability loss. Equipment Failure is *unplanned*.

**Typical impact:** 10-30% availability loss (dominant in batch and HMLV environments)

**Key improvement tool:** [[oee-improvement#smed|SMED]] (Single-Minute Exchange of Die) — convert internal setup to external setup to reduce changeover time.

**Distinction rules:**
- Standard setup time = planned, acceptable
- Extended setup (exceeding standard) = loss, must be tracked
- Adjustments after setup to get first good part = part of setup loss

---

### Performance Losses

#### 3. Idling and Minor Stops

**What it is:** Short stops lasting **≤2 minutes** that don't require maintenance intervention.

**Examples:**
- Sensor trips (false positive)
- Material misfeed (operator clears in seconds)
- jams that operators clear quickly
- Waiting for material (upstream starved)
- Operator pauses (brief hesitation, adjustment)

**How to distinguish from Equipment Failure:** Duration is the primary discriminator. ≤2 minutes = minor stop. >2 minutes = failure. Also, minor stops are resolved by the *operator*, not maintenance.

**How to distinguish from Reduced Speed:** Minor stops are *binary* — the machine is either running or stopped. Reduced Speed means the machine is running but producing below design rate.

**Typical impact:** 5-15% performance loss

**Key insight:** Minor stops are the *most underreported* loss category because they're short and operators often don't log them. Automated data collection is essential. See [[data-collection]].

---

#### 4. Reduced Speed (Slow Cycles)

**What it is:** The machine runs but produces below the ideal (design) cycle time.

**Examples:**
- Operator running slower than design speed for safety
- Worn tooling causing slower feed rates
- Material variation requiring speed reduction
- Equipment degradation (bearings wearing, motors aging)
- Software throttling (new firmware limiting speed)

**How to distinguish from Minor Stops:** The machine is *running continuously* but each unit takes longer than the ideal cycle time.

**Typical impact:** 5-20% performance loss

**Key rule:** Always use **design speed** (not historical average) as your ideal cycle time. See [[oee-calculation#performance--100|Performance > 100%]] for what happens when this rule is violated.

---

### Quality Losses

#### 5. Process Defects (Scrap)

**What it is:** Units produced during stable production that don't meet quality specifications.

**Examples:**
- Dimensional out of tolerance
- Cosmetic defects (scratches, discoloration)
- Functional test failures
- Wrong label/wrong part
- Weld defects, solder bridges

**How to distinguish from Reduced Yield:** Process Defects occur during *stable, steady-state* production. Reduced Yield occurs during *startup* or after interruptions.

**Typical impact:** 1-10% quality loss

**Key improvement tools:** [[oee-improvement#poka-yoke|Poka-Yoke]] (error-proofing) — design the process so defects cannot be produced.

---

#### 6. Reduced Yield (Startup Losses)

**What it is:** Defects and material waste during startup, warm-up, or after any interruption (changeover, breakdown, planned stop).

**Examples:**
- First-off parts after changeover that are out of spec
- Warm-up waste (material purged during startup)
- Calibration rejects
- First batch after cleaning that doesn't meet spec

**How to distinguish from Process Defects:** Reduced Yield is *time-bound* — it happens specifically during startup/transient phases. Process Defects happen during steady-state production.

**Typical impact:** 1-5% quality loss (higher in batch processes)

**Key insight:** Many plants "hide" startup losses by not counting the first N units. This inflates Quality and understates the real loss. Count everything.

---

## Summary Table: Six Big Losses

| # | Loss | OEE Factor | Duration Threshold | Typical Range | Improvement Tool |
|---|------|-----------|-------------------|---------------|-----------------|
| 1 | Equipment Failure | Availability | >2 min, unplanned | 5-20% | [[oee-improvement#tpm\|TPM]] |
| 2 | Setup & Adjustment | Availability | Planned, variable | 10-30% | [[oee-improvement#smed\|SMED]] |
| 3 | Idling & Minor Stops | Performance | ≤2 min, operator-fixed | 5-15% | [[data-collection\|Automated data]] |
| 4 | Reduced Speed | Performance | Continuous, below design | 5-20% | Root cause analysis |
| 5 | Process Defects | Quality | Steady-state rejects | 1-10% | [[oee-improvement#poka-yoke\|Poka-Yoke]] |
| 6 | Reduced Yield | Quality | Startup/transient rejects | 1-5% | Standardized startup |

---

## Common Calculation Mistakes

### 1. Misclassifying Stops as Planned

**The problem:** Treating unplanned downtime as "planned" to protect the OEE score.

**Example:** "We had a breakdown at 2pm but the shift was ending anyway, so we logged it as planned downtime."

**Why it's wrong:** It inflates Availability, hides equipment reliability problems, and prevents root cause analysis.

**Rule:** If it wasn't in the production schedule before the shift started, it's unplanned. Period.

---

### 2. Excluding Operators from the Equation

**The problem:** Setting up OEE tracking without considering operator behavior.

**Example:** Machine is idle for 15 minutes because the operator is on break, but this isn't captured as downtime.

**Why it's wrong:** Operator-caused downtime is real downtime. If the machine can't run without an operator, operator absence is an availability loss.

**Rule:** Define your Planned Production Time clearly — does it include or exclude breaks, shift changes, meals? Be consistent.

---

### 3. Using Standard Speed Instead of Design Speed

**The problem:** Setting Ideal Cycle Time to "standard" (what we usually achieve) instead of "design" (what the machine is capable of).

**Example:** Machine rated for 100 units/hour but "standard" is 80 units/hour. Using 80 makes Performance look like 100% when it's really 80%.

**Why it's wrong:** It masks performance losses and makes improvement invisible. If you think you're already at 100% Performance, why would you investigate slow cycles?

**Rule:** Use **design speed from OEM specifications**. See [[oee-calculation#performance--100]].

---

### 4. Insufficient Data Collection

**The problem:** Sampling rather than continuous measurement, or relying on operator self-reporting.

**Example:** "The operator writes down stop reasons on a clipboard at the end of the shift."

**Why it's wrong:** Human memory is unreliable. Short stops are forgotten. Reasons are guessed. Data quality is poor.

**Rule:** Automate data collection. See [[data-collection]] for implementation guidance. If you must use manual data, implement structured reason codes with mandatory fields.

---

### 5. Focusing Only on the OEE Score

**The problem:** Tracking only the composite OEE number without decomposing into A, P, Q.

**Example:** "OEE is 72%. Let's aim for 75% next month." Without knowing whether the problem is downtime, speed, or defects.

**Why it's wrong:** You can't improve what you can't measure specifically. A 3-point improvement in Quality requires completely different actions than a 3-point improvement in Availability.

**Rule:** Always report A, P, Q alongside OEE. [[oee-concept#the-three-factors|Decompose before acting]].

---

### 6. Assuming 100% Quality

**The problem:** Not measuring quality losses because "everything we ship is good."

**Example:** "We don't have rejects — we just rework everything that fails."

**Why it's wrong:** Reworked units still consume run time. The rework time should be counted as a performance loss (or quality loss if tracked as additional cycle time). If 20% of units need rework, Quality is not 100%.

**Rule:** Quality = Good Count (first-pass, no rework) / Total Count. Rework is a loss, not free.

---

### 7. Performance > 100% Without Investigation

**The problem:** Accepting Performance > 100% as "the machine is running great."

**Why it's wrong:** Performance > 100% means your Ideal Cycle Time is wrong. The machine is running faster than you think it should — which means either your baseline is incorrect, or someone has overridden safety/design parameters.

**Rule:** If Performance > 100%, validate the Ideal Cycle Time against OEM specs. See [[oee-calculation#performance--100]].

---

### 8. Setting One OEE Target for All Lines

**The problem:** "Every line must hit 80% OEE."

**Why it's wrong:** Different lines have different products, complexities, changeover frequencies, and equipment ages. A 35-variant HMLV line cannot and should not be measured against a single-product dedicated line.

**Rule:** Set targets based on each line's specific context, loss profile, and improvement potential. Use [[oee-manufacturing-types]] to understand what's realistic for your manufacturing type.

---

## Related Pages

- [[oee-calculation]] — The correct OEE formulas and time waterfall
- [[oee-concept]] — What OEE means and how to interpret it
- [[oee-improvement]] — How to reduce the six big losses
- [[oee-manufacturing-types]] — How losses vary by manufacturing type
- [[oee-hierarchy]] — Why averaging OEE across lines is dangerous
