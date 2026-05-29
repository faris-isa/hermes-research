---
title: "Extended Metrics Beyond OEE"
description: "TEEP, OAE, OLE, and other metrics that extend OEE to capture organizational, calendar, and labor effectiveness."
date: 2025-05-29
tags:
  - oee
  - teep
  - oae
  - ole
  - metrics
  - extended
  - effectiveness
---

# Extended Metrics Beyond OEE

OEE measures **equipment effectiveness** during planned production time. But manufacturing efficiency involves more than just equipment — it includes scheduling, organizational losses, and human labor. This page covers the extended metrics that capture the bigger picture.

See [[oee-concept]] for OEE fundamentals and [[oee-calculation]] for calculation details.

---

## TEEP — Total Effective Equipment Performance

### What It Extends

OEE starts the clock at **Planned Production Time** — scheduled downtime (breaks, no orders, planned non-production shifts) is excluded. TEEP extends OEE to **Calendar Time** (24/7/365).

### Formula

$$
\text{TEEP} = \text{OEE} \times \text{Utilization}
$$

Where:

$$
\text{Utilization} = \frac{\text{Planned Production Time}}{\text{Calendar Time}}
$$

Or equivalently:

$$
\text{TEEP} = \text{Availability} \times \text{Performance} \times \text{Quality} \times \text{Utilization}
$$

### Example: The 85% Illusion

A plant reports 85% OEE — world-class! But let's examine the full picture:

```
Calendar Time:        24 hours/day × 365 days = 8,760 hours/year
Planned Production:   16 hours/day × 300 days = 4,800 hours/year
Planned Downtime:     8 hours/day (no night shift) + 65 days (weekends/holidays)
                      = 3,960 hours/year

Utilization:          4,800 / 8,760 = 54.8%

OEE:                  85% (world-class!)
TEEP:                 85% × 54.8% = 46.6%
```

**The "world-class" plant is only using 46.6% of its available calendar time.** The equipment is well-maintained and running efficiently — but it's only scheduled for 54.8% of the time.

### When to Use TEEP

- Comparing plants with different shift patterns
- Evaluating capacity expansion decisions ("should we add a shift?")
- Executive-level reporting on total asset utilization
- Identifying the gap between current capacity and theoretical maximum

### Key Insight

TEEP reveals the **capacity gap** — the difference between what you could produce (calendar time) and what you actually produce. This is critical for capital expenditure decisions: before buying new equipment, exhaust the TEEP gap first.

---

## OAE — Overall Asset Effectiveness

### What It Extends

OEE focuses on individual equipment. OAE extends to the **system level**, including organizational and planning losses that OEE ignores.

### What OAE Captures That OEE Doesn't

| Loss Type | OEE | OAE |
|-----------|-----|-----|
| Equipment downtime | ✅ Captured | ✅ Captured |
| Speed losses | ✅ Captured | ✅ Captured |
| Quality losses | ✅ Captured | ✅ Captured |
| Schedule losses (no orders) | ❌ Excluded | ✅ Captured |
| Organizational losses | ❌ Excluded | ✅ Captured |
| Supply chain disruptions | ❌ Excluded | ✅ Captured |
| Staffing shortages | ❌ Excluded | ✅ Captured |

### When to Use OAE

- Plant-level performance reporting
- Identifying organizational inefficiencies beyond the machine level
- Comparing facilities with different management structures
- Executive dashboards that need a holistic view

### Caveat

OAE is broader but harder to measure consistently. It requires data from multiple systems (ERP, MES, HR, supply chain) and is more susceptible to definition disagreements. Start with solid OEE before layering OAE on top.

---

## OLE — Overall Labor Effectiveness

### What It Extends

OLE applies the **A × P × Q framework** to **human labor** instead of equipment.

### Formula

$$
\text{OLE} = \text{Labor Availability} \times \text{Labor Performance} \times \text{Labor Quality}
$$

Where:

| Factor | Definition | Example Losses |
|--------|-----------|----------------|
| **Labor Availability** | Time operators are actively working vs. scheduled time | Breaks, absenteeism, waiting for work, meetings |
| **Labor Performance** | Actual output vs. expected output per operator-hour | Slow pace, rework time, inefficient methods |
| **Labor Quality** | Good output vs. total output by operators | Errors, rework, scrap caused by operator mistakes |

### Example

```
10 operators scheduled for 8 hours = 80 operator-hours available
2 operators absent = 64 operator-hours actual
  → Labor Availability = 80%

Operators produce 500 units; expected = 600 at standard pace
  → Labor Performance = 83.3%

Of 500 units, 475 are good (first pass)
  → Labor Quality = 95%

OLE = 80% × 83.3% × 95% = 63.3%
```

### When to Use OLE

- Labor-intensive operations where human performance dominates
- Identifying training needs
- Evaluating staffing levels and shift patterns
- Complementing OEE in assembly operations

### OLE + OEE

In automated environments, OEE dominates. In manual or semi-automated environments, both OEE and OLE matter. The most effective plants track both.

---

## Comparison Table

| Metric | Scope | Time Reference | Key Question | Typical User |
|--------|-------|---------------|--------------|--------------|
| **OEE** | Equipment | Planned Production Time | How well is the equipment running? | Production/Engineering |
| **TEEP** | Equipment | Calendar Time (24/7) | How much of our capacity are we using? | Capacity Planning |
| **OAE** | System/Facility | Calendar Time | How effective is the whole operation? | Plant Management |
| **OLE** | Labor | Scheduled Labor Time | How effective is our workforce? | HR/Operations |

---

## Which Metric for Which Question?

### "How productive is our equipment?"

→ **OEE** (see [[oee-concept]])

### "Should we buy another machine?"

→ **TEEP** — if TEEP is low, you have unused capacity. Add a shift before buying equipment.

### "Which plant is performing better?"

→ **TEEP** or **OAE** — OEE alone is misleading if plants have different shift patterns or organizational structures.

### "Do we need more operators?"

→ **OLE** — if Labor Availability is low (absenteeism) or Labor Performance is low (training gap), adding headcount may not help.

### "Where are our biggest losses?"

→ **OEE decomposition** (A × P × Q) — always start here. See [[oee-calculation]].

### "What's our true capacity utilization?"

→ **TEEP** — the gap between TEEP and OEE is your scheduling/planning loss.

### "How do we compare to world-class?"

→ **OEE** for equipment, **TEEP** for total capacity — but only compare [[oee-concept#never-compare-dissimilar-processes|similar processes]].

### "What should leadership see?"

→ **OAE** or **TEEP** for executive dashboards (broader view). **OEE** for operational dashboards (specific view).

---

## Metric Relationships

```
Calendar Time
│
├── Scheduled Losses ──────────── TEEP vs. OEE gap
│
Planned Production Time
│
├── Availability Losses ────────── OEE-A
├── Performance Losses ─────────── OEE-P
├── Quality Losses ─────────────── OEE-Q
│
Fully Productive Time
│
├── (Compare to labor time) ────── OLE gap
│
Effective Labor Time
```

---

## Implementation Priority

| Phase | Metric | Why First |
|-------|--------|-----------|
| 1 | **OEE** | Foundational. All other metrics build on OEE principles. Establish A×P×Q decomposition before adding complexity. |
| 2 | **TEEP** | One additional variable (Utilization) on top of OEE. Easy to calculate once OEE is established. |
| 3 | **OLE** | Requires labor-specific data collection. Implement after OEE automation is mature. |
| 4 | **OAE** | Requires system-level data integration. Most complex, implement last. |

**Rule:** Don't try to implement all metrics simultaneously. Build from OEE outward.

---

## Related Pages

- [[oee-concept]] — OEE fundamentals and the three factors
- [[oee-calculation]] — How to calculate OEE and its components
- [[oee-hierarchy]] — Aggregating metrics across machines, lines, and plants
- [[oee-improvement]] — Strategies to improve OEE and extended metrics
- [[oee-mistakes-and-hidden-factory]] — Common errors in metric calculation
