---
title: "Deep Modules"
description: "Modules with simple interfaces and powerful implementations — the core building block of good software design."
tags:
  - software-design
  - modules
  - design
---

# Deep Modules

The best modules provide **a lot of functionality behind a simple, narrow interface**.

## Depth Ratio

```
depth = functionality provided / interface complexity
```

- **High ratio** = deep module (good)
- **Low ratio** = shallow module (bad)

## Deep vs Shallow

| | Deep Module | Shallow Module |
|-|-------------|----------------|
| Interface | Simple, narrow | Complex, wide |
| Implementation | Powerful, complex | Little functionality |
| Example | Unix file API (`open`, `read`, `write`, `close`) | Wrapper that just forwards calls |
| **Verdict** | **Goal** | **Avoid** |

## Example: Unix File API

```c
open(...)    // Simple interface
read(...)    // Hides: buffering, caching, disk scheduling,
write(...)   //         permissions, file system details,
lseek(...)   //         block allocation, error recovery
close(...)
```

Five functions hide enormous complexity.

## Classitis

The antithesis of deep modules — creating many shallow classes that each have little functionality. This is what happens when you follow "split everything into small classes" too literally.

> **Best modules are deep: they have a lot of functionality behind a simple interface.**

---

*See also: [[Pull Complexity Downwards]], [[Information Hiding and Leakage]]*
