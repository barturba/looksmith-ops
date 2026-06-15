# Looksmith Ops Agent Skill

`looksmith-ops` is a package to set up and install an AI Agent Skill that enables developer agents to programmatically list styles, trigger photo shoots, and monitor generation status on Looksmith using the `looksmith-cli`.

---

## Installation

You can install this skill and the CLI globally with a single command:

```bash
git clone https://github.com/barturba/looksmith-ops.git
cd looksmith-ops
./install.sh
```

Or run the installer directly using curl:

```bash
curl -sSL https://raw.githubusercontent.com/barturba/looksmith-ops/main/install.sh | bash
```

---

## What the Installer Does
1. **Installs looksmith-cli**: Installs the `looksmith-cli` globally from npm.
2. **Registers Agent Skill**: Creates the `~/.gemini/config/skills/looksmith-ops` directory and copies the `SKILL.md` file.
3. **Verifies API Key**: Checks for the existence of `LOOKSMITH_API_KEY` or config file and guides you to configure one if missing.

---

## Skill Capabilities

Once installed, your AI developer agents will be equipped with:
* `looksmith packs` - query style package names and slugs.
* `looksmith shoot --set <slug> --selfie <path> --poll` - generate headshots and wait for them to finish.
* `looksmith status <shoot_id>` - fetch completed photo URLs.

---

## License

MIT License. See [LICENSE](LICENSE) for details.
