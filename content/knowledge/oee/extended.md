---
title: "6. Extended Metrics — TEEP, OAE, OLE"
description: "Beyond OEE — complementary metrics for total utilization, system-level losses, and workforce performance."
tags:
  - oee
  - manufacturing
  - metrics
  - teep
  - oae
  - ole
---

# 6. Extended Metrics

OEE has blind spots — it doesn't capture total utilization, system-level losses, or workforce performance. These metrics fill those gaps.

```mermaid
graph TD
    TEEP["📊 TEEP<br/>Total Calendar Time<br/>(24/7/365)"] --> OEE["📊 OEE<br/>Planned Production Time"]
    OEE --> A["Availability"]
    OEE --> P["Performance"]
    OEE --> Q["Quality"]
    
    OAE["📊 OAE<br/>Entire Production System"] -.->|"System-level losses"| OEE
    OLE["📊 OLE<br/>Workforce Performance"] -.->|"Human factors"| OEE

    style TEEP fill:#dc3545,stroke:#c82333,color:#fff
    style OEE fill:#28a745,stroke:#155724,color:#fff
    style OAE fill:#fd7e14,stroke:#e67e00,color:#fff
    style OLE fill:#6f42c1,stroke:#5a32a3,color:#fff
    style A fill:#d4edda,stroke:#155724
    style P fill:#d4edda,stroke:#155724
    style Q fill:#d4edda,stroke:#155724
```

> **Think of it this way:** OEE tells you how well the machine runs when it's supposed to. TEEP tells you how much of the calendar you're actually using. OAE tells you if the whole system is working. OLE tells you if the people are effective.

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

> **Key insight:** High OEE + low TEEP = **capacity utilization problem**, not efficiency problem. Check TEEP before investing in new machinery.

## OAE — Overall Asset Effectiveness

Broadens focus from single machine to entire production system, including organizational losses (material delays, logistics, planned maintenance).

```
OAE = Actual Output ÷ Maximum Possible Output (based on total operating time)
```

> **Key insight:** OAE answers: *"How effectively are we using our total asset base?"* — serves plant leadership and management.

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

> **Key insight:** Two lines with identical OEE can have different economic results due to team performance. OLE is especially relevant in **manual operations** (assembly, packaging, inspection).

## Which Metric for Which Question?

| You Want to Know | Use This Metric |
|-------------------|-----------------|
| Why is Machine X producing below target? | **OEE** |
| Do we need a new machine — or can we run more shifts? | **TEEP** |
| Why does the line underperform despite good machine OEE? | **OAE** |
| Why does Shift A produce 15% more than Shift B? | **OLE** |
| What is the true cost per good unit? | **TEEP** (includes all losses) |

## Related

- [[OEE — Overall Equipment Effectiveness]]
- [[Improvement]]
