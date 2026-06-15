---
name: looksmith-ops
description: "Looksmith CLI agent skill for listing style packages, scheduling photo shoots, and monitoring generation status."
---

# Looksmith Ops

This skill enables you to programmatically trigger and manage AI photo shoots on Looksmith.

## Commands

Use the globally installed `looksmith` CLI to interact with the API:

```bash
# List style packages (photo sets)
looksmith packs

# Trigger a shoot using a local selfie file
looksmith shoot --set <set_slug> --selfie <path_to_file>

# Trigger a shoot using a remote selfie URL
looksmith shoot --set <set_slug> --selfie-url <url>

# Trigger a shoot and wait/poll for it to complete
looksmith shoot --set <set_slug> --selfie <path> --poll

# Check status of a shoot
looksmith status <shoot_id>
```

## Workflow

1. **Verify API Key**: Check if `LOOKSMITH_API_KEY` is set in the environment or if config exists at `~/.config/looksmith/config.json`.
2. **List Styles**: Run `looksmith packs` to find the appropriate styling package slug matching the user's requirements (e.g. `corporate-headshots`, `doctor-headshots`, etc.).
3. **Submit Shoot**: Run `looksmith shoot --set <slug> --selfie <path> --poll` to launch the shoot and monitor it until complete.
4. **Retrieve Results**: Once the shoot is completed, output the list of generated photo URLs to the user.
