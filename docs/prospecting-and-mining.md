# Prospecting & Mining

**Mods:** Durable Better Prospecting, ProspectTogether

## Durable Better Prospecting: read the pick your way

The prospecting pick now has six distinct reading modes instead of vanilla's one:

- **Density** — vanilla-style sampling, with an option to simplify it to a single-block read instead of 3
- **Node** — vanilla's node-detection mode (off by default)
- **Rock** — shortest distance to each rock type in the area
- **Column** — every ore present in one vertical column, from the mantle up to world height
- **Distance** — shortest distance to each ore type, with short/medium/long range variants
- **Quantity** — an enhanced version of node mode with more range, also in short/medium/long variants

Readings can be sorted increasing or decreasing, long-range modes can auto-drop a map marker on a hit, and you can turn on directional labels alongside the numbers so you know which way to dig.

## ProspectTogether: share what you find

Prospect normally with the pick in Density Search mode — your findings save locally to `prospectTogetherClient.json` as you go. From there you choose how to share:

- **Manual**: the chat command `.pt sendall`, or the "Send All Now" button in the map dialog
- **Automatic**: turn on `.pt autoshare true` (or the equivalent toggle in the map dialog) once, and every future find syncs automatically
- **PvP servers**: pick a specific target group in the map dialog instead of broadcasting to everyone

Server admins can tune how often data syncs with `/pt setsaveintervalminutes [1-60]`.

## Putting it together

Switch between Durable Better Prospecting's modes depending on what you're doing — Column mode to fully survey a promising vertical shaft, Distance mode when you know what you're after and just need a heading. Once you're prospecting with other players, turn on ProspectTogether's autoshare early — the value compounds the more people are feeding data into the shared map.
