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
<summary>Installed mods (51)</summary>

| Name | Version | Link |
|---|---|---|
| A Culinary Artillery | 2.0.0-dev.22 | [link](https://mods.vintagestory.at/aculinaryartillery) |
| Alchemy | 2.1.22 | [link](https://mods.vintagestory.at/alchemy) |
| Anvil Performance Optimization | 1.0.0 | [link](https://mods.vintagestory.at/show/mod/50265) |
| More Lanterns | 1.4.3 | [link](https://mods.vintagestory.at/apelanterns) |
| BedSpawn | 1.7.1 | [link](https://mods.vintagestory.at/bedspawn) |
| BetterRuins | 0.6.3 | [link](https://mods.vintagestory.at/betterruins) |
| BetterTraders | 0.2.1 | [link](https://mods.vintagestory.at/bettertraders) |
| BloodTrail | 1.2.5 | [link](https://mods.vintagestory.at/bloodtrail) |
| Butchering | 1.14.3 | [link](https://mods.vintagestory.at/butchering) |
| Carry On | 1.14.3 | [link](https://mods.vintagestory.at/carryon) |
| QP's Chisel Tools | 1.17.6 | [link](https://mods.vintagestory.at/chiseltools) |
| Config lib | 1.13.1 | [link](https://mods.vintagestory.at/configlib) |
| Dana Tweaks | 4.1.0 | [link](https://mods.vintagestory.at/danatweaks) |
| Durable Better Prospecting | 22.0.0-rc.1 | [link](https://mods.vintagestory.at/durablebetterprospecting) |
| Expanded Foods: Chef's Tricks | 1.0.0-dev.4 | [link](https://mods.vintagestory.at/efchefstricks) |
| Expanded Foods: Meals Module | 1.0.0-dev.8 | [link](https://mods.vintagestory.at/efmealsmodule) |
| Auto Map Markers | 5.0.3 | [link](https://mods.vintagestory.at/automapmarkers) |
| Expanded Foods: Core | 2.0.0-dev.14 | [link](https://mods.vintagestory.at/expandedfoods) |
| Extra Info | 2.2.1 | [link](https://mods.vintagestory.at/extrainfo) |
| Extra Overlays | 1.8.1 | [link](https://mods.vintagestory.at/show/mod/48190) |
| Farseer | 1.4.0 | [link](https://mods.vintagestory.at/farseer) |
| FoodShelves | 3.0.5 | [link](https://mods.vintagestory.at/foodshelves) |
| HUD Clock | 4.4.1 | [link](https://mods.vintagestory.at/hudclock) |
| Improved Handbook Recipes (Fork) | 1227.0.5 | [link](https://mods.vintagestory.at/show/mod/47215) |
| Knapster | 4.0.0 | [link](https://mods.vintagestory.at/knapster) |
| MoreHudBars | 1.2.0 | [link](https://mods.vintagestory.at/morehudbars) |
| Cartographer | 2.3.0 | [link](https://mods.vintagestory.at/nbcartographer) |
| Pet AI | 5.1.1 | [link](https://mods.vintagestory.at/petai) |
| Pet Map Markers | 0.1.0 | [link](https://mods.vintagestory.at/petmapmarkers) |
| Place on slabs | 1.2.0 | [link](https://mods.vintagestory.at/show/mod/38090) |
| Plains and Valleys | 1.0.13 | [link](https://mods.vintagestory.at/plainsandvalleys) |
| Player Corpse | 1.15.1 | [link](https://mods.vintagestory.at/playercorpseforkedazu) |
| ProspectTogether | 2.2.1 | [link](https://mods.vintagestory.at/prospecttogether) |
| Purposeful Storage | 2.1.1 | [link](https://mods.vintagestory.at/purposefulstorage) |
| Real Smoke | 1.3.1 | [link](https://mods.vintagestory.at/realsmoke) |
| Rivers | 5.0.3 | [link](https://mods.vintagestory.at/rivers) |
| Shipwright: Vessels of Distant Shores | 1.4.1 | [link](https://mods.vintagestory.at/shipwright) |
| SmithingPlus | 1.9.0-rc.1 | [link](https://mods.vintagestory.at/smithingplus) |
| SmithingPlus Bug Fix | 2.0.1 | [link](https://mods.vintagestory.at/show/mod/55511) |
| SpecializedBags Revived | 2.0.0 | [link](https://mods.vintagestory.at/specializedbagsrevived) |
| Stone Bake Oven | 1.3.8 | [link](https://mods.vintagestory.at/stonebakeoven) |
| Stone Quarry (Standalone Repack) | 3.6.3 | [link](https://mods.vintagestory.at/stonequarystandalonerepack) |
| Terrain Slabs | 1.0.17 | [link](https://mods.vintagestory.at/terrainslabs) |
| Toolsmith | 1.2.19 | [link](https://mods.vintagestory.at/toolsmith) |
| Translocator Engineering - Redux | 1.6.6 | [link](https://mods.vintagestory.at/translocatorengineeringredux) |
| Visible Ore | 1.0.1 | [link](https://mods.vintagestory.at/visibleore) |
| Dear ImGui | 1.2.7 | [link](https://mods.vintagestory.at/imgui) |
| Wolf taming | 5.0.1 | [link](https://mods.vintagestory.at/wolftaming) |
| Xandus Inventory Tweaks Fork | 1.9.1 | [link](https://mods.vintagestory.at/xinvtweaksfork) |
| xLib Fork | 1.0.37 | [link](https://mods.vintagestory.at/show/mod/44133) |
| xSkills Fork | 1.0.99 | [link](https://mods.vintagestory.at/show/mod/44074) |

</details>

This table and the game version above are regenerated from `MOD_DB.json` on every push — see `AGENTS.md` for the procedure.
