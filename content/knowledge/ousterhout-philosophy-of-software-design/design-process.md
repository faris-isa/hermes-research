---
title: "Design Process"
description: "How to approach software design — design it twice, top-down and bottom-up."
tags:
  - software-design
  - design-process
---

# Design Process

## Design It Twice

Never settle for the first design. Propose at least **two different alternatives** before choosing.

- Different decomposition strategies
- Different interfaces
- Different module boundaries
- Compare tradeoffs explicitly

> Ousterhout used this for the Tk Toolkit API. The second design was dramatically better than the first.

## Top-Down and Bottom-Up

Effective design requires both:

- **Top-down:** Start with high-level goals
- **Bottom-up:** Understand the building blocks you have
- Use the two to iteratively find a good **middle ground**

## Together or Apart

**Combine** when:
- Elements are closely related
- It simplifies the interface
- It eliminates duplication

**Separate** when:
- Elements are independent
- One is general-purpose, one is special-purpose
- Combining would increase cognitive load

**Key question for methods:** The most important goal is to provide **clean and simple abstractions**.

---

*See also: [[Deep Modules]], [[Information Hiding and Leakage]]*
