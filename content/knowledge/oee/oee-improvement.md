---
title: "OEE Improvement Strategies"
description: "Practical methodologies for improving OEE: TPM, SMED, Poka-Yoke, standardized work, automated data collection, and root cause analysis."
date: 2025-05-29
tags:
  - oee
  - improvement
  - tpm
  - smed
  - poka-yoke
  - standardized-work
  - root-cause-analysis
---

# OEE Improvement Strategies

Improving OEE is not about chasing a number — it's about systematically eliminating the losses identified in [[oee-mistakes-and-hidden-factory|The Six Big Losses]]. This page covers the proven methodologies for each type of loss.

## Improvement Methodology Overview

```
Identify Losses (OEE Data)
        │
        ▼
Classify (A / P / Q factor)
        │
        ▼
Select Methodology
        │
        ├── Availability Loss ──→ TPM + SMED
        ├── Performance Loss ───→ Standardized Work + Root Cause Analysis
        └── Quality Loss ──────→ Poka-Yoke + Standardized Work
```

**Rule:** Always fix the **largest loss first**. A 5-point improvement in Availability (from 70% to 75%) has more impact than a 1-point improvement in Quality (from 98% to 99%).

---

## TPM — Total Productive Maintenance

**Addresses:** Equipment Failure (Loss #1), some Performance losses

TPM is the foundational methodology for OEE improvement. It consists of two pillars:

### Autonomous Maintenance

Operators take ownership of their equipment's basic health:

- **Daily inspection:** Operators check oil levels, belt tension, sensor alignment, abnormal sounds/vibrations
- **Cleaning as inspection:** Cleaning reveals problems (leaks, wear, loose fasteners) that operators learn to identify
- **Lubrication:** Standardized lubrication schedules performed by operators
- **Tightening:** Torque checks on critical fasteners

**Key principle:** The operator is the first line of defense. They detect abnormal conditions *before* they become failures.

### Planned (Preventive) Maintenance

Maintenance team performs scheduled interventions based on time or usage:

- **Time-based:** Replace bearings every 6 months regardless of condition
- **Usage-based:** Replace belts every 10,000 cycles
- **Condition-based:** Replace when vibration analysis or oil analysis indicates degradation (most effective)

**Key metric:** MTBF (Mean Time Between Failures) should *increase* over time as TPM takes effect.

### Operator Ownership

Operators should be empowered and expected to:

- Stop the line when abnormal conditions are detected (Jidoka principle)
- Escalate issues before they become failures
- Participate in root cause analysis
- Suggest improvements based on daily interaction with the equipment

See [[data-collection]] for how to capture operator-reported data effectively.

---

## SMED — Single-Minute Exchange of Die

**Addresses:** Setup and Adjustment (Loss #2)

SMED was developed by **Shigeo Shingo** and is the primary methodology for reducing changeover time. The goal: convert internal setup (machine stopped) to external setup (machine running).

### The Four Steps

1. **Separate internal and external setup**
   - Internal: must be done with machine stopped (die change)
   - External: can be done while machine runs (pre-staging tools, preparing next die)

2. **Convert internal to external**
   - Pre-heat dies while current die is running
   - Pre-stage tools, materials, fixtures at the machine
   - Use quick-connect utilities (air, hydraulic, electrical)

3. **Streamline both internal and external**
   - Standardize die heights to eliminate adjustment
   - Use locating pins and guides for quick alignment
   - Eliminate trial runs through precision setup

4. **Document and standardize**
   - Create standardized changeover procedures
   - Target: changeover in ≤10 minutes (single-digit minutes)

### Example Impact

```
Before SMED:
  Internal setup: 45 minutes (machine stopped entire time)
  External setup: 0 minutes

After SMED:
  External setup: 20 minutes (done while machine runs)
  Internal setup: 8 minutes (machine stopped only for critical steps)
  Effective changeover loss: 8 minutes (vs. 45 minutes before)
```

This is particularly impactful in [[oee-manufacturing-types#batch|batch]] and [[oee-manufacturing-types#hmlv|HMLV]] environments where setup dominance is the primary availability loss.

---

## Poka-Yoke — Error-Proofing

**Addresses:** Process Defects (Loss #5), some Reduced Yield (Loss #6)

Poka-Yoke (developed by **Shigeo Shingo**) means designing the process so that errors are either impossible or immediately detected.

### Types of Poka-Yoke

| Type | Function | Example |
|------|----------|---------|
| **Prevention** | Make the error physically impossible | Part can only be inserted one way (asymmetric features) |
| **Detection** | Detect error immediately and stop/alert | Sensor detects missing component, line stops |
| **Warning** | Alert operator of potential error | Andon light, audible alarm when parameters drift |

### Implementation Examples

- **Fixture design:** Parts only fit in the correct orientation
- **Sequence verification:** Next operation cannot start until previous operation is confirmed complete
- **Count verification:** System tracks expected vs. actual component count
- **Parameter checking:** Torque, temperature, pressure verified automatically
- **Barcode scanning:** Part/product verified before processing

**Key principle:** Don't rely on human attention for quality. Design the system so defects *cannot reach the customer*.

---

## Standardized Work

**Addresses:** All six losses (foundational methodology)

Standardized work is the baseline against which all improvement is measured. Without it, you cannot identify abnormal conditions.

### Components

1. **Takt time:** The rate at which you *must* produce to meet demand
2. **Work sequence:** The exact order of operations
3. **Standard WIP:** The minimum inventory needed to keep the process flowing
4. **Quality checks:** Built into the work sequence, not separate

### Why It Matters for OEE

- **Availability:** Standardized setup procedures reduce changeover variation
- **Performance:** Operators following standard methods cycle consistently
- **Quality:** Standardized processes produce consistent results

Without standardized work, you're measuring *chaos* and calling it OEE.

---

## Automated Data Collection

**Addresses:** Data quality issues across all factors

See [[data-collection]] for detailed implementation guidance.

### Why Automate

| Manual Collection | Automated Collection |
|-------------------|---------------------|
| Operators forget short stops | Every stop is captured |
| Cycle times are estimated | Cycle times are measured |
| Reason codes are guessed | Machine state determines reason |
| Data is entered at shift end (recall bias) | Data is captured in real-time |
| OEE looks artificially high | OEE reflects reality |

### Minimum Automation

At minimum, automate:

- **Machine state detection:** Running / stopped (use PLC signals, current sensors, or vibration sensors)
- **Production counting:** Part counts via sensors, not manual tally
- **Downtime logging:** Automatic timestamp of stop/start events

---

## Operator Engagement

**Addresses:** All six losses (human factor)

Operators are your greatest source of improvement ideas. They interact with the equipment every day and know what's really happening.

### Best Practices

- **Daily team meetings:** Review OEE from previous shift, discuss losses
- **Suggestion system:** Structured process for operators to report issues and propose solutions
- **Visual management:** OEE dashboards visible on the shop floor
- **Cross-training:** Operators who understand multiple stations see systemic issues
- **Recognition:** Celebrate improvements driven by operator suggestions

---

## Root Cause Analysis

**Addresses:** All six losses (diagnostic methodology)

Don't treat symptoms. Find the root cause.

### The 5-Why Method

When a loss occurs, ask "Why?" at least five times:

```
Problem: Machine stopped for 30 minutes
  Why? → Bearing failed
  Why? → Insufficient lubrication
  Why? → Lubrication schedule not followed
  Why? → Operator didn't know the schedule
  Why? → No training on maintenance responsibilities

Root cause: Training gap → Solution: Implement TPM training program
```

### Other RCA Tools

- **Fishbone (Ishikawa) diagram:** Categorize potential causes (Machine, Method, Material, Man, Measurement, Environment)
- **Pareto analysis:** Focus on the vital few causes that drive most losses
- **Fault tree analysis:** Logical decomposition of failure modes

**Key principle:** The first answer is rarely the root cause. Keep digging.

---

## ⚠️ The OEE Drop Warning

When switching from **manual** to **automated** OEE measurement, expect OEE to **drop 15-20 points** in the first 1-2 weeks.

### This Is NOT Worse Performance

This is **accurate measurement**. Your previous OEE was artificially inflated because:

- Short stops weren't being recorded
- Cycle times were estimated, not measured
- Quality losses were underreported
- Downtime reasons were sanitized

The automated system sees *everything* — including the losses that were always there but invisible.

### Rules for Transition

1. **Measure automatically for 4+ weeks** before using the data for decisions
2. **Never compare** manual-era OEE to automated-era OEE
3. **Communicate** to leadership that the drop is a measurement improvement, not a performance decline
4. **Use the first 4 weeks** to calibrate and validate data accuracy
5. **Establish new baselines** after the system stabilizes

```plaintext
Week 1-2: OEE drops from 72% to 55% (automated measurement reveals true losses)
Week 3-4: OEE stabilizes around 55-58% (new baseline established)
Week 5+:  Improvement actions begin targeting identified losses
Month 3+: OEE climbs to 65%+ (real improvement, not measurement artifact)
```

---

## Improvement Prioritization Framework

| Priority | Loss | Method | Expected Impact |
|----------|------|--------|-----------------|
| 1 (Highest) | Largest loss by % time | Address first | Biggest OEE gain |
| 2 | Setup/changeover | [[#smed\|SMED]] | Rapid availability gain |
| 3 | Equipment failure | [[#tpm\|TPM]] | Sustained availability gain |
| 4 | Reduced speed | Root cause + standard work | Performance gain |
| 5 | Minor stops | Automated data + operator engagement | Performance gain |
| 6 | Defects/rework | [[#poka-yoke\|Poka-Yoke]] | Quality gain |

**Note:** Priorities 2-6 depend entirely on your specific loss profile. Always analyze your A, P, Q decomposition first.

---

## Related Pages

- [[oee-concept]] — What OEE means and how to interpret it
- [[oee-calculation]] — How to calculate OEE correctly
- [[oee-mistakes-and-hidden-factory]] — The six big losses in detail
- [[oee-manufacturing-types]] — How improvement varies by manufacturing type
- [[oee-extended-metrics]] — TEEP, OAE, OLE for broader context
- [[oee-hierarchy]] — Aggregating improvement across stations
