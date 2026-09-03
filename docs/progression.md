# Progression

**Mods:** xSkills Fork (+ xLib Fork, see [Foundation](foundation-libraries.md))

## Twelve trees, plus a few borrowed extras

Gain experience by doing what you'd already be doing — fighting, mining, digging, chopping, farming, fishing, herding, smithing, potting, cooking, and surviving temporal instability — and spend ability points on perks and passive bonuses in whichever tree matches:

- **Survival, Combat** — health, mobility, utility abilities; weapon effectiveness and combat specializations
- **Mining, Digging, Forestry** — ore extraction, soil resources (clay/peat/saltpeter), woodcutting yield
- **Farming, Fishing, Husbandry** — crop growth, catch rates and rod durability, animal handling and beekeeping
- **Metalworking, Pottery, Cooking** — smelting/smithing, clay forming/ceramics, food prep and nutrition bonuses
- **Temporal Adaptation** — the player's own resilience during temporal instability (not related to enemy behavior — see the compatibility note below)
- Plus **Tailoring**, **Sailing**, **Riding**, and a work-in-progress **Alchemy** tree tied to the [Alchemy](alchemy.md) mod

Press **O** to open the skills dialog and see your progress and available perks.

## How it plugs into everything else

This is the one mod in the list that touches nearly every other category, and it ships explicit compatibility work for most of them:

- **SmithingPlus** ([Smithing & Crafting](smithing-and-crafting.md)): xSkills has its own metal-bits smithing feature that duplicates SmithingPlus'. **Disable xSkills' version in its config** so you're not running two copies of the same system.
- **Toolsmith** ([Smithing & Crafting](smithing-and-crafting.md)): a past conflict with the Metalbits Forging perk is fixed — no action needed.
- **A Culinary Artillery / Expanded Foods** ([Cooking & Food](cooking-and-food.md)): cauldron, pot, and liquid-recipe cooking all grant XP correctly.
- **Butchering** ([Cooking & Food](cooking-and-food.md)): a dedicated Hunter Bag perk gives it its own inventory slot.
- **Durable Better Prospecting / ProspectTogether** ([Prospecting & Mining](prospecting-and-mining.md)): panning yield perks apply correctly.
- **Knapster, Stone Bake Oven**: full compatibility, nothing to configure.
- **Alchemy**: compatibility exists but is marked work-in-progress upstream — treat any Alchemy-tree perk as less battle-tested than the rest.

## The one open question

xSkills' "Temporal Adaptation" tree is about the *player's* resilience during temporal storms — separate from enemy AI. We previously ran Temporals Reformed (an enemy-behavior overhaul) alongside a flagged-but-unconfirmed concern about the two interacting badly around temporal mob behavior during storms. Neither mod's changelog ever mentioned the other, so it was never actually confirmed either way — we removed Temporals Reformed preemptively rather than run an untested pairing (see [Danger & Wildlife](danger-and-wildlife.md)). If Temporals Reformed ever gets revisited, that question is still open.

## Putting it together

Play normally — the XP comes from actions you're already taking, not a separate grind. The one thing worth doing on day one: open xSkills' config and turn off its metal-bits smithing feature, since SmithingPlus already owns that system and you don't want both running.
