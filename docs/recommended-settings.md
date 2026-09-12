# Recommended Settings

Every `ModConfig/` value we've deliberately changed from a mod's default — either to fix a cross-mod compatibility issue or to tune a mechanic to preference. `ModConfig/` itself is personal and gitignored (per-installation, not part of this repo), so this page is the actual record of what changed, from what, and why — treat it as a suggested starting config if you're setting up a similar mod list.

Full investigation notes for each item live in the relevant mod's `checked` entries in `MOD_DB.json` and in the dated files under `AgentLogs/`; this page is the short version.

## SmithingPlus.json

| Setting | Default | Recommended | Why |
|---|---|---|---|
| `EnableToolRecovery` | `true` | `false` | Fixes a duplication bug when running alongside Toolsmith: Toolsmith represents every tool head (any type/material) with one shared item code (`toolsmith:tinkertoolparts`), which matches SmithingPlus's `ToolHeadSelector` regex via the substring "part". With recovery on, breaking one Toolsmith tool head can leave several duplicate broken heads in inventory instead of one — confirmed by other users on SmithingPlus's mod page, with a moderator-recommended fix of disabling Tool Recovery. Side effect worth knowing: this is also the feature that gives *any* tool (not just Toolsmith's) a repairable head when it breaks instead of vanishing — with it off, plain/SmithingPlus tools revert to vanilla behavior (no head) on breakage. Toolsmith's own Workbench reforging is unaffected either way, since it uses a separate SmithingPlus anvil-recipe path, not this feature. |
| `BrokenToolVoxelPercent` | `0.8` | `0.4` | Recommended by Toolsmith's own mod page so a broken tool head is penalized realistically (loses a fair chunk of material) while staying salvageable, when the two mods run together. Unrelated to the duplication fix above. |

## Toolsmith.json

| Setting | Default | Recommended | Why |
|---|---|---|---|
| `ShouldHoningDamageHead` | `true` | `false` | With this on, sharpening a Tinkered Tool's head at a Grindstone/Whetstone adds wear on top of ordinary use-wear. Combined with `PercentDamageForReforge` (`1.0`), heavy/continuous sharpening can push a head's accumulated damage past the point where a broken head still drops as reforge-eligible, destroying it outright instead of leaving a repairable head behind. Disabling it means sharpening no longer contributes to head wear/destruction — a preference for players who sharpen often, not a required compatibility fix. |

## XLeveling/gui/xSkillsGilded.json

| Setting | Default | Recommended | Why |
|---|---|---|---|
| `effectBoxOriginX` | `8` | `13` | Fixes a cosmetic HUD overlap: xSkills Fork's effect/buff-icon box (e.g. "Well Rested") defaults to the same top-left corner as HudClock's panel. |
| `effectBoxOriginY` | `8` | `122` | Same fix — positions the box 13px below HudClock's measured bottom edge. These are raw pixel coordinates, not scaled to resolution or UI scale — confirmed correct at 2560×1440, may need retuning at other resolutions/UI scales. |
