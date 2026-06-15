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

# List available backgrounds
looksmith backgrounds

# List available outfits
looksmith outfits

# Trigger a style pack shoot
looksmith shoot --set <set_slug> --selfie <path_to_file> [--poll] [--download <dir_path>]

# Trigger a custom single shot using specific background and outfit option IDs
looksmith shoot --background <bg_id> --outfit <outfit_id> [--aspect-ratio <2:3|3:2|1:1|9:16|16:9>] --selfie <path_to_file> [--poll] [--download <dir_path>]

# Check status of a shoot and optionally download results
looksmith status <shoot_id> [--download <dir_path>]
```

## Workflow

1. **Verify API Key**: Check if `LOOKSMITH_API_KEY` is set in the environment or if config exists at `~/.config/looksmith/config.json`.
2. **List Styles or Custom Options**: 
   - For pack-based shoots, run `looksmith packs`.
   - For custom shoots, run `looksmith backgrounds` and `looksmith outfits` to fetch valid options.
3. **Submit Shoot**: Run `looksmith shoot` with either `--set` or both `--background` and `--outfit`. Include `--download <dir_path>` to save the generated photos locally.
4. **Retrieve Results**: The CLI will monitor status and save photos directly to the specified folder.

## Common Option IDs Reference

To handle natural language mapping directly, use these common, active IDs:

### Popular Backgrounds:
* `white_pure_white_studio` - Clean pure white studio background
* `neutral_gradient_light_grey` - Light grey gradient studio background
* `office_modern_office_workspace` - Blurred modern office workspace
* `lobby_corporate_lobby` - Blurred corporate lobby background
* `bookshelf_thought_leader` - Blurred library/bookshelf setting
* `garden_lush_greenery` - Outdoor garden with lush greenery
* `streets_subtle_city` - Urban street scene with bokeh

### Popular Outfits:
* `navy_blazer_with_light_blue_shirt` - Classic professional look
* `white_button_up_shirt` - Clean, versatile white dress shirt
* `charcoal_gray_blazer` - Dark formal charcoal blazer
* `fitted_black_turtleneck` - Sleek creative/tech turtleneck
* `navy_tailored_suit` - Formal navy suit (masculine/neutral)
* `black_midi_fitted_dress` - Elegant formal black dress (feminine)
* `sage_green_blazer_with_white_blouse_2026_trend` - Modern professional blazer (feminine)
* `beige_quarter_zip_pullover_tech_casual` - Tech-casual pullover (neutral)

