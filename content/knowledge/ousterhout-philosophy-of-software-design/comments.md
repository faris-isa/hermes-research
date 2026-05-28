---
title: "Comments as Design"
description: "Comments are not redundant — they document things the code cannot express."
tags:
  - software-design
  - comments
  - documentation
---

# Comments as Design

## Why Comments Matter

Comments are **not redundant** — they document things the code **cannot express**:
- Design decisions and rationale
- Why something is done a certain way
- Non-obvious behavior
- Intent and context

## What to Comment

A good comment reveals something **not obvious from the code itself**:

```c
// GOOD: explains the "why"
// Workaround for bug in XYZ widget library (fixed in v2.0).
// Can remove after upgrade.

// BAD: restates the code
// Increment counter
counter++;
```

**Comment types by value:**

| Type | Value |
|------|-------|
| Interface contracts | High — what a caller needs to know |
| Member variable purpose | High — why it exists |
| Design decisions / rationale | High — why this approach, not alternatives |
| Non-obvious behavior | High — edge cases, workarounds |
| Inline restating code | Low — wastes reader time |

## Write Comments First

Use comments as a **design tool**:
1. Write the interface comment first
2. If it is hard to write, the design needs work
3. Write implementation comments alongside the code

> If it is hard to write a comment, it is a sign that the design needs improvement.

## Names as Documentation

Precise names reduce the need for comments:

```java
// GOOD: name IS the documentation
boolean cursorVisible;
boolean isHorizontalScrollBarVisible;

// BAD: ambiguous
boolean h;    // what is h?
boolean flag; // what flag?
```

Choosing one mediocre name has small cost. Across thousands of variables, the cumulative effect is significant.

---

*See also: [[Obvious Code]], [[Deep Modules]]*
