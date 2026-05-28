---
title: "Information Hiding and Leakage"
description: "Encapsulating design decisions within modules and avoiding knowledge spread across boundaries."
tags:
  - software-design
  - modules
  - encapsulation
---

# Information Hiding and Leakage

## Information Hiding

A module should expose only what is necessary. Implementation details stay hidden inside.

The interface reveals **what** the module does, not **how** it does it.

## Information Leakage

When the same design decision is required in multiple places — the knowledge "leaks" across module boundaries.

```java
// BAD: Information Leakage — caller must know about layering
FileInputStream fis = new FileInputStream(file);
BufferedInputStream bis = new BufferedInputStream(fis);
ObjectInputStream ois = new ObjectInputStream(bis);

// GOOD: Information Hidden — caller just opens a file
DataInputStream in = new DataInputStream(file);
```

## Temporal Decomposition

A form of leakage where code is split by time flow rather than by knowledge:

```java
// BAD: What if step 2 needs data from step 4?
Step1 fetchData()
Step2 process()
Step3 transform()
Step4 save()
```

If steps need data from other steps, the decomposition is wrong.

## Rule

Each module should encapsulate a few pieces of knowledge (design decisions). If a decision must be known in **2 or more places**, it is leaking.

---

*See also: [[Deep Modules]], [[Pull Complexity Downwards]]*
