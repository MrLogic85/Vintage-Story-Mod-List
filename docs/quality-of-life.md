# Quality of Life

**Mods:** HUD Clock, MoreHudBars, Extra Info, Extra Overlays, Dana Tweaks, Xandu's Inventory Tweaks Fork, Carry On, Place on slabs, Terrain Slabs, Player Corpse

## Information on screen

**HUD Clock** shows in-game date/time, season (as a large icon), ambient temperature, and wind — plus optional extra lines you can toggle on: body temperature ("cool" through "FREEZING"), apparent/"feels like" temperature, rainfall level, rift activity, temporal storm warnings (its own sub-HUD), what type of room you're standing in (cellar/room/greenhouse), claim ownership, moon phase, intoxication percentage, and even a real-world clock. Open settings with **Shift+O**, toggle the main HUD with **Ctrl+U**, toggle the storm HUD with **Ctrl+I** — all rebindable, with 3 icon themes to choose from.

**MoreHudBars** adds 4 bars vanilla doesn't have: Liquid Container level, Food Portion, Backpack Slots Filled, and Clothing Condition (gear durability at a glance). Each one can be independently switched on/off and restyled.

**Extra Info** adds real numbers to things vanilla only shows qualitatively: crafting and fuel progress bars with both real-time and in-game-time estimates, workstation temperature, break-time estimates, and stack counts on tooltips. In the handbook it adds animal diets, trader stock and prices, sapling growth timelines, and entity drops. Concretely, you'll see things like a crop's exact growth stage and hours until the next one, bloomery/furnace progress percentages, an animal's pregnancy/lactation status, quern grinding progress, and panning odds.

**Extra Overlays** floats a colored health bar above nearby creatures automatically — no need to look directly at them. It fades from green to yellow to red as the creature loses health, defaults to showing up to 15 creatures within 10 blocks, and has no in-game menu — configuring it means editing `attr.json` in the mod folder and rejoining the world.

## Dana Tweaks: a long list of small fixes

Too many individual tweaks to use daily without knowing they exist, so the ones worth knowing about:

- Dropped seeds auto-plant themselves
- Ctrl+X opens/closes a crate's lid; Shift+X toggles its label
- Containers auto-close behind you (hold Ctrl to stop that)
- Logs now yield 4 planks instead of vanilla's 2
- Firepits heat adjacent ovens
- Sleeping players wake up if they get hungry
- A branch cutter tool, a rain collector, and expanded scythe harvesting
- On the client side: auto-panning, auto walk/run/swim, and configurable recipes-per-row in crafting UIs

The rest is genuinely a grab-bag (drifters opening unlocked doors unless you padlock them, expanded oven fuel options, recycling metal blocks and old clothes into bits, and more) — worth skimming the mod's own page once if you want the full list.

## Xandu's Inventory Tweaks Fork: inventory management keybinds

- **Z** — auto-sort your inventory into matching open chests (works across multiple open chests at once)
- **Z + Shift** — sort an open container by item ID
- **Z + Ctrl** — pull all matching items from open chests into your own inventory
- **Z + Alt** — sort your own backpack
- **Ctrl + left-click** — transfer a whole stack up to a matching slot in an open container
- **Shift + scroll wheel** — push or pull single items to/from an open container

It also auto-swaps a replacement into your hotbar when a consumable runs out or a tool needs repair, and sort priority (durability, attack power, stack size, tool type, light emission, food value) is configurable, along with slot-locking and container blacklisting.

## Carry On: what you can pick up

**Sneak + hold right-click** on a supported block (both hands need to be empty) to pick it up — you'll see a progress circle while it happens. Carryable in your hands: chests, barrels, vessels, anvils, crates, planters, querns, reed baskets, resonators, and storage vessels. A smaller set — notably reed baskets — can go on your **back** instead, with zero movement penalty. To put something on your back: sneak + hold right-click while not aiming at a block, or Ctrl+aim. Drop or place it the same way you picked it up.

A few real consequences: you can't sprint while hand-carrying something, movement is slowed while carrying containers (the penalty is configurable per block type), taking damage drops whatever's in your hands, and dying drops back-slot items at your death location. You can still open doors and containers while carrying, just with a short delay. Multi-block carryables have limited support — dropping one carelessly can delete other blocks, so be deliberate about where you set those down.

## Place on slabs + Terrain Slabs: no more one-block hops

**Place on slabs** lets you place non-solid blocks — chests, bowls, torches, anvils, flowers, ground-storage items, stackable bushes, bookshelves — onto any horizontal slab using normal placement, no special keybind needed.

**Terrain Slabs** works automatically during world generation, replacing jagged single-block terrain edges with slab variants so you're not constantly hopping up and down 1-block ledges. It runs in one of two modes: Column (the default — scans the full chunk column and affects caves too) or Surface (heightmap-only, faster, no cave effect). To smooth terrain you've already generated, run `/ts s c <range>` — e.g. `/ts s c 500`. Slabs drop as regular blocks when harvested, so they don't bloat your inventory, and can be hand-crafted directly too. It needs Place on slabs installed to actually place objects on the resulting slabs correctly.

## Player Corpse: dying doesn't lose everything

On death, a skeleton corpse spawns at the death location holding your full inventory, and a waypoint gets created there automatically. Only you (or a creative-mode player) can loot it for a configurable window — 240 in-game hours (about 10 days) by default — after which it opens up to anyone. Hold right-click on the corpse to retrieve your items. Craft a **compass item** to search a 7×7 chunk area for nearby corpses if you've lost track of one. As a last resort, `/returnthings` recovers items from up to your last 10 deaths, even if a corpse failed to spawn or got lost entirely.

## Putting it together

Turn on whichever HUD/info mods you actually want cluttering your screen — they're all independent. Learn Xandu's Inventory Tweaks' Z-key sorting early; it's the single biggest time-saver in this category once you're managing a real base's worth of storage. Carry On changes how you move loot around entirely — use it as your default instead of breaking things down first. Don't panic about death: Player Corpse means you'll get your gear back if you can make it to the waypoint within the retrieval window.
