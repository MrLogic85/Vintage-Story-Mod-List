# Danger & Wildlife

**Mods:** BloodTrail

Temporals Reformed (an enemy-behavior overhaul) was removed 2026-09-03 as a preventative measure ahead of installing [xSkills Fork](progression.md) — an unresolved, never-actually-confirmed watch-item existed between the two around temporal mob AI during storms, and Temporals Reformed was the newer/less-established of the two mods. See [Progression](progression.md) for the full reasoning if it's ever worth revisiting; it remains tracked in `MOD_DB.json` (installed: false) and is safe to reinstall since it only touches vanilla entity JSON, no persistent save data.

## BloodTrail

Any weapon hit that does more than 1 damage makes an animal start bleeding — a bare-handed kill won't trigger it. The blood is a particle effect: denser when the animal is running than walking, washes away faster in rain, and disappears instantly on contact with water. Drifters and other "lore" creatures don't bleed at all, since thematically they aren't normal flesh. You'll need particles enabled in your graphics settings to see any of this — and there's a client-side toggle even on servers that force blood trails on, if you'd rather not see it.

## Putting it together

When hunting, a solid hit followed by tracking the blood trail beats chasing a wounded animal blind — just make sure particles are on in your settings.
