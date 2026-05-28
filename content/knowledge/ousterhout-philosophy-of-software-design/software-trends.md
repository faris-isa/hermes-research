---
title: "Software Trends Critique"
description: "Ousterhout's contrarian views on TDD, short methods, agile, and AI code generation."
tags:
  - software-design
  - trends
  - tdd
  - ai
---

# Software Trends Critique

## TDD (Test-Driven Development)

Forces thinking about features before design. Counter-productive for architecture.

> "The problem with test-driven development is that it focuses on getting specific features working, rather than finding the best design."

**Exception:** Writing a test first when fixing a specific bug is useful.

## Short Methods (Clean Code)

Excessive decomposition increases interface complexity and reduces understandability.

Better to group related functionality into deeper, more cohesive modules.

## Agile

Good at iterating, but each iteration should expose design problems that get fixed before the next feature.

## AI Code Generation

Tactical tornadoes on steroids. They generate code quickly but create technical debt.

**Design thinking becomes MORE important, not less.**

## Performance

- Do not optimize prematurely — first get the design right
- Good design naturally leads to good performance (deep modules, information hiding)
- When performance matters, use profiling to find real bottlenecks
- Avoid domain-specific optimizations that destroy clarity for small gains

---

*See also: [[Design Process]], [[Deep Modules]]*
