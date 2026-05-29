---
title: "OEE Concept and Interpretation"
description: "What OEE is, where it came from, the three factors, world-class targets, and why 85% is extremely ambitious."
tags:
  - oee
  - manufacturing
  - concept
  - nakajima
  - tpm
---

# OEE Concept and Interpretation

## Origin

**OEE** was developed by **Seiichi Nakajima** in the 1960s and popularized through **TPM (Total Productive Maintenance)**. In *Introduction to TPM* (1984), Nakajima documented that companies winning Japan's Distinguished Plant Prize for TPM had OEE **exceeding 85%** — and that became the world-class benchmark.

## What OEE Measures

OEE answers one question: **how close is your factory to perfect production?**

Perfect production = producing only good parts, as fast as possible, with no downtime.

```
OEE = Availability × Performance × Quality
```

| Factor | What It Measures | Question It Answers |
|--------|------------------|---------------------|
| **Availability** | Downtime losses — how much of planned time was actually running? | Is the machine running when it should be? |
| **Performance** | Speed losses — how fast is it running vs theoretical max? | Is it running at full speed? |
| **Quality** | Defect losses — what percentage of output is good? | Is everything produced correct? |

Each factor is a percentage (0–100%). Multiply them together for OEE.

## The Time Hierarchy

OEE is built on a time waterfall — each level subtracts a type of loss:

```
Calendar Time (24/7/365)
  → -Schedule Loss (shifts, weekends, no demand)
  = Planned Production Time
    → -Availability Loss (breakdowns, changeovers)
    = Run Time
      → -Performance Loss (slow cycles, micro-stops)
      = Net Run Time
        → -Quality Loss (defects, rework, startup rejects)
        = Fully Productive Time (= Good Output)
```

Understanding this waterfall is critical because **each level represents a different type of loss that requires a different improvement approach**.

## World-Class Targets

| Factor | Target | Origin |
|--------|--------|--------|
| Availability | 90% | Nakajima's TPM winners |
| Performance | 95% | Nakajima's TPM winners |
| Quality | 99.9% | Near-perfect quality |
| **OEE** | **85%** | 0.9 × 0.95 × 0.999 ≈ 0.85 |

### Why 85% Is Extremely Ambitious

The math reveals the challenge. Even achieving 90% in ALL three factors:

```
0.90 × 0.90 × 0.90 = 0.729 = 73% OEE
```

To reach 85%, you need to be excellent at everything simultaneously. This is why most manufacturers never get there.

### Real-World Benchmarks

From **Evocon** — data from 3,500+ machines across 50+ countries:

- Most manufacturing companies: **~55–60% OEE**
- More companies have OEE **below 45%** than above 85%
- Only **~3%** achieve true 85%+ (after correcting measurement errors)
- Manufacturer-set targets typically range from 36–60%

### Industry Ranges

| Industry | Typical | World-Class | Key Limiting Factor |
|----------|---------|-------------|---------------------|
| Automotive | 65–80% | ≥ 85% | Setup time, variant complexity |
| Pharma | 50–70% | ≥ 70% | GMP validation, cleaning, batch changeovers |
| Food & Beverage | 55–75% | ≥ 80% | Cleaning cycles, perishable materials |
| Plastics | 60–80% | ≥ 85% | Cycle time consistency, tool maintenance |
| Electronics | 55–75% | ≥ 80% | Manual intervention, test bottlenecks |
| Chemicals (continuous) | 70–85% | ≥ 90% | Off-spec production, unplanned shutdowns |

> **Warning:** These ranges are NOT directly comparable. Five factors make comparison unreliable: product mix, automation level, measurement definition, time frame, and manual vs automatic capture.

## Interpretation Rules

These are non-negotiable. Violate any of them and your OEE number is meaningless.

1. **Never look at OEE alone.** Always check A, P, Q individually. OEE can stay flat while one factor drops and another rises — masking real problems.

2. **Use design speed, not historical average, for Ideal Cycle Time.** Historical average places a false upper limit on improvement. If you use average speed, performance can never meaningfully improve.

3. **Performance > 100% means your Ideal Cycle Time is wrong.** A value over 100% inflates OEE and masks losses. Fix the cycle time, don't celebrate the number.

4. **Quality = First Pass Yield.** Reworked parts count as quality loss because they consume time and resources. If you only count scrap, you're hiding quality problems.

5. **Compare similar processes only.** A line making 10 products will have lower OEE than a single-product line due to changeover losses. This is expected and correct — don't penalize complexity.

6. **Targets should be stretch but achievable within 3–4 months.** Don't fixate on 85%. Focus on continuous, incremental improvement.

## The OEE Drop

> **Critical warning:** When switching from manual Excel tracking to automatic measurement, OEE typically **drops 15–20 percentage points** in the first 1–2 weeks.

This is NOT worse performance. It's accurate measurement revealing real losses (micro-stops, short downtimes, optimistic cycle times) that were previously invisible.

**Rules:**
- Measure automatically for **4+ weeks** before comparing to benchmarks
- Never compare newly measured automatic OEE to mixed manual/automatic benchmarks
- Your first real baseline WILL look worse. That is correct.

## Related

- [[OEE Calculation Methods]] — how to calculate each factor
- [[Common Mistakes and Hidden Factory]] — what goes wrong
- [[Manufacturing Types and Industry Implementation]] — how context changes everything
