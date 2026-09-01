# Foundation (libraries)

**Mods:** CommonLib, CommonLib-Forked, Config lib, Dear ImGui, Anvil Performance Optimization

You won't interact with anything in this category directly — these are dependency libraries other mods build on. They're documented here so it's clear *why* each one is installed, since none of them do anything visible on their own.

## CommonLib and CommonLib-Forked (both installed, on purpose)

This is the one genuinely confusing pairing in the whole list, so it's worth explaining plainly: **both are needed, and they are not interchangeable.**

- **CommonLib** (the original, by DArkHekRoMaNT) hasn't been updated past game 1.21.x.
- **CommonLib-Forked** (by sknnr/jsknnr) was made specifically to keep pace with current game versions, and its own description warns it "will not work with [the original author's] other mods."

Whatever other installed mod depends on the *original* package needs the original; whatever depends on the *fork* needs the fork. Removing either one risks breaking whatever's quietly depending on it. Leave both alone.

## Config lib + Dear ImGui (paired dependency)

**Config lib** gives content mods a shared place to expose configuration options, rather than every mod inventing its own settings system. It depends on **Dear ImGui** (Vintage Story's immediate-mode GUI library) — specifically version 1.2.0 or higher. If you ever update Config lib, check whether it bumped its Dear ImGui requirement and update that too; that's exactly what happened during this list's last version bump (Config lib 1.13.1 needed Dear ImGui 1.2.0+, so both were updated together).

## Anvil Performance Optimization

Not a general-purpose library, but grouped here because it's infrastructure rather than content: it prewarms a vanilla engine cache to eliminate the freeze that happens the first time you look at an anvil. See [Smithing & Crafting](smithing-and-crafting.md) for how this pairs with SmithingPlus Bug Fix to cover the anvil-freeze issue from both the mod side and the engine side.

## How to actually use it

Nothing to do here — these install and stay out of the way. The only maintenance concern is version pinning: if you ever bump Config lib or Dear ImGui independently, check the other's version requirement first, and never remove just one half of the CommonLib pair without confirming nothing else in the list still needs it.
