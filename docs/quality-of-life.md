# Quality of Life

**Mods:** HUD Clock, MoreHudBars, Extra Info, Extra Overlays, Dana Tweaks, Xandu's Inventory Tweaks Fork, Carry On, Place on slabs, Terrain Slabs, Player Corpse

The largest category, and the least interdependent — most of these are independent, additive conveniences. A few do connect to each other, and those are worth knowing about.

## Information on screen

**HUD Clock** shows in-game time, weather, storms, rifts, rooms, and claims. **MoreHudBars** adds more configurable HUD bars beyond vanilla's health/hunger/temporal-stability. **Extra Info** surfaces extra detail on handbook entries, blocks, items, and entities. **Extra Overlays** adds mob health bars. All four are purely additive display information — none of them change game mechanics, just what you can see.

## Tweaks and fixes

**Dana Tweaks** is a QoL tweak compilation; its own docs recommend pairing it with **Config lib** (see [Foundation](foundation-libraries.md)) for managing its settings, and suggest alternatives for a couple of its features if you'd rather use something more specialized (Salty's Radial Crafting instead of its crafting tweak, for instance).

**Xandu's Inventory Tweaks Fork** exists for one specific reason: the original "Xandu's Inventory Tweaks" has a duplication exploit via the crafting grid's output slot, and the original hasn't fixed it. This fork patches that bug. If the original ever absorbs the fix, this fork becomes unnecessary — check `MOD_DB.json`'s tracked entry for the original before assuming that's happened.

## Building and hauling

**Carry On** lets you carry blocks, containers, and even animals instead of needing to break them down first — it's the mod that makes Butchering's "carry the animal home" workflow (see [Cooking & Food](cooking-and-food.md)) actually practical.

**Place on slabs** and **Terrain Slabs** work together: Place on slabs lets you place decorative items on slab surfaces, and Terrain Slabs (which **hard-depends on Place on slabs, version 1.1.3 or higher**) extends slab placement to natural terrain features. Install order doesn't matter since both are always present, but if you ever remove one, remove both — Terrain Slabs will not function without Place on slabs.

## When things go wrong

**Player Corpse** means dying drops your inventory into a corpse you can walk back to, rather than scattering items across the ground. Lowers the stakes of death without removing them entirely.

## How to actually use it

Turn on whichever HUD/info mods you personally want cluttering your screen — they're independent, so pick freely. Pair Dana Tweaks with Config lib from the start so its settings are actually manageable. Use Carry On liberally; it's designed to be a default habit, not a special-case tool. The Place on slabs / Terrain Slabs pair just works in the background once placed — no ongoing interaction needed.
