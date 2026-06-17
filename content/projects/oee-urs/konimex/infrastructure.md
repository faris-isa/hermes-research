---
title: "Konimex — Infrastructure Requirements"
description: "Infrastructure requirements (1.9) for the Konimex OEE Online system — SSO, network, server."
tags:
  - konimex
  - oee
  - urs
  - infrastructure
---

# Infrastructure Requirements (1.9)

| ID | Requirement | Solution | Notes |
|:---:|:---|:---:|:---|
| 1.9.1 | SSO + RBAC + VPN for remote access | Keycloak SSO | RBAC per-feature not yet detailed |
| 1.9.2 | Run on 1 Gbps network | — | — |
| 1.9.3 | Server specs: Intel Xeon Gold >3GHz 12 core, FO/Cat6, PostgreSQL/NoSQL, Linux | — | — |
| 1.9.4 | Dashboard via web browser | Web App | Lowest supported version TBD |
| 1.9.5 | Single central server, no local production server | — | — |
| 1.9.6 | Easy reconfiguration for device changes (HMI, PLC) | — | Currently manual config by developer |

---

*Source: URS FOOD2/URS/2026/001/00 | Section 1.9*
