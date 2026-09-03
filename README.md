# Vintage Story Modlist

A curated modlist for Vintage Story focused on extending the base game.

## Installing (one-time setup)

This repo only contains the modlist itself (`MOD_DB.json`) — not the mod files, out of respect for each mod author's own distribution terms. The setup below sets you up to fetch them from the official source and stay in sync automatically.

1. Press **Win + R**.
2. Type this and press Enter:
   ```
   powershell -NoExit -Command "cd $env:APPDATA\VintagestoryData"
   ```
3. In the window that opens, paste the block below and press Enter. The last line assumes Vintage Story is installed at the standalone-installer default (`%APPDATA%\Vintagestory`) — if yours is installed somewhere else (e.g. a system-wide install under `C:\Program Files\Vintagestory`), change that path before pasting (this also installs Git automatically if you don't already have it):
   ```powershell
   $gitOk = $true
   if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
       Write-Host "Git not found - installing..." -ForegroundColor Yellow
       if (Get-Command winget -ErrorAction SilentlyContinue) {
           winget install --id Git.Git -e --silent --accept-package-agreements --accept-source-agreements
           $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
       }
       if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
           Write-Host "Could not install Git automatically. Install it from https://git-scm.com/download/win, then close this window, redo step 2, and paste this block again." -ForegroundColor Red
           $gitOk = $false
       }
   }
   if ($gitOk) {
       git init
       git remote add origin https://github.com/MrLogic85/Vintage-Story-Mod-List.git
       git fetch
       git checkout -t origin/main
       .\setup.ps1 -Path "$env:APPDATA\Vintagestory\Vintagestory.exe"
   }
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

**Danger, and tracking what you hunt.** BloodTrail makes wounded prey trackable, rewarding a hunt over a chase. (Temporals Reformed briefly filled this category too — removed 2026-09-03 over an unresolved compatibility question with xSkills Fork, see [Danger & Wildlife](docs/danger-and-wildlife.md).)

**Companions matter.** Pet AI and Wolf taming turn animals into long-term allies rather than mobile resources, with Pet Map Markers keeping track of where they've wandered off to.

**The world rewards exploring it.** BetterRuins and Plains and Valleys change what you find and where, Farseer lets you actually see the terrain you're heading toward, More Lanterns keeps it lit, and Shipwright adds a full range of boats — from inventory-sized coracles to a twelve-seat Drakkar — for getting there by water. Auto Map Markers and Cartographer keep track of it all, solo or shared with a group.

**Alchemy adds a consumable buff track, not a magic system takeover.** Brew potions from a mortar & pestle up through a full cauldron setup for combat, gathering, mobility, and utility effects — drunk, thrown, or used as weapon coatings. It's there to be dipped into for something demanding (a boss fight, a long expedition), not a parallel progression you're required to run.

**Progression rewards playing normally.** xSkills Fork turns everything you're already doing — fighting, mining, farming, fishing, smithing, cooking, and more — into XP toward perks in that same activity. It has explicit compatibility work for most of this list; the one manual step is disabling its own metal-bits smithing in config so it doesn't duplicate SmithingPlus.

**Everything else stays out of your way.** HUD Clock, MoreHudBars, Extra Info, and Extra Overlays surface information vanilla hides; Carry On, Place on slabs, Terrain Slabs, and Xandu's Inventory Tweaks Fork remove friction from building and hauling; Player Corpse means death costs you a walk back, not your whole inventory.

## Categories

Each category links to a page explaining what its mods add, how they interact with each other (and with mods in other categories), and how to actually use them.

| Category | Mods |
|---|---|
| [Alchemy](docs/alchemy.md) | Alchemy |
| [Cooking & Food](docs/cooking-and-food.md) | A Culinary Artillery, Expanded Foods (Core, Meals Module, Chef's Tricks), FoodShelves, Butchering, Stone Bake Oven, Real Smoke, SpecializedBags Revived, BetterTraders |
| [Smithing & Crafting](docs/smithing-and-crafting.md) | SmithingPlus (+ Bug Fix), Toolsmith, Knapster, QP's Chisel Tools, Stone Quarry (Standalone Repack), Improved Handbook Recipes (Fork) |
| [Prospecting & Mining](docs/prospecting-and-mining.md) | Durable Better Prospecting, ProspectTogether, Visible Ore |
| [Companions](docs/companions.md) | Pet AI, Wolf taming, Pet Map Markers, BedSpawn |
| [Exploration & World](docs/exploration-and-world.md) | BetterRuins, Plains and Valleys, Farseer, More Lanterns, Shipwright, Auto Map Markers, Cartographer, Translocator Engineering - Redux |
| [Danger & Wildlife](docs/danger-and-wildlife.md) | BloodTrail |
| [Progression](docs/progression.md) | xSkills Fork |
| [Quality of Life](docs/quality-of-life.md) | HUD Clock, MoreHudBars, Extra Info, Extra Overlays, Dana Tweaks, Xandu's Inventory Tweaks Fork, Carry On, Place on slabs, Terrain Slabs, Player Corpse, Purposeful Storage |
| [Foundation (libraries)](docs/foundation-libraries.md) | Config lib, Dear ImGui, Anvil Performance Optimization, xLib Fork |

Full mod details, versions, fork/patch reasoning, and known incompatibilities are tracked in [`MOD_DB.json`](MOD_DB.json) (schema in [`MOD_DB.schema.json`](MOD_DB.schema.json)). Change history lives in [`AgentLogs/`](AgentLogs/).

## Current Versions

Game version: **1.22.7**

<details>
<summary>Installed mods (50)</summary>

| Mod ID | Version |
|---|---|
| aculinaryartillery | 2.0.0-dev.22 |
| alchemy | 2.1.22 |
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
| configlib | 1.13.1 |
| danatweaks | 4.1.0 |
| efchefstricks | 1.0.0-dev.4 |
| efmealsmodule | 1.0.0-dev.8 |
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
| purposefulstorage | 2.1.1 |
| realsmoke | 1.3.1 |
| shipwright | 1.4.1 |
| smithingplus | 1.9.0-rc.1 |
| smithingplusbugfix | 2.0.1 |
| specialexpandedbags | 2.0.0 |
| stonebakeoven | 1.3.8 |
| stonequarryrepckfipil | 3.6.3 |
| terrainslabs | 1.0.17 |
| toolsmith | 1.2.19 |
| translocatorengineeringredux | 1.6.6 |
| visibleore | 1.0.1 |
| vsimgui | 1.2.7 |
| wolftaming | 5.0.1 |
| xinvtweaksfork | 1.9.1 |
| xlibfork | 1.0.37 |
| xskillsfork | 1.0.99 |

</details>

This table and the game version above are regenerated from `MOD_DB.json` on every push — see `AGENTS.md` for the procedure.
