---
title: "Common OEE Mistakes"
description: "Pitfalls in OEE calculation and measurement that lead to misleading results."
tags:
  - oee
  - mistakes
  - manufacturing
---

# Common OEE Mistakes

These mistakes lead to misleading OEE numbers that don't reflect real performance.

## 1. Misclassifying Stops as "Planned"

Changeovers and setup are **availability losses**, not acceptable downtime. Classifying them as "planned" inflates OEE and hides improvement opportunities.

> Setup time is planned in the schedule — but it's still a loss that reduces [[OEE — Overall Equipment Effectiveness|OEE]].

## 2. Excluding Operators

Operators have the **deepest machine knowledge**. Excluding them from data collection and improvement efforts leads to:
- Poor data quality (guessing instead of measuring)
- No buy-in for improvement initiatives
- Missed root causes

## 3. Using Standard Speed Instead of Design Speed

Historical average speed places a **false upper limit** on improvement. If the machine was designed to run at 100 units/min but averages 80, using 80 as the target says "we can't improve."

**Always use design speed** (Ideal Cycle Time from spec) for [[OEE — Overall Equipment Effectiveness#The Formula|Performance calculations]].

## 4. Insufficient Data Collection

Manual/paper-based monitoring is error-prone. Common issues:
- Operators guess downtimes
- Minor stops go unrecorded
- Cycle times are rounded or estimated
- Quality data is batched, not real-time

**Solution:** [[OEE Improvement Strategies#Automated Data Collection|Automate data collection]] as a first step.

## 5. Focusing Only on OEE Score

Looking at the single OEE number without examining [[OEE — Overall Equipment Effectiveness#The Formula|A, P, Q individually]]:
- Two lines with same OEE can have completely different loss profiles
- Improvement actions depend on WHICH factor is weakest
- OEE can stay flat while one factor drops and another rises

## 6. Performance > 100%

Performance exceeding 100% means the **Ideal Cycle Time is set too high** (or design speed is wrong). This inflates OEE and masks real losses.

> If machines consistently run faster than spec, update the Ideal Cycle Time.

## 7. Assuming 100% Quality

Without real-time quality tracking, quality is often **guessed** — and usually guessed optimistically. Inline sensors and vision systems provide actual data.

## 8. Setting One Target for All Lines

Different products, complexities, and batch sizes produce different OEE profiles. A line making 10 products should naturally have lower OEE than a single-product line due to changeover losses — **this is expected and correct**.

## 5. Manual vs Automatic Measurement (Bonus)

> **The "OEE Drop"**: Switching from manual Excel tracking to automatic measurement typically **drops OEE 15–20 percentage points** in the first 1–2 weeks.

This is accurate measurement revealing real losses. See [[World-Class OEE and Benchmarks#The "OEE Drop" (Manual → Automatic)|The OEE Drop]] for details.

---

## Related
- [[OEE — Overall Equipment Effectiveness]]
- [[Six Big Losses]]
- [[OEE Improvement Strategies]]
