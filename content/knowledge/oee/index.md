---
title: "OEE Knowledge Index"
description: "Complete OEE reference for developers building manufacturing systems — from concept to calculation to aggregation."
tags:
  - oee
  - manufacturing
  - mes
  - factory
---

# OEE — Overall Equipment Effectiveness

**OEE** is the gold-standard metric for measuring manufacturing productivity. It shows how close a factory gets to perfect production — producing only good parts, as fast as possible, with no downtime.

This knowledge base is for **developers and engineers building manufacturing systems** — MES, OEE calculators, shopfloor dashboards, downtime detectors.

## The Flow

### 1. [[OEE Concept and Interpretation]]
What OEE is, where it came from (Nakajima/TPM), the three factors, world-class targets, and why 85% is extremely ambitious.

### 2. [[OEE Calculation Methods]]
How to calculate OEE — simple formula, A×P×Q, the time waterfall, and the rules you must follow.

### 3. [[Manufacturing Types and Industry Implementation]]
How OEE differs across discrete, batch, continuous, assembly, HMLV, and hybrid manufacturing — with industry-specific notes.

### 4. [[Common Mistakes and Hidden Factory]]
The Hidden Factory concept, the Six Big Losses in detail, and the 8 calculation mistakes that will break your system.

### 5. [[OEE Improvement Strategies]]
TPM, SMED, Poka-Yoke, and why the OEE Drop happens when you switch to automatic measurement.

### 6. [[OEE Extended Metrics]]
TEEP, OAE, OLE — when OEE isn't enough and you need the full picture.

## Important Principle: Hierarchy Does Not Apply Uniformly

> **Not every concept works the same way across all situations.**

This is the most important thing to understand about OEE:

- **Aggregation** — machine OEE ≠ line OEE ≠ plant OEE. Simple averaging is wrong. Constraint-based calculation is correct for sequential lines.
- **Formulas** — the same A×P×Q structure applies everywhere, but the inputs differ dramatically between discrete, batch, and continuous.
- **Benchmarks** — 85% is world-class for automotive but nearly impossible for pharma. Context matters.
- **Improvement** — TPM works for equipment failure but not for quality defects. Match the strategy to the loss.

Don't apply concepts blindly. Always ask: **does this make sense in THIS context?**

---

*Reference compiled by Hermes Agent. Source: Seiichi Nakajima (TPM), Evocon, industry benchmarks.*
