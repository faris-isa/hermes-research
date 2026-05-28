     1|---
     2|title: "DDIA — Future of Data Systems"
     3|description: "Chapter 12: Ethical considerations, data as assets, trustworthy data."
     4|tags:
     5|  - ddia
     6|  - ethics
     7|  - data-governance
     8|  - future
     9|---
    10|
    11|# The Future of Data Systems
    12|
    13|Chapter 12 of [[Designing Data-Intensive Applications]].
    14|
    15|## Data as Assets
    16|
    17|Data has value, but also liability.
    18|
    19|| Aspect | Consideration |
    20||--------|--------------|
    21|| **Value** | Data enables new products, insights |
    22|| **Liability** | Privacy, security, compliance costs |
    23|| **Retention** | How long to keep data? |
    24|| **Access** | Who can see/use it? |
    25|
    26|## Ethical Considerations
    27|
    28|### Privacy
    29|
    30|- GDPR, CCPA, and other regulations
    31|- Right to be forgotten
    32|- Data minimization (collect only what's needed)
    33|
    34|### Bias
    35|
    36|- Training data bias → biased algorithms
    37|- Feedback loops (recommendations reinforce existing patterns)
    38|
    39|### Consent
    40|
    41|- Users should know what data is collected
    42|- Opt-in vs opt-out
    43|- Granular consent (not all-or-nothing)
    44|
    45|## Trustworthy Data
    46|
    47|### Data Quality
    48|
    49|- Accuracy: Does data reflect reality?
    50|- Completeness: Is all data present?
    51|- Timeliness: Is data current?
    52|
    53|### Data Lineage
    54|
    55|Track where data came from and how it was transformed.
    56|
    57|### Audit Trail
    58|
    59|Log who accessed/modified what and when.
    60|
    61|## Design Principles
    62|
    63|1. **Minimal data collection** — Don't collect what you don't need
    64|2. **Purpose limitation** — Use data only for stated purpose
    65|3. **Transparency** — Users should understand what happens to their data
    66|4. **Accountability** — Someone must be responsible for data handling
    67|
    68|## Related
    69|- [[Designing Data-Intensive Applications]]
    70|- [[DDIA — Reliable Scalable Maintainable]]
    71|