# Companions

**Mods:** Pet AI, Wolf taming, Pet Map Markers, BedSpawn

## Pet AI: the shared toolkit

Every taming mod in this category builds on Pet AI's systems. Hand-feeding a pet raises its obedience (feeding troughs don't count for this). Obedience decays over time, so an ignored pet slowly becomes less reliable. Right-click to give a command directly, or use a **pet whistle** to command pets at range, including directing an attack on a specific target. "Stay" pins a pet in place; otherwise pets follow and track their owner. Pets will PvP if directed to, auto-defend their owner from threats like drifters, and can be healed with **poultices**. There's a full aging system, **pet cushions** that act as nesting/respawn points, auto-teleport-to-owner if a pet gets left behind, renaming, and some pets support their own inventory or backpack.

## Wolf taming

Tame a dog or puppy with a **magic golden bone**, or just use the game's normal interact prompt on one. After taming, obedience drops roughly 20% per day — feed bones, meat, or pet cookies to keep it up. Commands available: sit/stay, follow, attack, seek. You can equip a tamed wolf with armor, collars, scarves, and helmets. Breed them — puppies take about 336 in-game hours to reach adulthood. Traders sell distinct breeds (hunting dogs, shepherds, corgis, wolves) with different speed, strength, and toughness.

## Pet Map Markers

Fully automatic, no setup: the moment a creature gets tamed (via Pet AI's tameable behavior), it gets a live-updating pawprint waypoint that moves with it. If the pet goes down, its marker turns red and stays pinned at that spot. Waypoints can be manually recolored or pinned like any other marker.

**Don't share pet waypoints through Cartographer** (see [Exploration & World](exploration-and-world.md)) — the mod's own page warns it "will do all sort of Weird Stuff," with no further detail given. Likely cause: Pet Map Markers' waypoints are meant to keep moving with the pet, while Cartographer's `/waypoint share` hands out a frozen snapshot — sharing one probably leaves the shared copy stale while your own keeps tracking the pet, or the two systems end up fighting over the same waypoint. Not confirmed by either author, but general (non-pet) waypoints don't have this problem, so there's no reason to risk it.

## BedSpawn

Sleep in a bed and your spawn point moves there — destroy that bed and you revert to the default world spawn. A few things affect whether it takes: there's a cooldown between spawn-resets (half an in-game day by default), it can be configured to require sneaking when you interact with the bed, to block setting spawn below sea level, or to require the bed be inside an enclosed room. Chat feedback tells you exactly why a given attempt didn't register if it fails.

## Putting it together

Feed and command pets deliberately from the start — obedience decay means a pet you ignore for a week isn't as reliable as one you're actively maintaining. Use the whistle for directed attacks rather than melee-ing alongside your pet blind. Once you've tamed anything, Pet Map Markers is already tracking it for you — no extra step. Set your bed spawn as soon as you have a real base, and keep in mind losing that bed reverts you to world spawn.
