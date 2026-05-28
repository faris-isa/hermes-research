---
title: "OEE and Theory of Constraints"
description: "How to pair TOC bottleneck analysis with OEE for maximum manufacturing impact."
tags:
  - oee
  - manufacturing
  - toc
  - theory-of-constraints
  - bottleneck
---

# OEE and Theory of Constraints (TOC)

## Core Synergy

**TOC** identifies the bottleneck limiting overall process performance. **OEE** measures effectiveness of a *specific* machine.

> *"Getting excellent OEE performance at bottleneck machines"* has significantly greater economic impact than merely reducing defects at non-bottleneck machines.

## The Five Focusing Steps (TOC) and OEE Application

| TOC Step | OEE Application |
|----------|-----------------|
| 1. Identify the constraint | Measure OEE on all machines — lowest OEE = bottleneck |
| 2. Exploit the constraint | Maximize OEE at bottleneck (availability, performance, quality) |
| 3. Subordinate everything else | Non-bottleneck machines should support bottleneck schedule |
| 4. Elevate the constraint | If bottleneck OEE still limits throughput, invest in capacity |
| 5. Repeat | Find new bottleneck, restart cycle |

## Key Insight

> Improving OEE at non-bottleneck machines **does not increase throughput** — it only creates excess inventory. Focus OEE improvement efforts on the constraint first.

## Practical Example

A bottleneck machine with 80 items/hour ideal throughput over 16-hour shift:

| Metric | Value | Calculation |
|--------|-------|-------------|
| Planned Production Time | 16 hours | 2 shifts x 8 hours |
| Operating Time | 13.33 hours | Lost 1 hr to inexperienced operators, 1 hr to rework |
| Availability | 92.86% | 13.33 / 14 (available time) |
| Ideal Capacity | 1,040 parts | 780 min / 0.75 min/part |
| Total Parts Produced | 960 parts | Lost another hour to reworking |
| Performance | 91.67% | 960 / 1,040 |
| Quality | 97% | 3% scrap rate |
| **OEE** | **82.2%** | 92.86% x 91.67% x 97% |
| **Throughput** | **1,052 items** | 80 x 16 x 0.822 |

## When to Apply TOC and OEE

| Situation | Action |
|-----------|--------|
| Multiple machines in sequence | Measure OEE on all — focus improvement on lowest |
| Single bottleneck limiting throughput | Maximize bottleneck OEE before other improvements |
| Excess WIP inventory | Non-bottlenecks may be over-producing — subordinate to constraint |
| New equipment investment | Check TEEP first — may have unused capacity |

## Related

- [[OEE Knowledge Index]]
- [[Six Big Losses]]
- [[OEE Improvement Strategies]]
