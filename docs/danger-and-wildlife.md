# Danger & Wildlife

**Mods:** BloodTrail, Temporal Stabilizer

Temporals Reformed (an enemy-behavior overhaul) was removed 2026-09-03 as a preventative measure ahead of installing [xSkills Fork](progression.md) — an unresolved, never-actually-confirmed watch-item existed between the two around temporal mob AI during storms, and Temporals Reformed was the newer/less-established of the two mods. See [Progression](progression.md) for the full reasoning if it's ever worth revisiting; it remains tracked in `MOD_DB.json` (installed: false) and is safe to reinstall since it only touches vanilla entity JSON, no persistent save data.

## BloodTrail

Any weapon hit that does more than 1 damage makes an animal start bleeding — a bare-handed kill won't trigger it. The blood is a particle effect: denser when the animal is running than walking, washes away faster in rain, and disappears instantly on contact with water. Drifters and other "lore" creatures don't bleed at all, since thematically they aren't normal flesh. You'll need particles enabled in your graphics settings to see any of this — and there's a client-side toggle even on servers that force blood trails on, if you'd rather not see it.

## Temporal Stabilizer: fix a bad spot instead of moving

Vintage Story sets each location's ambient temporal-stability value randomly at world generation, and it never changes afterward — it's not tied to being in a ruin, being indoors vs outdoors (that only matters for temporal-storm protection, a separate mechanic), or anything else you build. If you've settled somewhere that just happened to get a low value, this mod adds a craftable/placeable machine (tin bronze ingots + a Temporal Gear + planks, 3x3 grid) that makes the surrounding area immune to stability drain while it's fueled. Default radius is 50 blocks (adjustable 8–100 via Sneak+Right-Click), and one Temporal Gear runs it for roughly 20 in-game days before it needs refueling.

Known caveats (young mod, 771 downloads as of 2026-09-19): the radius setting resets if you reload the chunk or the game — you'll need to re-set it after every relaunch until the author fixes that. Model/animations are acknowledged work-in-progress by the author, but the stability protection itself works. Only tagged for game version 1.22.3 upstream, but confirmed working on 1.22.7 here.

If you'd rather diagnose *why* a spot is unstable before building here, or want a permanent fix without an upkeep item, see the vanilla Rift Ward (blocks nearby rifts specifically) or the alternative "Chunk Stability Override" mod (not installed — a `/stab X` command that permanently raises a chunk's baseline instead of adding a device).

## Putting it together

When hunting, a solid hit followed by tracking the blood trail beats chasing a wounded animal blind — just make sure particles are on in your settings. If your base sits in a naturally low-stability spot (ruins are a common culprit just by being popular building sites, not because ruins themselves cause it), a fueled Temporal Stabilizer is the low-effort fix — just remember to reset its radius after every game restart.
