---
title: "OEE Improvement Strategies"
description: "TPM, SMED, Poka-Yoke, and why the OEE Drop happens when you switch to automatic measurement."
tags:
  - oee
  - improvement
  - tpm
  - smed
  - manufacturing
---

# OEE Improvement Strategies

Once you know where the losses are (from [[Common Mistakes and Hidden Factory|Six Big Losses]]), here's how to attack them.

## Strategy Matrix

| Strategy | Target Loss | Key Concept |
|----------|-------------|-------------|
| **TPM** | Equipment Failure | Autonomous + planned maintenance, operator ownership |
| **SMED** | Setup & Adjustment | Convert internal to external setup, reduce changeover time |
| **Error-Proofing (Poka-Yoke)** | Process Defects | Prevent defects at source |
| **Standardized Work** | Reduced Yield / Defects | Consistent startup procedures, reduce variability |
| **Automated Data Collection** | All (accuracy) | Eliminate manual entry errors, real-time visibility |
| **Operator Engagement** | All (culture) | Frontline knowledge drives accurate data + improvements |
| **Root Cause Analysis** | All | Don't treat symptoms — find and fix root causes |

---

## TPM (Total Productive Maintenance)

Targets **Equipment Failure** — the #1 availability loss.

**Eight Pillars:**
1. **Autonomous Maintenance** — operators maintain their own equipment
2. **Planned Maintenance** — scheduled preventive maintenance
3. **Quality Maintenance** — prevent quality defects at source
4. **Focused Improvement** — small cross-functional teams tackling chronic losses
5. **Early Equipment Management** — design for maintainability
6. **Training & Education** — build skills at all levels
7. **Safety, Health, Environment** — zero accidents
8. **Office TPM** — support functions improve too

**Key insight:** TPM shifts maintenance from "maintenance department's job" to "everyone's job."

---

## SMED (Single-Minute Exchange of Die)

Targets **Setup & Adjustment** — the second availability loss.

**Four Steps:**
1. **Separate** internal (machine stopped) from external (machine running) setup
2. **Convert** internal setup to external
3. **Streamline** all setup activities
4. **Standardize** the new procedure

> The goal is "single-digit" changeover — under 10 minutes.

**Common result:** 50–75% reduction in changeover time.

---

## Error-Proofing (Poka-Yoke)

Targets **Process Defects**.

**Three Levels:**
1. **Prevention** — make it impossible to make the error (best)
2. **Detection** — make the error immediately visible
3. **Mitigation** — reduce the impact of the error

**Examples:**
- Asymmetric connectors (can't plug in wrong way)
- Sensors that reject parts before they move downstream
- Software that blocks next step if required fields are empty

---

## Standardized Work

Targets **Reduced Yield** and **Process Defects**.

- Document the current best-known method
- Train everyone to follow it consistently
- Measure compliance before measuring OEE impact
- Update when improvements are proven

---

## The OEE Drop (Manual → Automatic)

> **Critical warning:** When switching from manual Excel tracking to automatic measurement, OEE typically **drops 15–20 percentage points** in the first 1–2 weeks.

This is NOT worse performance. It's accurate measurement revealing real losses that were previously invisible.

**Rules:**
- Measure automatically for **4+ weeks** before comparing to benchmarks
- Never compare newly measured automatic OEE to mixed manual/automatic benchmarks
- Your first real baseline WILL look worse. That is correct.

---

## Related

- [[Common Mistakes and Hidden Factory]] — what goes wrong and Six Big Losses
- [[OEE Calculation Methods]] — how to calculate correctly
- [[Manufacturing Types and Industry Implementation]] — how context changes the approach
