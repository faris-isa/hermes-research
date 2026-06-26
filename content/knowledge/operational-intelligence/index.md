---
title: "Operational Intelligence — Literature Review"
description: "Research notes on OI: definition, architecture, relationship to MES/OEE, maturity model, and mapping to current Ajinomoto MES stack."
tags: [operational-intelligence, manufacturing, mes, oee, real-time, cep, stream-processing]
---

# 1. What is Operational Intelligence?

## 1.1 Definition

> **Operational Intelligence (OI)** is the process of collecting and analyzing **real-time operations data** to monitor system health and **pre-emptively** reduce issues.
> *— AWS*

> OI is a set of **business analytics systems designed for real-time decision-making**. It gathers diverse data feeds from ongoing business operations and external factors, analyzes them as data arrives.
> *— Splunk*

> **Real-Time Operational Intelligence (RtOI)** integrates data from machines, enterprise systems (ERP), and human operators to provide a **transparent, end-to-end view** of factory operations in real time.
> *— Matics*

**Key distinction:** OI is NOT just dashboards. It's the ability to **detect, decide, and act** in real time based on live operational data.

## 1.2 OI vs Related Concepts

### OI vs Business Intelligence (BI)

| Dimension | BI | OI |
| :--- | :--- | :--- |
| **Timeframe** | Historical (what happened) | Real-time (what's happening now) |
| **Decision horizon** | Strategic (monthly, quarterly) | Operational (this shift, this hour, right now) |
| **Data velocity** | Batch (hourly/daily) | Streaming (seconds to milliseconds) |
| **Primary user** | Finance, management, controlling | Production manager, shift lead, maintenance engineer |
| **Typical tools** | Power BI, Tableau, SAP Analytics | MES + stream processing + CEP |
| **Action** | Report → human decides later | Detect → automated response OR immediate alert |

> *Source: Nexus Integra — "BI focuses on decision making at the enterprise and business level. OI is the optimization of assets that leads to business benefit."*

**They are complementary**, not competing. OI feeds operational data into BI for broader strategic analysis.

### OI vs MES

MES is the **execution layer**; OI is the **intelligence layer** on top.

| Aspect | MES | OI |
| :--- | :--- | :--- |
| **Purpose** | Execute and record production | Analyze and act on operational data |
| **Data flow** | Collect → Normalize → Store | Correlate → Predict → Prescribe |
| **Scope** | Shop floor (production) | Cross-system (production + quality + maintenance + energy) |
| **Time focus** | Current job/batch | Patterns across time, predictive |
| **Output** | Reports, OEE scores | Alerts, automated actions, recommendations |

> *Source: Epsilon3 — "MES provides the operational intelligence layer between business planning and production execution."*

**Key insight:** MES is the **data foundation** for OI. You can't have OI without MES-level data collection and contextualization.

### OI vs Manufacturing Intelligence (MI)

> **Manufacturing Intelligence** is a capability, not a product. It's the discipline of collecting data from all shop floor systems, normalizing it into a single data model, and transforming it into actionable insights.
> *— Symestic*

MI and OI are largely synonymous in manufacturing context. MI emphasizes the **data infrastructure**; OI emphasizes the **real-time action**.

---

# 2. The Analytics Maturity Model

> *Source: Symestic — 4-Level Manufacturing Intelligence Maturity Model*

Most companies are at Level 1 or 2. The **value inflection point is at Level 3**.

| Level | Capability | Question | What It Looks Like |
| :---: | :--- | :--- | :--- |
| **1** | **Descriptive** | What happened? | Shift report with output & OEE, but no "why." Requires basic data collection (piece counts, run/stop). |
| **2** | **Diagnostic** | Why did it happen? | Downtime Pareto with root cause drill-down. Requires automatic downtime/alarm capture. *Example: Neoperl — 4 alarm codes caused 80% of losses, invisible in manual tracking.* |
| **3** | **Predictive** | What will happen? | "Machine 5 will need bearing replacement in 72 hours." Requires process parameter trending + pattern recognition. **Demands months of clean Level 2 data.** |
| **4** | **Prescriptive** | What should we do? | AI-driven parameter adjustments or order re-sequencing. Requires AI/ML models + closed-loop feedback. *95% of companies are NOT here yet.* |

> **Critical lesson:** Most companies overinvest in Level 3–4 ambitions while underinvesting in Level 1–2 foundations. MI maturity is sequential — you can't skip levels.

---

# 3. OI Architecture

## 3.1 How OI Works (Process)

> *Source: AWS*

1. **Data Collection** — Gather real-time streams (logs, metrics, performance data, user behavior) from IT systems and IoT devices.
2. **Data Processing & Analysis** — Use techniques like **Complex Event Processing (CEP)** to identify patterns across data streams. Filtering, aggregating, transforming.
3. **Visualization & Reporting** — Dashboards and reports. Alerts when predefined criteria are met. **Automated actions** triggered (shutting down services, adding new ones).
4. **Automated Adaptation** — ML learns from past decisions, continuously refining alert criteria and automated responses.

## 3.2 The 4-Layer Stack (Manufacturing)

> *Source: f7i.ai — Data Science in Manufacturing Case Studies (2026)*

Successful systems follow this architecture:

```
Layer 4: ACTION LAYER (CMMS / Automated Response)
   ↕  Detection → Work Order → Technician Dispatch → Resolution
Layer 3: ALGORITHM LAYER (The Brain)
   ↕  Supervised Learning (known patterns)
   ↕  Unsupervised Learning (anomaly detection)
   ↕  CEP (Complex Event Processing)
Layer 2: EDGE COMPUTING
   ↕  Local data processing, noise filtering, real-time alerts
Layer 1: DATA ACQUISITION (IIoT Sensors)
   ↕  Vibration, thermography, PLC data, OPC UA, MQTT
```

> **Critical insight:** Layer 4 (Action) is the most neglected. A dashboard alarm that nobody acts on is worthless.

## 3.3 The Closed-Loop Pattern

The difference between success and failure:

**Open Loop (FAILURE):**
- Dashboard alarm blinks
- Operator ignores for quota
- Maintenance manager doesn't see it
- Data logged, no action
- **Result: Failure occurs**

**Closed Loop (SUCCESS):**
- Algorithm detects trend
- System checks spare parts inventory
- "High Priority" work order pushed to lead's phone
- Work order includes **prescriptive instructions**
- **Result: Issue resolved proactively**

> *Source: f7i.ai — "Data Science detects; CMMS executes. No successful case study lacks both."*

## 3.4 Core Technologies

| Technology | Role | Examples |
| :--- | :--- | :--- |
| **Stream Processing** | Handle high-volume continuous data | Apache Flink, Kafka Streams |
| **Complex Event Processing (CEP)** | Pattern detection across multiple streams | Flink CEP, Esper, ksqlDB |
| **Time-Series Database** | Store and query temporal data | InfluxDB, TimescaleDB |
| **Edge Computing** | Local processing, reduce latency | AWS IoT Greengrass, Azure IoT Edge |
| **ML/AI** | Predict and prescribe | Anomaly detection, predictive maintenance |
| **Automation/Orchestration** | Trigger actions without human intervention | CMMS integration, workflow engines |

---

# 4. Complex Event Processing (CEP)

> *Source: IBM, Confluent, Databricks*

## 4.1 Definition

CEP detects **meaningful patterns and relationships across continuous streams of events** in real time. It operates within a moving time window, evaluating each event in relation to all other events.

> **Key capability:** CEP can fire on **what did NOT happen** (e.g., unconfirmed payment, missing heartbeat, expected production count not reached). This is native to CEP but difficult in standard stream analytics.

## 4.2 CEP vs Related Technologies

| Comparison | Difference |
| :--- | :--- |
| **CEP vs ESP (Event Stream Processing)** | ESP operates on a single stream (filters, transforms). CEP reasons across **multiple streams**, looking for combinations within a window. |
| **CEP vs CDC (Change Data Capture)** | CDC is a data movement mechanism. CEP is a pattern detection layer that can consume CDC output. *Complementary.* |
| **CEP vs Anomaly Detection** | Anomaly detection: "Is this single data point unusual?" CEP: "Is this **sequence** of events meaningful?" |
| **CEP vs BRMS (Business Rules)** | BRMS evaluates rules against current state. CEP evaluates rules across events **as they unfold over time**. |

## 4.3 CEP Pipeline

```
Event Sources → Ingestion (Kafka) → Stateful Window Management (Flink)
   → Pattern Detection & Rule Evaluation → Aggregation & Correlation
   → Automated Response (milliseconds)
```

> **IBM:** "ML works in the past. CEP works in the present. Together they cover the full reasoning pipeline."

## 4.4 Manufacturing CEP Examples

- **Pattern:** Machine vibration rises steadily over 4 hours + temperature exceeds threshold → **Predict: bearing failure in 24h**
- **Pattern:** Cycle time increasing across 3 consecutive batches + reject rate climbing → **Alert: tool wear**
- **Pattern:** Line idle for >5 min + upstream buffer full + downstream buffer empty → **Detect: mechanical jam**
- **Anti-pattern:** Expected production count NOT reached by shift end → **Alert: investigate**

---

# 5. Real-World Results

## 5.1 RtOI Results (Matics customers)

- **25% increase** in machine availability
- **30% decrease** in rejects
- **10% reduction** in energy consumption

## 5.2 Case Studies (f7i.ai, 2026)

| Case | Industry | Problem | Solution | Result |
| :--- | :--- | :--- | :--- | :--- |
| Vibrating Conveyor | Food & Bev | Micro-stoppages (30x/day, 2 min each) | Vibration + current sensors → anomaly detection → CMMS work order | **18% drop** in unplanned downtime |
| Energy Leak | Automotive | Rising energy bills, flat production | Flow meters → regression model → digital twin → CMMS task | **12% reduction** in energy waste |
| Golden Batch | Pharma | Inconsistent batch yields | Time-series sensors → Random Forest → real-time operator guidance | **8% improvement** in yield consistency |

## 5.3 Predictive Maintenance General

> *Source: LatentView, SR Analytics*

- Predictive analytics reduces unplanned downtime by **30–50%**
- Demand forecasting accuracy improves by **20–30%**
- Maintenance costs cut by **25–30%**
- Eliminates **70–75% of breakdowns**

---

# 6. The MES → OI Evolution

> *Source: Vertech — "Is MES Dead?" (Darren Phipps, ~30 years MES experience)*

## 6.1 From Purdue Model to MOM Model

**Traditional (Purdue/ISA-95):** Hierarchical, siloed pyramid (Levels 0–4). Data flow slow, information compartmentalized.

**Modern (MOM):** Flatter, interconnected ecosystem. Silos removed, real-time data sharing.

> "The line is getting blurry between Level 3 systems (MES, QMS, LIMS) and Level 4 systems (ERP, MRP, PLM)."

## 6.2 Key Enablers

- **Smart Factory, IIoT, Industry 4.0** — integrating OT and IT data
- **APIs, MQTT, Cloud** — seamless data flow
- **Unified Namespace (UNS)** — single source of truth

## 6.3 MES Data Process (How MES Becomes OI)

> *Source: Premier Tech Digital*

```
Collection → Normalization & Contextualization → Serialization & Historization
   → Analysis → Visualization → Integration
```

Each step adds value. The MES becomes OI when it reaches the **Analysis** stage with real-time capability.

## 6.4 Guiding Principles (Vertech)

1. **Acknowledge it's a journey** — not a quick fix
2. **Create a high-level strategy** — flexible roadmap, involve actual users
3. **Stay agile and iterate** — short-term 8–12 week initiatives
4. **Focus on quick, high-impact wins** — build momentum

---

# 7. Mapping to Current Ajinomoto MES Stack

## 7.1 Current State (from docs-urs-oee)

### What We Have

| Component | Role | OI Relevance |
| :--- | :--- | :--- |
| **ECU / OPC UA** | Machine data acquisition | ✅ Layer 1 (Data Acquisition) |
| **Kafka** | Message broker | ✅ Event ingestion backbone |
| **Flink** | Stream processing (secondly data) | ✅ Layer 2 (Edge/Processing) — but only writes to Cassandra, no CEP |
| **Downtime Detector** | Detects downtime start/end | 🔶 Layer 3 (partial) — reactive, not predictive |
| **Cassandra** | Time-series storage | ✅ Data foundation |
| **Backend (TypeScript)** | REST API, aggregation | ✅ Layer 3 (descriptive analytics) |
| **Frontend (mes-ui)** | Dashboards | ✅ Visualization |
| **OEE Monitoring** | A × P × Q decomposition | ✅ Level 1 (Descriptive) — "what happened" |
| **Grafana / Metabase** | Analytics dashboards | ✅ Visualization |

### What We DON'T Have (OI Gaps)

| Gap | Impact | OI Level |
| :--- | :--- | :--- |
| **No CEP / Pattern Detection** | Can't correlate events across streams (e.g., vibration + cycle time + reject rate) | Level 2→3 |
| **No Predictive Models** | Can't forecast failures or quality drift | Level 3 |
| **No Closed-Loop Automation** | Alerts don't trigger work orders or maintenance actions | Level 3→4 |
| **No Cross-System Correlation** | Production data, maintenance data, quality data are siloed | Level 2→3 |
| **No Edge Intelligence** | All processing is centralized, no local anomaly detection | Level 2→3 |
| **Downtime detection is reactive** | Detects after the fact, not before | Level 1→2 |

### Current Analytics Maturity Assessment

```
Level 1 (Descriptive): ✅ DONE — OEE dashboards, shift reports, downtime tracking
Level 2 (Diagnostic):  🔶 PARTIAL — Pareto analysis exists, but no root cause automation
Level 3 (Predictive):  ❌ NOT STARTED — No models, no pattern detection
Level 4 (Prescriptive): ❌ NOT STARTED — No automated actions
```

## 7.2 Future State (KAIDO Pipeline — from docs-urs-oee)

The planned KAIDO pipeline already moves toward OI:

| KAIDO Component | OI Role |
| :--- | :--- |
| **Bronze (raw_telemetry)** | Unlimited raw data retention — foundation for ML training |
| **Flink + Debezium CDC** | Stream processing with master data enrichment — ready for CEP |
| **Dead Letter Queue** | Data quality handling — bad data doesn't break pipeline |
| **Silver (enriched)** | Contextualized data — the "clean data" that OI needs |
| **Gold (aggregated)** | Pre-computed reports — fast dashboards |
| **Airflow orchestration** | Batch + stream job management — can orchestrate ML inference |
| **Timescale** | Time-series DB — better for analytics than Cassandra |

**KAIDO is the data foundation for OI.** But the OI layer (CEP, ML, closed-loop) is not yet designed.

## 7.3 The Gap: What's Missing for OI

To go from MES to OI, we need to add on top of the KAIDO pipeline:

```
CURRENT (MES):
  OPC UA → Kafka → Flink → Timescale (Bronze/Silver/Gold) → Backend → Frontend
  [Data Collection]  [Processing]    [Storage]                  [API]    [Dashboards]

NEEDED (OI):
  OPC UA → Kafka → Flink+CDC → Timescale → [NEW LAYER] → Action
                                        ↓
                              CEP Engine (pattern detection)
                              ML Models (predictive)
                              Alert Engine (threshold + anomaly)
                              Closed-Loop (CMMS / auto-action)
                              Cross-System Correlation
```

**The new layer sits between Silver/Gold and the Action layer.**

---

# 8. Sources

| # | Source | URL |
| :-: | :--- | :--- |
| 1 | AWS — What is Operational Intelligence? | https://aws.amazon.com/what-is/operational-intelligence/ |
| 2 | Splunk — Operational Intelligence: 6 Steps | https://www.splunk.com/en_us/blog/learn/oi-operational-intelligence.html |
| 3 | Logical Systems — Operational Intelligence | https://www.logicalsysinc.com/digital-transformation/operational-intelligence |
| 4 | Premier Tech Digital — How MES Transforms Data into OI | https://www.ptdigital.com/article/how-mes-transforms-data-operational-intelligence |
| 5 | Vertech — Is MES Dead? (Darren Phipps) | https://www.vertech.com/blog/is-mes-dead-how-to-shift-from-execution-to-intelligence |
| 6 | Matics — Real-Time Operational Intelligence | https://matics.live/blog/real-time-operational-intelligence |
| 7 | Symestic — Manufacturing Intelligence | https://www.symestic.com/en-us/what-is/manufacturing-intelligence |
| 8 | IBM — Complex Event Processing | https://www.ibm.com/think/topics/complex-event-processing |
| 9 | Confluent — Complex Event Processing | https://www.confluent.io/learn/complex-event-processing |
| 10 | f7i.ai — Data Science in Manufacturing Case Studies | https://f7i.ai/blog/beyond-the-hype-successful-case-studies-of-data-science-in-manufacturing-how-to-replicate-them |
| 11 | Nexus Integra — BI vs OI | https://nexusintegra.io/business-intelligence-vs-operational-intelligence |
| 12 | LatentView — Predictive Analytics in Manufacturing | https://www.latentview.com/blog/predictive-analytics-in-manufacturing |
| 13 | Redpanda — Complex Event Processing Architecture | https://www.redpanda.com/guides/event-stream-processing-complex-event-processing |
| 14 | Epsilon3 — MES as Operational Intelligence Layer | https://www.epsilon3.io/behind-the-console/manufacturing-execution-system |
