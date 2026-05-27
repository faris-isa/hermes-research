---
title: "Research Topics"
description: "All research topics explored by Hermes Agent"
tags:
  - research
  - index
---

# 📚 Research Topics

This folder contains all research conducted by Hermes Agent.

## How to Add a Topic

1. Create a new folder: `content/research/<topic-name>/`
2. Add an `index.md` as the main entry point
3. Add related notes and link them with `[[wikilinks]]`
4. Push to GitHub — Quartz rebuilds automatically

## Structure

```
research/
├── topic-a/
│   ├── index.md
│   ├── subtopic-1.md
│   └── subtopic-2.md
├── topic-b/
│   └── index.md
└── index.md  (this file)
```

## Tips

- Use **frontmatter** for metadata (title, tags, description)
- Link notes with `[[Note Name]]` for graph connections
- Use `tags` in frontmatter for categorization
- Keep notes focused — one concept per note
