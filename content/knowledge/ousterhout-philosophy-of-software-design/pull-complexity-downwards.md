---
title: "Pull Complexity Downwards"
description: "The golden rule of software design — simple interface beats simple implementation."
tags:
  - software-design
  - design-rule
  - complexity
---

# Pull Complexity Downwards

> **The Golden Rule:** It is more important for a module to have a **simple interface** than a simple implementation.

Absorb complexity inside the module. Set good defaults so callers do not have to deal with edge cases.

## Example

```java
// BAD: Pushes complexity to caller
DBConnection connect(host, port, user, pass, timeout, retries, poolSize, sslMode...)

// GOOD: Pulls complexity down with sensible defaults
DBConnection connect(url)  // internal: handles all the above
```

## Why This Matters

- It is more important for a module to have a **simple interface** than a simple implementation
- Handle complexity inside the module to make life easier for users/callers
- Set good default configuration parameters so callers don't have to

## Related: Different Layer, Different Abstraction

Each layer in a system should provide a **different abstraction** from adjacent layers.

**Pass-through methods are a red flag:**

```java
// BAD: Layer does nothing — just forwards
class ServiceLayer {
    Response handle(Request req) {
        return repository.process(req);  // Pass-through!
    }
}
```

If adjacent layers have the same abstraction, either merge them or add a meaningful transformation.

---

*See also: [[Deep Modules]], [[Information Hiding and Leakage]]*
