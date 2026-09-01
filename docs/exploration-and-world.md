# Exploration & World

**Mods:** BetterRuins, Plains and Valleys, Farseer, More Lanterns, Shipwright, Auto Map Markers, Cartographer

## BetterRuins: things worth finding

Adds over 600 structures across several categories: small ruins and graves (including waystones), underground passages, dungeons, and mine excavations, full villages (multiple distinct tilesets, including Forest Village and Clay Villages), megastructures (castles, mansions, aqueducts, bathhouses), Forlorn Hope towers and their variants, named story locations (Huaca, The Panopticon, Coal Mine, University, Sunrift Experiment), surface and underground translocators, churches and religious sites, and trading posts.

What's in them: collectible blueprints that unlock crafting for otherwise-unobtainable items, treasure maps that lead to further locations, an expanded loot pool, custom lore items, building materials, and unique items including temporal artifacts.

## Plains and Valleys: how the terrain itself changes

Not new content, a different shape to the world: flat lowlands, plains, and highlands dotted with lakes, hills, and mountains, with rough/jagged landforms made much rarer. Coastal flatlands, wetlands, and polar glaciers get their own treatment. Slopes between terrain types are smoothed instead of sheer cliffs, lake beds are smoother with fewer floating rock artifacts, and hills interfere less with the terrain around them, so you get fewer unnavigable pockets of land.

## Farseer: see further without doing anything

Fully passive — nothing to craft or configure to get the benefit. Renders a simplified heightmap silhouette of terrain out to roughly 4,000 blocks as atmospheric fog: elevation only, no structures or vegetation shown at that range. Heightmaps build automatically as you explore and are cached server-side, so the first pass through unexplored terrain is slower than revisiting somewhere you've already been. Open its settings with **Ctrl+Shift+F** if you want to adjust view distance or visual preferences.

## More Lanterns

19 lanterns in total. Named Japanese stone lantern variants — Yukimi, Kodai Maru Yukimi, Oribe Ikekomi, Okunoin Daitsuki — craftable in any rock type, with pieces crafted separately and then assembled. Paper lanterns are dyeable with new cyan and brown dye recipes (dye a batch of parchments at once in a barrel), and floating paper lantern variants exist too. Metal medieval-style lanterns let you adjust their light level with Ctrl+right-click, and there are modern-style lanterns as well.

## Shipwright: pick the right boat

All 8 boats are built in-world with a construction item, not crafted at a workbench:

- **Catboat** (sailed) — planks, boards, rope, hide; 4+ seats plus storage; single sail; can mount a jibsail, lantern, or name-plaque (jibsail and lantern share the same front slot, so pick one)
- **Drakkar** (sailed) — a multi-stage build from planks, rope, and hides; seats around a dozen plus storage; cloth sail; a figurehead slot that accepts custom chiseled blocks, a sail emblem, a Heraldry Banners-compatible flag, or a Draconis dragonhorn mount
- **Punter** (rowed) — pole-propelled, multiple seats, storage, and a lantern slot
- **Coracle** (rowed) — small, round, hide-built — an early-game option
- **Kayak** (rowed) — needs 4 prepared hides plus planks; small enough to carry in a regular inventory slot
- **Caballito de Totora** (rowed) — built from cattail or papyrus reed, also inventory-carriable
- **Reed Longboat** (rowed) — cattail or papyrus construction, medium size, early-game accessible
- **Papyrus Sailer** (hybrid) — papyrus-only, combines sailing and rowing in one boat

All of them have speed, acceleration, and turning tunable via Config lib, and sails can be recolored.

## Auto Map Markers: turn it on first

**Disabled by default** — enable it through the config menu (**Ctrl+Shift+M**), where you can also set the icon, color, and name per marker type. Once on, it auto-marks flora (resin, berries, mushrooms, flowers, fruit trees, wild crops, reeds), 14 surface ore types, 19 deep ore types, and miscellaneous finds (boats, beehives, translocators, colored clay, peat, high-fertility soil, meteoric iron, saltpeter), plus all 9 trader varieties. Choose how markers trigger: automatically on interact/harvest/break, by sneaking while looking at something, or via hotkey — up to 3 configurable marker hotkeys, plus a "delete nearest marker" hotkey.

## Cartographer

Works through both the map GUI and chat commands: `/waypoint share <id>` (shorthand `/wp share <id>`) shares one waypoint, `/waypoint shareall` (shorthand `/wp shareall`) shares every waypoint you have — but **only the ones that already exist at the moment you run it**, per the mod's own changelog. It's a one-time snapshot, not an ongoing auto-share: create a new waypoint after running `shareall` and it stays private until you share it too, individually or with another `shareall`. `/waypoint unshare <id>` and `/waypoint unshareall` reverse it. Shared waypoints go onto a dedicated "Shared Waypoints" map layer automatically for every player on the server — there's no acceptance step on the receiving end.

**Don't run `share`/`shareall` on pet waypoints** created by Pet Map Markers (see [Companions](companions.md)) — sharing them is explicitly flagged as causing problems, since those waypoints are meant to keep moving with the pet while Cartographer shares a frozen snapshot. Regular waypoints don't have this issue.

## Putting it together

Turn on Auto Map Markers before you start a real exploration push — it's off by default and easy to forget. Let Farseer and Plains and Valleys' smoother terrain do their thing passively while you travel. BetterRuins gives you actual destinations worth the trip; pick a Shipwright boat sized to how far you're going and whether you're bringing cargo or a group. Once you're playing with others, Cartographer's `/wp shareall` is the fast way to get everyone looking at the same map — just remember to re-run it after adding new waypoints, since it doesn't share automatically going forward.
