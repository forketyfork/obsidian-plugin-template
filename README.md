# Obsidian Plugin Template

A template for creating Obsidian plugins with modern tooling and best practices.

## What's Included

- **TypeScript** with strict mode enabled
- **esbuild** for fast builds
- **ESLint** with flat config format
- **Prettier** for code formatting
- **Jest** for testing with ts-jest
- **Nix flakes** for reproducible development environment
- **GitHub Actions** for CI/CD (build, test, release)
- **Dependabot** for automated dependency updates
- **AI agent guidelines** (CLAUDE.md) for AI-assisted development

## Getting Started

### 1. Create Your Repository

Clone or download this template:

```bash
git clone https://github.com/forketyfork/obsidian-plugin-template.git my-plugin
cd my-plugin
rm -rf .git
```

### 2. Configure the Template

Run the interactive setup script:

```bash
./setup.sh
```

The script prompts for:
- **Plugin ID**: Unique identifier (e.g., `my-plugin`)
- **Plugin name**: Human-readable name (e.g., `My Plugin`)
- **Plugin description**: Short description of what it does
- **CSS prefix**: Prefix for CSS classes (defaults to plugin ID)
- **Author name**: Your name
- **Author URL**: Your website or GitHub profile
- **Copyright year**: Year for LICENSE file

### 3. Initialize Your Project

```bash
rm setup.sh README.md
mv PLUGIN_README.md README.md
yarn install
yarn dev
git init && git add . && git commit -m 'Initial commit'
```

## Template Structure

```
├── .github/
│   ├── workflows/
│   │   ├── build.yml          # CI build on push/PR
│   │   ├── publish.yml        # Release workflow (triggered by tags)
│   │   └── junie.yml          # JetBrains Junie AI integration (optional)
│   └── dependabot.yml         # Automated dependency updates
├── src/
│   ├── main.ts                # Plugin entry point
│   ├── styles.src.css         # Source CSS (minified to styles.css)
│   ├── __tests__/             # Test files
│   └── __mocks__/             # Mock files for testing
├── CLAUDE.md                  # AI agent guidelines
├── setup.sh                   # Interactive setup script
├── manifest.json              # Obsidian plugin manifest
├── versions.json              # Version compatibility mapping
├── package.json               # Dependencies and scripts
├── flake.nix                  # Nix development environment
├── justfile                   # Task runner commands
└── ...config files            # ESLint, Prettier, TypeScript, Jest
```

## Development

### Prerequisites

- Node.js 24.x
- Yarn package manager

Or use Nix:

```bash
nix develop
# or with direnv
direnv allow
```

### Commands

| Command | Description |
|---------|-------------|
| `yarn dev` | Development build |
| `yarn dev:watch` | Development build with file watching |
| `yarn prod` | Production build (minified) |
| `yarn build` | Full build with typecheck, lint, format, and tests |
| `yarn typecheck` | TypeScript type checking |
| `yarn lint` | ESLint code checking |
| `yarn format` | Prettier code formatting |
| `yarn test` | Run Jest tests |
| `yarn test:dev` | Build and run tests |
| `yarn coverage` | Run tests with coverage report |

### Release Process

1. Update version: `yarn version --patch|minor|major --no-git-tag-version`
2. Commit and push to a release branch
3. Create a tag matching the version
4. GitHub Actions creates a draft release with artifacts

## CI/CD Workflows

### build.yml
Triggers on push to main and PRs. Runs typecheck, lint, format check, build, and tests.

### publish.yml
Triggers on tag push. Builds the plugin and creates a draft GitHub release with `main.js`, `manifest.json`, `styles.css`, and archives.

### junie.yml
Integration for JetBrains Junie AI assistant. Remove if not using Junie.

## Placeholders Reference

| Placeholder | Description | Files |
|-------------|-------------|-------|
| `{{PLUGIN_ID}}` | Plugin identifier | package.json, manifest.json, publish.yml, PLUGIN_README.md |
| `{{PLUGIN_NAME}}` | Human-readable name | manifest.json, PLUGIN_README.md |
| `{{PLUGIN_DESCRIPTION}}` | Short description | package.json, manifest.json, PLUGIN_README.md |
| `{{PLUGIN_PREFIX}}` | CSS class prefix | CLAUDE.md, src/styles.src.css |
| `{{AUTHOR}}` | Author's name | package.json, manifest.json, LICENSE |
| `{{AUTHOR_URL}}` | Author's URL | manifest.json |
| `{{YEAR}}` | Copyright year | LICENSE |

## License

MIT
