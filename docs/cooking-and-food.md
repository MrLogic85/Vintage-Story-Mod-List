# Cooking & Food

**Mods:** A Culinary Artillery, Expanded Foods, FoodShelves, Butchering, Stone Bake Oven, Real Smoke, SpecializedBags Revived, BetterTraders

This is the deepest single theme in the list — a full chain from raising/gathering ingredients through processing, cooking, storing, and eventually trading the surplus.

## The chain

**A Culinary Artillery** is the foundation. It's a library of cooking tools and mechanics (mixing, food-based utensils) that **Expanded Foods** is built directly on top of — Expanded Foods' own description says outright: *"DO NOT USE THIS MOD WITHOUT A CULINARY ARTILLERY INSTALLED!!!"* Install order doesn't matter (both are always present here), but if you ever remove one, remove both.

**Expanded Foods** adds most of the actual new recipes and food types. It's explicitly designed as a companion to **FoodShelves** (storage for the new food types) and **Butchering** (processing animals into the raw ingredients Expanded Foods' recipes want).

**Butchering** changes how you get meat: carry a killed animal home with **Carry On** (see [Quality of Life](quality-of-life.md)) instead of butchering on the spot, then process it properly. It has its own **Smoking Rack** (place a campfire underneath it) that produces smoked meats, smoked sausages, and smoked black pudding.

**Stone Bake Oven** adds a proper baking structure, and **Real Smoke** adds physics-based smoke as pure atmosphere — it ships a compatibility patch specifically for Stone Bake Oven, so the two look right together.

**SpecializedBags Revived** gives you dedicated carrying bags, useful for hauling the volume of ingredients this chain produces.

**BetterTraders** is where the surplus goes — it replaces vanilla's trader wagons with proper trader huts, and has optional compatibility content specifically for Expanded Foods goods. It's server-side only, so nothing to configure on the client.

## Know before you use it

- **Two smoking systems exist and don't share output.** Butchering's Smoking Rack and a from-scratch smoker are separate systems if you ever add something like Primitive Survival later (we evaluated and skipped it for exactly this overlap — see the repo's `AgentLogs/` for the reasoning). For now, Butchering's Smoking Rack is your only smoker, paired visually with Real Smoke.
- Expanded Foods is **incompatible** with the unofficial "Art of Cooking" mod, and needs a separate compat patch to run alongside "Wildcraft: Fruits & Nuts" — neither is installed here, so not a concern unless you add one later.
- FoodShelves went through a breaking change at v3.0.0 (required a mod-content wipe on existing worlds) — the installed version is well past that, so no action needed, just don't roll back below 3.0.0 on an existing save.

## How to actually use it

Play the early game mostly on Expanded Foods' recipes using A Culinary Artillery's tools. As you hunt, favor carrying animals home over field-butchering so Butchering's proper processing (and its Smoking Rack) gets used. Once you've got a Stone Bake Oven running, bread/baked goods become worth the investment. Store the results in FoodShelves rather than chests — it's built for it. Once you're producing more than you eat, a BetterTraders hut is the sink for it.
