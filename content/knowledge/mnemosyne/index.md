---
title: "Mnemosyne"
description: "Zero-dependency, sub-millisecond AI memory system with BEAM architecture."
tags:
  - ai-memory
  - sqlite
  - vector-search
  - mcp
---

# Mnemosyne

**What it is:** A universal AI memory layer that gives agents persistent memory across sessions. SQLite-backed, sub-millisecond, zero external services.

**Who uses it:** Any AI agent framework — Hermes, Claude Code, Cursor, Codex, OpenWebUI, custom agents.

**Core idea:** One `pip install`, one SQLite database. No Redis, no Pinecone, no managed vector DB.

---

## Architecture: BEAM

BEAM = Bilevel Episodic-Associative Memory. Three layers:

### 1. Working Memory (Hot Context)

- Auto-injected before every LLM call
- TTL-based eviction (configurable halftime, default 168 hours)
- Max items configurable (default 10,000)
- Recent + important memories surface here

### 2. Episodic Memory (Long-Term)

- Persistent storage with hybrid search
- SQLite-vec (vector similarity) + FTS5 (keyword search)
- Binary vectors: 384-dim float32 → 48 bytes (32x compression)
- Hamming distance search inside SQLite — no ANN indices

### 3. TripleStore (Temporal Knowledge Graph)

- Facts as (subject, predicate, object) triples
- Temporal versioning — tracks when facts change
- Entity-relationship mapping

---

## Hybrid Scoring

Every recall combines three signals:

| Component | Weight | What it does |
|-----------|--------|--------------|
| Vector similarity | 50% | Semantic meaning via embeddings |
| FTS5 keyword rank | 30% | Exact keyword matching |
| Importance score | 20% | Recency + frequency + explicit importance |

All computed inside SQLite — no external ranking service.

---

## Binary Vector Compression

The key innovation. Instead of storing full float32 embeddings:

1. Information-theoretic binarization (MIB)
2. 384 dimensions × 4 bytes = 1,536 bytes → 48 bytes
3. 32x storage reduction
4. Hamming distance for search (bitwise XOR + popcount)
5. No approximate nearest neighbor indices needed

---

## Integration Points

### MCP Server

Works with any MCP client (Cursor, Claude Code, Codex, Windsurf):

```json
{
  "mcpServers": {
    "mnemosyne": {
      "command": "mnemosyne",
      "args": ["mcp"]
    }
  }
}
```

### Python SDK

```python
from mnemosyne import remember, recall

remember("User prefers dark mode")
results = recall("user preferences")
```

### CLI

```bash
mnemosyne remember "some fact"
mnemosyne recall "query"
mnemosyne sleep          # Run consolidation
mnemosyne export --output backup.json
```

### Hermes Plugin

Hooks into agent lifecycle:

| Hook | Behavior |
|------|----------|
| `pre_llm_call` | Injects relevant working memory into prompt |
| `on_session_start` | Initializes session-scoped memory state |
| `post_tool_call` | Captures tool results as memories |

---

## Benchmarks

### LongMemEval (Retrieval)

| System | Score |
|--------|-------|
| Mnemosyne (dense) | 98.9% Recall@All@5 |
| Mempalace | 96.6% |
| Backboard | 93.4% |

### BEAM (End-to-End QA at 100K scale)

| System | Score |
|--------|-------|
| Mnemosyne | 65.2% |
| Hindsight | 73.4% |
| Honcho | 63.0% |
| RAG baseline | 32.3% |

### Retrieval Scaling

| Scale | Recall@10 | Latency | Storage |
|-------|-----------|---------|---------|
| 100K messages | 20% | 372ms | 1.8 MB |
| 1M messages | 20% | 493ms | 4.8 MB |
| 10M messages | 20% | 35ms | 7.2 MB |

Recall holds flat across all scales. 100% abstention accuracy — never hallucinates on unknowns.

---

## Configuration

Key environment variables:

| Variable | Default | Purpose |
|----------|---------|---------|
| `MNEMOSYNE_DATA_DIR` | `~/.hermes/mnemosyne/data` | Database location |
| `MNEMOSYNE_VEC_TYPE` | `int8` | Vector compression (`float32`, `int8`, `bit`) |
| `MNEMOSYNE_VEC_WEIGHT` | `0.5` | Vector similarity weight |
| `MNEMOSYNE_FTS_WEIGHT` | `0.3` | FTS5 keyword weight |
| `MNEMOSYNE_IMPORTANCE_WEIGHT` | `0.2` | Importance weight |
| `MNEMOSYNE_WM_MAX_ITEMS` | `10000` | Working memory limit |
| `MNEMOSYNE_RECENCY_HALFLIFE` | `168` | Decay halflife in hours |

---

## Data Structure

```
~/.hermes/mnemosyne/
├── data/
│   ├── mnemosyne.db          # Main SQLite database (BEAM + legacy)
│   ├── triples.db            # Standalone TripleStore
│   └── banks/<name>/mnemosyne.db  # Named memory banks
└── logs/
    └── diagnose_*.jsonl      # Diagnostic logs
```

---

## Memory Migration

When moving from built-in memory to Mnemosyne:

1. Read existing memory files (e.g., `MEMORY.md`, `USER.md`)
2. Split by delimiter (e.g., `§`)
3. Import each chunk via `mnemosyne remember`
4. Verify with `mnemosyne recall`

---

## Key Design Decisions

| Decision | Why |
|----------|-----|
| SQLite over managed DB | Zero dependencies, sub-ms latency, portable |
| Binary vectors | 32x compression, search inside SQLite |
| Hybrid scoring | Combines semantic + keyword + importance |
| TTL-based eviction | Working memory stays fresh |
| Temporal triples | Tracks how facts change over time |
| MCP server | Universal agent compatibility |

---

## Limitations

- English-optimized embeddings by default (multilingual requires model swap)
- No built-in REST API (MCP only)
- Single-process writes (SQLite locking)
- Consolidation (sleep) needed periodically for optimal performance

---

*Mnemosyne is installed and active in Hermes. Memories are stored at `~/.hermes/mnemosyne/data/mnemosyne.db`.*
