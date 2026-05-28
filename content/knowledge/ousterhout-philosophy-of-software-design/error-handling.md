---
title: "Error Handling"
description: "Strategies for managing exceptions — prefer preventing errors over handling them."
tags:
  - software-design
  - error-handling
---

# Error Handling

Exception handling is a **major source of complexity**. Strategies ranked by preference:

## 1. Define Errors Out of Existence

Redesign the API or implementation to eliminate the exceptional case entirely.

```java
// BAD: forces caller to handle error
int length = str.substring(start, end);  // throws IndexOutOfBoundsException

// GOOD: handles bounds internally
int length = str.safeSubstring(start, end);  // clamps to valid range
```

## 2. Mask Exceptions

Handle the exception at a lower level. Caller never sees it.

## 3. Exception Aggregation

Handle multiple exceptions in one place with a generic handler.

## 4. Crash

For truly unrecoverable errors (e.g., out of memory).

## 5. Design Special Cases Out of Existence

Avoid special-case flags and modes.

## Rules

- Do not use exceptions for normal control flow
- They are for truly exceptional conditions
- If it is hard to write a comment, it is a sign that the design needs improvement

---

*See also: [[Pull Complexity Downwards]], [[Deep Modules]]*
