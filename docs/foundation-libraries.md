# Foundation (libraries)

**Mods:** CommonLib, Config lib, Dear ImGui, Anvil Performance Optimization

Nothing to actually play with here — all four are backend dependency code with no player-visible screens, items, or interactions of their own. They exist purely so other mods in this list *could* have something to build on:

- **CommonLib** — a shared utility library. A dependency scan of every mod in this list found nothing currently installed actually requires it — it's kept as a just-in-case for a future mod that might. A separate fork, CommonLib-Forked, was installed alongside it for a while on the assumption something might need one or the other specifically, but the same scan showed nothing needed that one either, and it's since been removed.
- **Config lib** — gives other mods a shared settings/configuration system, used by several mods in this list (Dana Tweaks in [Quality of Life](quality-of-life.md), Shipwright in [Exploration & World](exploration-and-world.md)) instead of each inventing its own.
- **Dear ImGui** — the UI toolkit Config lib's settings screens are built with.
- **Anvil Performance Optimization** — a background engine fix, not a mod feature; see [Smithing & Crafting](smithing-and-crafting.md) for the anvil-freeze issue it addresses.

If a mod page in one of the other category docs mentions "needs Config lib" or similar, this is where that dependency comes from — you don't do anything with it directly.
