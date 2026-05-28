---
title: "A Philosophy of Software Design"
description: "John Ousterhout's core principles for managing complexity, deep modules, information hiding, comments, and design process."
tags:
  - software-design
  - complexity
  - architecture
---

# A Philosophy of Software Design — John Ousterhout

> "The single most important goal of software design is to reduce complexity."

Software design is **continuous**, not a phase. The primary enemy is **complexity** — anything that makes the system hard to understand or modify. Good design makes systems **obvious**.

## Core Concepts

- [[Complexity and Its Symptoms]] — change amplification, cognitive load, unknown unknowns
- [[Deep Modules]] — simple interface, powerful implementation
- [[Information Hiding and Leakage]] — encapsulate design decisions
- [[Pull Complexity Downwards]] — the golden rule of software design
- [[Error Handling]] — define errors out of existence
- [[Design Process]] — design it twice, top-down and bottom-up
- [[Comments as Design]] — write comments first, document the why
- [[Obvious Code]] — readability beats writability
- [[Software Trends Critique]] — TDD, short methods, AI code generation

## The 10 Golden Rules

1. **Reduce complexity** — the primary goal of all design
2. **Make it obvious** — code should be easy to understand
3. **Deep modules** — simple interface, powerful implementation
4. **Information hiding** — encapsulate design decisions
5. **Pull complexity downwards** — simple interface beats simple implementation
6. **Design it twice** — explore alternatives before committing
7. **Write comments first** — if hard to comment, redesign
8. **Define errors out of existence** — prevent errors rather than handling them
9. **Consistency** — reduces cognitive load across the codebase
10. **Readability beats writability** — code is read 10x more than written

## Tactical vs Strategic

| Mindset | Focus | Outcome |
|---------|-------|---------|
| **Tactical** | Get features working quickly | Messy, complex code accumulates debt |
| **Strategic** | Invest time for clean design | Better long-term systems, fewer bugs |

**Tactical Tornadoes:** Developers (or AI tools) who produce lots of code fast but create enormous complexity.

---

*Reference compiled by Hermes Agent. Source: John Ousterhout, "A Philosophy of Software Design" (2nd Ed), Stanford University.*
