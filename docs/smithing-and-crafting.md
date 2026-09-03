# Smithing & Crafting

**Mods:** SmithingPlus (+ Bug Fix), Toolsmith, Knapster, QP's Chisel Tools, Stone Quarry (Standalone Repack), Improved Handbook Recipes (Fork)

## SmithingPlus: nothing goes to waste

Metal bits and nuggets can now be smithed directly — heat them in a crucible and add them to an anvil mid-project alongside rods, instead of needing a full ingot. Broken tools no longer just vanish: they drop a repairable tool head you can fix on an anvil, or chisel down into bits in the crafting grid.

Bits are recoverable from more places than vanilla: splitting work on an anvil, arrows breaking, scraping a cold crucible with a chisel (the amount depends on the metal tier), and items shattering during quenching. Watch the anvil's temperature glow — green means the metal is workable — and it now shows current vs. required voxel counts for the recipe directly. The hammer gained a tool mode to flip the work item. Iron blooms are guaranteed to yield enough voxels for a full ingot when bit recovery is on, so a bad bloom run isn't a wasted one.

## Toolsmith: tools as parts, not one durability bar

A deeper rework than most of this list — worth knowing about even if you never touch its crafting menus. Tools are now assembled from a **head**, a **handle**, and (optionally) a **binding**, each with its own durability instead of one shared number. Heads get 5x vanilla durability; handles and bindings wear out first and get replaced individually instead of you tossing the whole tool. Choose handle material (stick, bone, crude, or carved/professional — better handles reduce binding wear) and binding (twine, rope, leather, glue, or metal) when assembling a **Tinkered Tool** at the **Workbench**.

A separate **sharpness** stat (distinct from durability) affects speed — 5% faster at 98%+ sharp, 10% slower once dull — maintained with a **Grindstone** or a portable **Whetstone**. A worn head goes back to the Workbench for reforging with bits or ingots rather than being scrapped.

Runs alongside SmithingPlus cleanly: Toolsmith turns off its own internal "Smithing with Bits" the moment it detects SmithingPlus, so you get one bit-recovery system, not two competing ones. Most QP's Chisel Tools tools are repairable the normal way; a handful are flagged "blunt" and barely wear at all. Stone Quarry's chisels and rubble hammer plug into the same head/handle system directly.

## Knapster: hold instead of click

Adds "Easy" click-and-hold modes across most of the game's manual crafting systems, replacing repetitive single-clicking:

- **Easy Knapping / Easy Clayforming** — hold to place or remove voxels instead of clicking each one
- **Easy Smithing** — hold on the anvil grid with the hammer
- **Easy Grinding** — a speed multiplier for the quern, including automated querns
- **Easy Panning** — adjustable time/drops/saturation per gravel layer
- **Easy Pressing** — skips waiting for full compression
- **Easy Mixing** — speeds up A Culinary Artillery's mixing bowls (see [Cooking & Food](cooking-and-food.md))
- **Easy Harvesting / Easy Tilling** — speed multipliers for scythe and hoe work

Everything's server-configurable, so a server admin can dial the speedup up or down.

## QP's Chisel Tools: copy-paste for chiseled work

Built around the **Pantograph** (5 metal tiers): left-click to snapshot a chiseled design, right-click to paste it somewhere else, with modes for Shape Paste, Full Paste, Shape Add, Mirror & Paste, renaming, and paint-scraping. It upgrades into a Door Tool variant.

The rest of the toolkit:
- **True Chisel** / **QP Chisel** — draw-select a material from one block, then paint it onto voxels elsewhere (True Chisel needs no hammer, QP Chisel does)
- **Hand Planer** — strips an entire plane of voxels, or just one material
- **Hand Wedge** — moves, rotates, or mirrors a chiseled shape
- **Paint Brush + Palettes** — apply textures and dyes (glow/light variants exist)
- **Ladder Tool** — turns any chiseled block with 8+ voxels into a functional ladder
- **Door Tool** — builds multi-block doors with open/close states, a wrench-accessed config menu, linkable across up to 30 blocks / 50 distance
- **Paint Scraper** — strips unused materials off a finished design
- **Multigraph** — merges the Pantograph, Wedge, and Planer into a single tool

A typical build: chisel the base shape, snapshot it with the Pantograph, refine with the Wedge and Planer, clean up with the Paint Scraper, texture with the Paint Brush or a Palette, then paste it wherever you need it repeated. Designs save to disk as `.pf` files via a **Portfolio** system — portable between worlds and servers, with wildcard search. Chiseled variants exist for chests, shelves, beds, ovens, and anvils.

## Stone Quarry (Standalone Repack)

Craft **splitter-plug molds** from clay and fire them in a pit kiln. Insert the fired plugs into a target stone block at specific angles, then strike with the **rubble hammer** to fracture it into precisely-sized stone slabs — a **finishing chisel** shapes the extracted pieces afterward. A **rubble storage container** holds the output, though it rejects stone types with no sand/gravel variant (marble and halite, for example). Different stone types produce different size/shape outputs.

## Improved Handbook Recipes (Fork)

Not a crafting mechanic, but genuinely changes how you interact with every recipe in this list. Scroll the mouse wheel over a handbook recipe to cycle between its variants instead of scrolling the whole page. Three auto-fill buttons sit over the recipe grid: **"="** fills the best match, **"\*"** adds the maximum possible, **"+"** adds one more — and any ingredient you're still missing gets highlighted. When two installed mods both define a recipe for the same item (which happens constantly with this many mods installed), a **"NEXT"** button lets you cycle between them instead of the game silently picking one or breaking.

## Putting it together

Knapster's hold-to-craft modes are worth turning on from your very first knapping session — there's no downside. Lean on Improved Handbook Recipes' auto-fill buttons once you're juggling this many new recipes. SmithingPlus changes how you think about failed smithing attempts — bits and broken tools are recoverable now, not wasted — and Toolsmith builds directly on that: keep your tools sharp with a Whetstone in the field, and reforge a worn head at the Workbench instead of remaking the whole tool from scratch. Once you're doing serious stonework, Stone Quarry's plug-and-feather method is far more controlled than mining raw stone, and QP's Chisel Tools' Pantograph is what turns one good chiseled design into a whole building's worth of matching detail.
