     1|---
     2|title: "DDIA — Reliable, Scalable, Maintainable"
     3|description: "Chapter 1: The three pillars of data system design."
     4|tags:
     5|  - ddia
     6|  - reliability
     7|  - scalability
     8|---
     9|
    10|# Reliable, Scalable, Maintainable Applications
    11|
    12|Chapter 1 of [[Designing Data-Intensive Applications]].
    13|
    14|## Reliability
    15|
    16|**Definition:** System works correctly despite faults (hardware, software, human error).
    17|
    18|### Fault vs Failure
    19|
    20|> **Fault** = one component deviating from specs
    21|> **Failure** = the system as a whole stops working
    22|
    23|**Strategy:** Prefer fault tolerance over prevention.
    24|
    25|### Types of Faults
    26|
    27|| Type | Example | Mitigation |
    28||------|---------|------------|
    29|| **Hardware** | Disk failure, network outage | Redundancy, replication |
    30|| **Software** | Bugs, memory leaks | Testing, monitoring, rollback |
    31|| **Human** | Misconfiguration, bad deploy | Admin interfaces, sandboxes, automation |
    32|
    33|> **Key insight:** Software errors cause more failures than hardware in modern systems.
    34|
    35|### Human Error Mitigation
    36|
    37|- Admin interfaces (not direct DB access)
    38|- Sandboxes for testing changes
    39|- Automation of routine tasks
    40|- Easy rollback mechanisms
    41|- Monitoring and alerting
    42|- Training and documentation
    43|
    44|## Scalability
    45|
    46|**Definition:** Good performance under increased load.
    47|
    48|### Load Metrics
    49|
    50|| Metric | Description |
    51||--------|-------------|
    52|| Requests/sec | Throughput |
    53|| Read/write ratio | Read-heavy vs write-heavy |
    54|| Data size | Total storage |
    55|| Hotspots | Uneven access patterns |
    56|
    57|### Performance Metrics
    58|
    59|| Percentile | Meaning |
    60||-----------|---------|
    61|| **p50 (median)** | Typical user experience |
    62|| **p95** | Slow users |
    63|| **p99** | Very slow users |
    64|| **p999** | Outlier latency |
    65|
    66|> *"The customers with the slowest requests are often those who have the most data."*
    67|
    68|**Amazon's target:** 99.9th percentile for internal services.
    69|
    70|### Scaling Approaches
    71|
    72|| Approach | Description | When to Use |
    73||----------|-------------|-------------|
    74|| **Vertical scaling** | Upgrade hardware | Simple, single-server workloads |
    75|| **Horizontal scaling** | Distribute across machines | High throughput, need redundancy |
    76|| **Elastic systems** | Auto-adjust resources | Variable load patterns |
    77|
    78|## Maintainability
    79|
    80|**Definition:** Making life easier for engineering/ops teams.
    81|
    82|### Three Principles
    83|
    84|1. **Operability** — Make routine tasks easy
    85|2. **Simplicity** — Remove accidental complexity via abstraction
    86|3. **Evolvability** — Facilitate future changes
    87|
    88|> Every legacy system is unpleasant — the goal is to minimize how unpleasant yours becomes.
    89|
    90|## Related
    91|- [[Designing Data-Intensive Applications]]
    92|- [[DDIA — Data Models]]
    93|