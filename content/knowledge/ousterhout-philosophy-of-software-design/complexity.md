---
title: "Complexity and Its Symptoms"
description: "How complexity manifests in software systems and why it is the root cause of bugs and maintenance difficulty."
tags:
  - software-design
  - complexity
---

# Complexity and Its Symptoms

Complexity is defined as: *"Anything related to the structure of a software system that makes it hard to understand and modify the system."*

## Three Symptoms

| Symptom | Description |
|---------|-------------|
| **Change Amplification** | A simple change requires modifications in many places |
| **Cognitive Load** | Developer must hold too many things in mind (~7±2 limit) |
| **Unknown Unknowns** | Unclear what needs to be done or if a solution will work |

## Root Causes

1. **Dependencies** — one piece of code depends on another (fundamental, but must be managed)
2. **Obscurity** — important information is not obvious from the code

## Key Insight

Complexity is **incremental**. Small, acceptable additions accumulate rapidly into a tangled mess. Each individual decision seems fine; the aggregate is devastating.

> Your job as a developer is not just to create code that you can work with easily, but to create code that **others** can also work with easily.

---

*See also: [[Pull Complexity Downwards]], [[Deep Modules]], [[Information Hiding and Leakage]]*
