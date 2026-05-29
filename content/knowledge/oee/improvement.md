---
title: "5. OEE Improvement"
description: "Strategies for improving OEE that follow from understanding the mistakes — TPM, SMED, error-proofing, TOC, data collection."
tags:
  - oee
  - manufacturing
  - improvement
  - tpm
  - smed
---

# 5. OEE Improvement

Improvement follows naturally from [[Mistakes and Hidden Factory|understanding the mistakes]]. Once you know *what* is going wrong, the strategies become obvious.

## Strategy Matrix

| Strategy | Target Loss | Key Concept |
|----------|-------------|-------------|
| **TPM** | Equipment Failure | Autonomous + planned maintenance, operator ownership |
| **SMED** | Setup & Adjustment | Convert internal setup to external, reduce changeover time |
| **Error-Proofing** | Process Defects | Prevent defects from occurring at source (Poka-Yoke) |
| **Standardized Work** | Reduced Yield / Defects | Consistent startup procedures, reduce variability |
| **Automated Data Collection** | All (accuracy) | Eliminate manual entry errors, real-time visibility |
| **Operator Engagement** | All (culture) | Frontline knowledge drives accurate data + improvements |
| **Root Cause Analysis** | All | Don't treat symptoms — find and fix root causes |

## TPM (Total Productive Maintenance)

TPM targets **Equipment Failure** — the #1 availability loss.

**Eight Pillars:**
1. Autonomous Maintenance — operators maintain their own equipment
2. Planned Maintenance — scheduled preventive maintenance
3. Quality Maintenance — prevent quality defects at source
4. Focused Improvement — small cross-functional teams tackling chronic losses
5. Early Equipment Management — design for maintainability
6. Training & Education — build skills at all levels
7. Safety, Health, Environment — zero accidents
8. Office TPM — support functions improve too

> **Key insight:** TPM shifts maintenance from "maintenance department's job" to "everyone's job." The operator who hears a strange noise and reports it immediately is doing TPM.

## SMED (Single-Minute Exchange of Die)

SMED targets **Setup & Adjustment** — the second availability loss.

**Four Steps:**
1. **Separate** internal (machine stopped) from external (machine running) setup
2. **Convert** internal setup to external
3. **Streamline** all setup activities
4. **Standardize** the new procedure

> The goal is "single-digit" changeover — under 10 minutes.

**Common result:** 50–90% reduction in changeover time. "30% to 60% of changeover time is hidden — and recoverable."

> *Source: Oxmaint — "SMED has helped factories slash setup times by 50% to 90%, turning multi-hour changeovers into sub-10-minute operations."

> **Developer note:** SMED data is gold for your system. Track which setup steps are internal vs external. Surface the conversion opportunity. A system that just records "changeover: 45 min" is useless. One that records "changeover: 45 min, of which 20 min could be external" is actionable.

## Error-Proofing (Poka-Yoke)

Poka-Yoke targets **Process Defects**.

**Three Levels:**
1. **Prevention** — make it impossible to make the error (best)
2. **Detection** — make the error immediately visible
3. **Mitigation** — reduce the impact of the error

**Examples:**
- Asymmetric connectors (can't plug in wrong way)
- Sensors that reject parts before they move downstream
- Software that blocks next step if required fields are empty

## Standardized Work

Targets **Reduced Yield** and **Process Defects**.

- Document the current best-known method
- Train everyone to follow it consistently
- Measure compliance before measuring OEE impact
- Update when improvements are proven

## Automated Data Collection

Improves **all OEE factors** by eliminating measurement error.

The [[Mistakes and Hidden Factory#The OEE Drop|"OEE Drop" effect]] proves how much is invisible with manual tracking. Automatic data collection is a prerequisite for any serious OEE improvement program.

### Data Collection Tiers

| Tier | Method | Accuracy | Cost | Real-time |
|------|--------|----------|------|-----------|
| 1 | Manual (clipboard) | ~60-70% of actual downtime captured | Low | No |
| 2 | Semi-digital (spreadsheets) | ~70-80% | Low | No |
| 3 | Automated (PLC/sensors) | ~95-99% | High | Yes |
| 4 | Computer Vision | ~97-99.5% detection accuracy | Medium | Yes |
| **Hybrid** | **PLC + operator input** | **~95-99%** | **Medium-High** | **Yes** |

> *Source: Oxmaint — "Manual systems typically capture only 60-70% of actual downtime." Computer vision achieves "97-99.5% detection accuracy" vs 60-80% for human inspectors.*

> **Developer opinion:** The hybrid approach wins. PLCs detect *what* happened. Operators explain *why*. A downtime event without a reason code is a debugging session waiting to happen. A reason code without event detection is a guess. You need both.

### For Developers: Data Collection Architecture

Your system needs:

1. **Event detection** — PLC signals, sensor thresholds, CV detection
2. **Reason classification** — operator-facing dropdown with predefined categories
3. **Timestamp correlation** — link events to reason codes within a time window
4. **Quality linkage** — connect quality events to batch/lot IDs
5. **CMMS integration** — downtime event → automatic work order

## OEE and Theory of Constraints (TOC)

**TOC** identifies the bottleneck limiting overall process performance. **OEE** measures effectiveness of a *specific* machine.

> *"Getting excellent OEE performance at bottleneck machines"* has significantly greater economic impact than merely reducing defects at non-bottleneck machines.

### The Five Focusing Steps

| TOC Step | OEE Application |
|----------|-----------------|
| 1. Identify the constraint | Measure OEE on all machines — lowest OEE = bottleneck |
| 2. Exploit the constraint | Maximize OEE at bottleneck (availability, performance, quality) |
| 3. Subordinate everything else | Non-bottleneck machines should support bottleneck schedule |
| 4. Elevate the constraint | If bottleneck OEE still limits throughput, invest in capacity |
| 5. Repeat | Find new bottleneck, restart cycle |

> **Key insight:** Improving OEE at non-bottleneck machines **does not increase throughput** — it only creates excess inventory. Focus OEE improvement efforts on the constraint first.

**Practical example:** A bottling line has 5 machines. Filler OEE = 72%, Labeler OEE = 89%, Capper OEE = 91%, Packer OEE = 85%, Palletizer OEE = 94%. The filler is the bottleneck. Improving the labeler from 89% to 95% does nothing for line throughput — parts just queue before the filler. Improving the filler from 72% to 80% increases total line output.

> **Developer note:** Your system should flag the bottleneck machine and prioritize its OEE dashboard. Don't treat all machines equally — the constraint matters more.

## Root Cause Analysis

Finding the mistake is step one. Understanding *why* it happens is where improvement lives.

### 5 Whys

Ask "why" repeatedly until you reach the root cause:

1. **Why did the machine stop?** → Bearing failed
2. **Why did the bearing fail?** → Insufficient lubrication
3. **Why was lubrication insufficient?** → Maintenance schedule missed
4. **Why was the schedule missed?** → No automated alerts
5. **Why no alerts?** → Maintenance tracking is manual

> **For developers:** Your downtime event model should support a `root_cause` field that links to a `root_cause_analysis` table. Track the chain of why's. It's the most valuable data you'll collect.

### Fishbone (Ishikawa) Diagram

Categorize potential causes:
- **Man:** Operator error, training gap, fatigue
- **Machine:** Wear, misalignment, calibration drift
- **Material:** Substandard inputs, lot variation, contamination
- **Method:** Wrong recipe, incorrect sequence, missing SOP
- **Measurement:** Sensor drift, incorrect thresholds, sampling gap
- **Environment:** Temperature, humidity, vibration

> **Developer note:** Map your downtime reason codes to these 6 categories. It lets you aggregate losses by root cause type, not just by specific event. "Machine" category losses might need a maintenance overhaul. "Man" losses might need training.

## Setting Targets

| Method | Description |
|--------|-------------|
| **TCB (Collective Best)** | Target = highest OEE recorded in baseline data |
| **AFSM (Aiming for Small Misses)** | Target achievable most days but not every day — focus on analyzing low days |

> *"Do not fixate on an absolute 85% target. Focus instead on continuous, incremental improvement."*

- Don't compare dissimilar processes
- Targets should be **stretch but achievable within 3–4 months**

**Concrete example of target setting:**
- Baseline OEE: 58% (after 4 weeks of automatic measurement)
- Best single shift: 72%
- TCB target: 72% (achievable, proven possible)
- AFSM target: 65% (most days should hit this)
- 85% target: Not realistic in the near term — focus on getting to 70% first

## Measuring Improvement Impact

After implementing a countermeasure, measure impact using these signals:

| Signal | What It Means |
|--------|---------------|
| OEE factor improved | Direct improvement in the targeted loss |
| OEE flat but loss reduced | Improvement offset by another loss (common) |
| OEE dropped after change | New problem introduced — investigate |
| OEE improved but output didn't | Bottleneck is elsewhere — check TOC |
| OEE improved on one shift only | Inconsistent implementation — training needed |

> **Developer opinion:** Your system should automatically detect these patterns and surface them. "OEE improved 5% on Line A but output didn't change — Line A is not the bottleneck" is an insight your system should generate, not something the user has to figure out.

## Related

- [[OEE — Overall Equipment Effectiveness]]
- [[Mistakes and Hidden Factory]]
- [[Calculation Methods]]
- [[Extended Metrics]]
