# Vintage Story Modlist

A curated modlist for Vintage Story focused on extending the base game.

## Installing (one-time setup)

This repo only contains the modlist itself (`MOD_DB.json`) — not the mod files, out of respect for each mod author's own distribution terms. The setup below sets you up to fetch them from the official source and stay in sync automatically.

1. Press **Win + R**.
2. Type this and press Enter:
   ```
   powershell -NoExit -Command "cd $env:APPDATA\VintagestoryData"
   ```
3. In the window that opens, paste the block below and press Enter. **First check the last line** — if Vintage Story isn't installed at `C:\Program Files\Vintagestory`, change that path to wherever `Vintagestory.exe` actually is on your PC before pasting:
   ```powershell
   git init
   git remote add origin https://github.com/MrLogic85/Vintage-Story-Mod-List.git
   git fetch
   git checkout -t origin/main
   .\setup.ps1 -Path "C:\Program Files\Vintagestory\Vintagestory.exe"
   ```
4. This creates a **"Vintage Story (Modded)"** shortcut on your desktop. Use that instead of your old shortcut from now on.

That's it. Every time you launch the game through that new shortcut, it pulls the latest modlist and updates your mods automatically before starting — nothing else to remember.

## How it works

`play.ps1` (what the new shortcut runs) does three things in order: `git pull` (fast-forward only — if that's not possible, or you're offline, it just warns and continues with the mods you already have), then `sync-mods.ps1`, then launches the game.

`sync-mods.ps1` reads `MOD_DB.json` and fetches each mod fresh from mods.vintagestory.at at the exact version recorded there — adding anything new, updating anything changed, and removing anything dropped from the list. It only ever touches mods it installed itself, so anything you've added personally is left alone. You can also run it by hand any time: `.\sync-mods.ps1` (pass `-ModsDir "path\to\Mods"` if yours is non-standard).

## Playstyle

This is vanilla-plus, not a total conversion: nothing here replaces Vintage Story's core loop, it deepens the parts worth lingering in and smooths out the parts that get in the way.

**Cooking is a real subsystem, not a chore.** A Culinary Artillery and Expanded Foods turn food prep into its own progression track, Butchering and Stone Bake Oven extend that into meat and baking, Real Smoke adds the atmosphere to match, and FoodShelves plus SpecializedBags Revived give you somewhere sensible to put it all.

**Smithing and crafting go deeper than vanilla.** SmithingPlus adds tool repair and quality-of-life to the anvil (with a hotfix for its worst rough edge), Knapster speeds up the fiddly parts of early tool progression, and QP's Chisel Tools rewards detail work. Stone Quarry adds a proper quarrying loop, and Durable Better Prospecting plus ProspectTogether make ore-hunting less of a guessing game — especially with others.

**Danger is deliberate, not constant.** Temporals Reformed makes temporal enemies individually threatening but rarer — the goal is a world where you avoid fights because they're genuinely risky, not because you're swarmed. BloodTrail makes wounded prey trackable, rewarding a hunt over a chase.

**Companions matter.** Pet AI and Wolf taming turn animals into long-term allies rather than mobile resources, with Pet Map Markers keeping track of where they've wandered off to.

**The world rewards exploring it.** BetterRuins and Plains and Valleys change what you find and where, Farseer lets you actually see the terrain you're heading toward, More Lanterns keeps it lit, and Shipwright adds a full range of boats — from inventory-sized coracles to a twelve-seat Drakkar — for getting there by water. Auto Map Markers and Cartographer keep track of it all, solo or shared with a group.

**Everything else stays out of your way.** HUD Clock, MoreHudBars, Extra Info, and Extra Overlays surface information vanilla hides; Carry On, Place on slabs, Terrain Slabs, and Xandu's Inventory Tweaks Fork remove friction from building and hauling; Player Corpse means death costs you a walk back, not your whole inventory.

## Categories

| Category | Mods |
|---|---|
| Cooking & Food | A Culinary Artillery, Expanded Foods, FoodShelves, Butchering, Stone Bake Oven, Real Smoke, SpecializedBags Revived, BetterTraders |
| Smithing & Crafting | SmithingPlus (+ Bug Fix), Knapster, QP's Chisel Tools, Stone Quarry (Standalone Repack), Improved Handbook Recipes (Fork) |
| Prospecting & Mining | Durable Better Prospecting, ProspectTogether |
| Companions | Pet AI, Wolf taming, Pet Map Markers, BedSpawn |
| Exploration & World | BetterRuins, Plains and Valleys, Farseer, More Lanterns, Shipwright, Auto Map Markers, Cartographer |
| Danger & Wildlife | Temporals Reformed, BloodTrail |
| Quality of Life | HUD Clock, MoreHudBars, Extra Info, Extra Overlays, Dana Tweaks, Xandu's Inventory Tweaks Fork, Carry On, Place on slabs, Terrain Slabs, Player Corpse |
| Foundation (libraries) | CommonLib, CommonLib-Forked, Config lib, Dear ImGui, Anvil Performance Optimization |

Full mod details, versions, fork/patch reasoning, and known incompatibilities are tracked in [`MOD_DB.json`](MOD_DB.json) (schema in [`MOD_DB.schema.json`](MOD_DB.schema.json)). Change history lives in [`AgentLogs/`](AgentLogs/).

## Current Versions

Game version: **1.22.7**

<details>
<summary>Installed mods (44)</summary>

| Mod ID | Version |
|---|---|
| aculinaryartillery | 2.0.0-dev.22 |
| anvilperformanceoptimization | 1.0.0 |
| apelanterns | 1.4.3 |
| bedspawnv2 | 1.7.1 |
| betterprospecting | 22.0.0-rc.1 |
| betterruins | 0.6.3 |
| bettertraders | 0.2.1 |
| bloodtrail | 1.2.5 |
| butchering | 1.14.3 |
| carryon | 1.14.3 |
| chiseltools | 1.17.6 |
| commonlib | 2.8.0 |
| commonlibforked | 2.8.1 |
| configlib | 1.13.1 |
| danatweaks | 4.1.0 |
| egocaribautomapmarkers | 5.0.3 |
| expandedfoods | 2.0.0-dev.14 |
| extrainfo | 2.2.1 |
| extraoverlaysm4 | 1.8.1 |
| farseer | 1.4.0 |
| foodshelves | 3.0.5 |
| hudclockpatch | 4.4.1 |
| improvedhandbookrecipesfork | 1227.0.5 |
| knapster | 4.0.0 |
| morehudbars | 1.2.0 |
| nbcartographer | 2.3.0 |
| petai | 5.1.1 |
| petmapmarkers | 0.1.0 |
| placeonslabs | 1.2.0 |
| plainsandvalleys | 1.0.13 |
| playercorpseforkedazu | 1.15.1 |
| prospecttogether | 2.2.1 |
| realsmoke | 1.3.1 |
| shipwright | 1.4.1 |
| smithingplus | 1.9.0-rc.1 |
| smithingplusbugfix | 2.0.1 |
| specialexpandedbags | 2.0.0 |
| stonebakeoven | 1.3.8 |
| stonequarryrepckfipil | 3.6.3 |
| temporalsreformed | 0.2.0 |
| terrainslabs | 1.0.17 |
| vsimgui | 1.2.7 |
| wolftaming | 5.0.1 |
| xinvtweaksfork | 1.9.1 |

</details>

This table and the game version above are regenerated from `MOD_DB.json` on every push — see `AGENTS.md` for the procedure.
