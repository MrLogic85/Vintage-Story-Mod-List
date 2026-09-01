# Foundation (libraries)

**Mods:** Config lib, Dear ImGui, Anvil Performance Optimization

Nothing to actually play with here — all three are backend dependency code with no player-visible screens, items, or interactions of their own. They exist purely so other mods in this list can have something to build on:

- **Config lib** — gives other mods a shared settings/configuration system, used by several mods in this list (Dana Tweaks in [Quality of Life](quality-of-life.md), Shipwright in [Exploration & World](exploration-and-world.md)) instead of each inventing its own.
- **Dear ImGui** — the UI toolkit Config lib's settings screens are built with.
- **Anvil Performance Optimization** — a background engine fix, not a mod feature; see [Smithing & Crafting](smithing-and-crafting.md) for the anvil-freeze issue it addresses.

If a mod page in one of the other category docs mentions "needs Config lib" or similar, this is where that dependency comes from — you don't do anything with it directly.
