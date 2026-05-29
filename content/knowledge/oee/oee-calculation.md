---
title: "OEE Calculation Methods"
description: "How to calculate OEE using the preferred A×P×Q method, the time waterfall diagram, and common calculation pitfalls."
date: 2025-05-29
tags:
  - oee
  - calculation
  - formula
  - methodology
  - data-collection
---

# OEE Calculation Methods

## The Simple Formula

OEE can be calculated in a single formula:

$$
\text{OEE} = \frac{\text{Good Count} \times \text{Ideal Cycle Time}}{\text{Planned Production Time}}
$$

Where:

- **Good Count** = number of conforming (defect-free) units produced
- **Ideal Cycle Time** = the theoretical minimum time to produce one unit (the inverse of design speed)
- **Planned Production Time** = total scheduled production time minus planned downtime (breaks, planned maintenance)

**Example:**

- Planned Production Time: 8 hours = 28,800 seconds
- Good Count: 18,000 units
- Ideal Cycle Time: 1.0 second/unit
- OEE = (18,000 × 1.0) / 28,800 = **62.5%**

This works, but it tells you nothing about *where* the losses are. Use the preferred method below.

## The Preferred Method: A × P × Q

The multiplicative formula decomposes OEE into three independently measurable factors:

$$
\text{OEE} = \text{Availability} \times \text{Performance} \times \text{Quality}
$$

### Why A × P × Q Is Better

The simple formula gives you a single number. The A × P × Q method gives you:

1. **Diagnostic value** — You know *what* to fix (downtime? speed? defects?)
2. **Targeting** — You can prioritize improvement efforts
3. **Tracking** — You can see if improvements in one factor are offset by losses in another
4. **Benchmarking** — You can compare specific factors across similar equipment

See [[oee-mistakes-and-hidden-factory]] for why this decomposition matters and what common mistakes arise when you only look at the composite score.

## The Time Waterfall Diagram

The A × P × Q calculation follows a time waterfall. Each factor subtracts specific losses:

```
Calendar Time
│
├── - Schedule Losses (planned non-production: breaks, no orders)
│
▼
Planned Production Time
│
├── - Availability Losses (equipment failure, setup, changeover)
│
▼
Run Time
│
├── - Performance Losses (idling, minor stops, reduced speed)
│
▼
Net Run Time
│
├── - Quality Losses (defects, rejects, startup scrap)
│
▼
Fully Productive Time
```

### Calculating Each Factor

#### Availability

$$
\text{A} = \frac{\text{Run Time}}{\text{Planned Production Time}}
$$

- **Run Time** = Planned Production Time - Availability Losses
- Availability Losses include: equipment failure, setup/changeover, unplanned downtime

**Example:** 8 hours planned - 48 min breakdown - 32 min changeover = 7.2 hours run time
A = 7.2 / 8.0 = **90.0%**

#### Performance

$$
\text{P} = \frac{\text{Net Run Time}}{\text{Run Time}} = \frac{\text{Ideal Cycle Time} \times \text{Total Count}}{\text{Run Time}}
$$

- **Net Run Time** = theoretical time to produce Total Count at ideal speed
- Total Count includes *all* units produced (good + defective)
- Performance Losses include: minor stops, reduced speed, slow cycles

**Example:** 26,000 units produced × 1.0 sec ideal = 26,000 sec net run time
Run time = 25,920 sec (7.2 hours)
P = 26,000 / 25,920 = **100.3%**

> ⚠️ **Performance > 100% Warning:** See [Performance > 100%](#performance--100) section below.

#### Quality

$$
\text{Q} = \frac{\text{Good Count}}{\text{Total Count}}
$$

- **Good Count** = units that pass quality inspection
- Quality Losses include: defects, rejects, scrap, rework, startup rejects

**Example:** 26,000 total produced, 1,040 defective
Q = 24,960 / 26,000 = **96.0%**

#### Final OEE

OEE = 90.0% × 100.3% × 96.0% = **86.7%**

## Performance > 100%

When Performance exceeds 100%, it means the **Ideal Cycle Time is wrong** — the machine is running faster than you think it should.

### Common Causes

| Cause | Fix |
|-------|-----|
| Ideal Cycle Time set too slow | Update to design speed from OEM specs |
| Machine upgraded/bypassed | Re-validate cycle time after any modification |
| Operator override speed | Review safety and quality implications |
| Measurement error | Audit cycle time measurement method |

### The Rule: Use Design Speed, Not Historical Average

**Always use the manufacturer's design speed** (or verified theoretical maximum) as your Ideal Cycle Time.

- ❌ **Wrong:** "We usually run at 90 sec/unit, so let's use 90 sec"
- ✅ **Right:** "The machine is rated for 80 sec/unit at design speed"

Using a historical average as Ideal Cycle Time masks performance losses and makes OEE look artificially high. If the machine *can* run at 80 seconds but *typically* runs at 90, that 10-second gap is a performance loss you need to see and address.

See [[oee-improvement]] for how to properly set baseline measurements.

## Data Collection Rules

### Automate Everything

Manual data collection introduces bias and errors:

- Operators round to convenient numbers
- Short stops get forgotten
- Cycle times are estimated, not measured
- Quality data is incomplete

**Rule:** Automate data collection for at least **4 weeks** before using OEE data for decisions. See [[data-collection]] for implementation guidance.

### Minimum Data Requirements

| Data Point | Source | Frequency |
|------------|--------|-----------|
| Planned Production Time | ERP/MES schedule | Per shift |
| Run Time / Downtime | PLC/sensor + reason codes | Real-time |
| Total Count | Production counter | Real-time |
| Good Count | Quality system / inspection | Per batch/shift |
| Ideal Cycle Time | OEM spec or time study | Static (validate periodically) |

### Check A/P/Q Individually

**Never make decisions based on the composite OEE score alone.** Always examine:

1. Which factor is lowest?
2. What specific losses are driving that factor?
3. Are losses consistent or variable?
4. Is the data collection method reliable for that factor?

See [[oee-mistakes-and-hidden-factory]] for the six big losses mapped to each factor.

## Calculation Variations by Manufacturing Type

Different manufacturing environments require different calculation approaches:

| Type | OEE Range | Key Difference | See Also |
|------|-----------|----------------|----------|
| Discrete | 60-85% | Constant cycle time per SKU | [[oee-manufacturing-types#discrete]] |
| Batch | 40-65% | Setup-dominated, batch yield | [[oee-manufacturing-types#batch]] |
| Continuous | 70-90% | Flow rate, rarely changes | [[oee-manufacturing-types#continuous]] |
| Assembly | 55-80% | Bottleneck determines output | [[oee-manufacturing-types#assembly]] |
| HMLV | 35-60% | Frequent changeovers | [[oee-manufacturing-types#hmlv]] |

## Quick Reference: Formulas

```
Availability = Run Time / Planned Production Time

Performance = (Ideal Cycle Time × Total Count) / Run Time
            = (Total Count / Run Time) / Ideal Run Rate

Quality = Good Count / Total Count

OEE = Availability × Performance × Quality

Fully Productive Time = Good Count × Ideal Cycle Time

Hidden Factory = Planned Production Time - Fully Productive Time
```

## Related Pages

- [[oee-concept]] — What OEE means and how to interpret it
- [[oee-mistakes-and-hidden-factory]] — Common calculation errors and the hidden factory
- [[oee-improvement]] — How to use OEE data to drive improvement
- [[oee-extended-metrics]] — TEEP, OAE, OLE and when to use them
- [[oee-hierarchy]] — How to aggregate OEE across machines and lines
