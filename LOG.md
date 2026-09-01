# Mod Update Log — Index

Each work session gets its own file under `AgentLogs/` (not `logs/` or `Logs/` — those collide with Vintage Story's own log folder on Windows' case-insensitive filesystem), named `YYYY-MM-DD.md` (append `-2`, `-3`, etc. if more than one session happens on the same date). This file just indexes them, newest first — the actual entries (updates, reverts, removals, patch-mod swaps, and any other decisions worth a paper trail) live in the session files themselves.

<!-- Example index entry:
- [2026-09-01](AgentLogs/2026-09-01.md) — updated carrycapacity to 1.9.3 for 1.20.4 compatibility
-->

- [2026-09-01](AgentLogs/2026-09-01.md) — initial mod audit (MOD_DB populated for all 40 mods), updated configlib and vsimgui, kept both CommonLib variants, restructured MOD_DB to JSON/schema v2 with tracked originals, installed smithingplusbugfix + anvilperformanceoptimization for the anvil-freeze bug, added AgentBackupSaves/ + pre-session backup rule, installed temporalsreformed (skipped Combat Overhaul entirely), skipped Overhaul lib + Primitive Survival, installed shipwright for boats, set up the repo for git publishing and pushed 3 commits (67fb9d0, aaca896 privacy fix, + Git auto-install step) to github.com/MrLogic85/Vintage-Story-Mod-List, added a docs/ page per category then rewrote all 8 as actual gameplay guides after user feedback that the first pass was curation notes, not a user guide, then fixed two Cartographer command errors a user question surfaced
