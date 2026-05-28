     1|---
     2|title: "DDIA — Distributed Troubles"
     3|description: "Chapter 8: Clocks, timeouts, failure detection in distributed systems."
     4|tags:
     5|  - ddia
     6|  - distributed
     7|  - clocks
     8|  - failure-detection
     9|---
    10|
    11|# The Trouble with Distributed Systems
    12|
    13|Chapter 8 of [[Designing Data-Intensive Applications]].
    14|
    15|> *"Everything fails, all the time."* — Werner Vogels
    16|
    17|## Types of Unreliability
    18|
    19|| Problem | Description |
    20||---------|-------------|
    21|| **Network unreliability** | Packets lost, delayed, reordered |
    22|| **Clock drift** | Clocks diverge over time |
    23|| **Process pauses** | GC, page faults, scheduling delays |
    24|
    25|## Clocks
    26|
    27|### Time-of-Day Clock
    28|
    29|- System clock (e.g., `System.currentTimeMillis()`)
    30|- Synced via NTP (Network Time Protocol)
    31|- **Problem:** Can jump forward/backward
    32|- **Use for:** Timestamps, human-readable time
    33|
    34|### Monotonic Clock
    35|
    36|- Always moves forward (e.g., `System.nanoTime()`)
    37|- Good for measuring durations
    38|- **Cannot** be synced across machines
    39|- **Use for:** Timeouts, measuring elapsed time
    40|
    41|### Clock Synchronization Issues
    42|
    43|| Issue | Description |
    44||-------|-------------|
    45|| **NTP drift** | Clocks diverge between syncs |
    46|| **Clock jump** | NTP adjusts time forward/backward |
    47|| **Quartz drift** | Hardware clock drift (~6 sec/day) |
    48|
    49|> **Key insight:** You cannot assume `time(A) < time(B)` just because A happened before B in real time.
    50|
    51|## Process Pauses
    52|
    53|### GC (Garbage Collection)
    54|
    55|- Stop-the-world GC can pause for seconds
    56|- Application doesn't know it's paused
    57|- Other nodes may declare it dead
    58|
    59|**Mitigation:**
    60|- Low-latency GC (ZGC, Shenandoah)
    61|- Removing time-sensitive logic from application
    62|
    63|### Response Time Guarantees
    64|
    65|| Approach | Description |
    66||----------|-------------|
    67|| **Real-time systems** | Guaranteed response times (rare in practice) |
    68|| **Timeouts** | Detect suspected failures |
    69|| **Retry with backoff** | Handle transient failures |
    70|
    71|## Failure Detection
    72|
    73|### Heartbeats
    74|
    75|Nodes periodically send "I'm alive" messages.
    76|
    77|**Timeout-based:**
    78|- If no heartbeat for N seconds → declare dead
    79|- **Problem:** Too short = false positives, too long = slow detection
    80|
    81|### Accrual Failure Detection
    82|
    83|Instead of binary alive/dead, output **suspicion level** (probability of failure).
    84|
    85|**Examples:** Phi Accrual Failure Detector (used in Cassandra)
    86|
    87|## Related
    88|- [[Designing Data-Intensive Applications]]
    89|- [[DDIA — Consistency and Consensus]]
    90|