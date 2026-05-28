---
title: "Extended OEE Metrics: TEEP, OAE, OLE"
description: "Beyond OEE — complementary metrics for total utilization, system-level losses, and workforce performance."
tags:
  - oee
  - manufacturing
  - metrics
  - teep
  - oae
  - ole
---

# Extended OEE Metrics

OEE has blind spots — it doesn't capture total utilization, system-level losses, or workforce performance. Four complementary metrics fill these gaps.

## TEEP — Total Effective Equipment Performance

Extends OEE by including ALL calendar time (24/7/365), not just planned production time.

```
TEEP = OEE × (Planned Production Time ÷ Total Calendar Time)
     = Availability × Performance × Quality × Loading
where Loading = Planned Time ÷ Calendar Time
```

**Example:** Machine with 85% OEE running 16 of 24 hours/day:

```
TEEP = 0.85 × (16 ÷ 24) = 56.7%
```

→ 43% of calendar capacity is unused.

**Key Insight:** High OEE + low TEEP = **capacity utilization problem**, not efficiency problem. Check TEEP before investing in new machinery.

## OAE — Overall Asset Effectiveness

Broadens focus from single machine to entire production system, including organizational losses (material delays, logistics, planned maintenance).

```
OAE = Actual Output ÷ Maximum Possible Output (based on total operating time)
```

**Key Insight:** OAE answers: *"How effectively are we using our total asset base?"* — serves plant leadership and management.

## OLE — Overall Labor Effectiveness

Applies OEE logic to human performance, capturing training, experience, and motivation factors.

```
OLE = Availability × Performance × Quality
```

| OLE Factor | Measures |
|------------|----------|
| **Availability** | % of scheduled time operator is present and working |
| **Performance** | % of standard tasks completed per unit time |
| **Quality** | % of operator-initiated tasks completed correctly |

**Key Insight:** Two lines with identical OEE can have different economic results due to team performance. OLE is especially relevant in **manual operations** (assembly, packaging, inspection).

## PEE — Production Equipment Efficiency

Applies weighted sub-indicators to OEE components:

```
PEE = (Availability)^k1 × (Performance)^k2 × (Quality)^k3
```

where k1 + k2 + k3 = 1 (weights based on industry priority)

## OFE — Overall Factory Effectiveness

Calculates efficiency for entire plants with multiple interconnected devices. Models production as subsystems (Series, Parallel, Assembly, Expansion) to account for interactions.

## OTE and CTE — Throughput and Cycle Time Metrics

- **OTE (Overall Throughput Effectiveness):** Ratio of actual to theoretical maximum output
- **CTE (Cycle Time Effectiveness):** Ratio of theoretical to actual cycle time

## Comparison Table

| Metric | Scope | Time Reference | Key Question | Typical User |
|--------|-------|----------------|--------------|--------------|
| **OEE** | Machine/Line | Planned production time | How well does the machine run? | Shift leader, OpEx |
| **TEEP** | Plant | Calendar time (24/7) | How fully is capacity used? | Plant manager, COO |
| **OAE** | Factory/Network | Total operating time | How efficient is the system? | Management, strategy |
| **OLE** | Workforce | Planned labor time | How effectively does the team work? | HR, production mgmt |

## Which Metric for Which Question?

| You Want to Know | Use This Metric |
|-------------------|-----------------|
| Why is Machine X producing below target? | **OEE** |
| Do we need a new machine — or can we run more shifts? | **TEEP** |
| Why does the line underperform despite good machine OEE? | **OAE** |
| Why does Shift A produce 15% more than Shift B? | **OLE** |
| What is the true cost per good unit? | **TEEP** (includes all losses) |

## Related

- [[OEE Knowledge Index]]
- [[Hidden Factory]]
- [[OEE Improvement Strategies]]
