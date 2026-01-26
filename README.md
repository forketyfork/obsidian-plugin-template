# {{PLUGIN_NAME}}

{{PLUGIN_DESCRIPTION}}

## Features

- Feature 1
- Feature 2

## Installation

### From Obsidian Community Plugins

1. Open Obsidian Settings
2. Go to Community Plugins
3. Search for "{{PLUGIN_NAME}}"
4. Click Install, then Enable

### Manual Installation

1. Download the latest release from the [Releases](../../releases) page
2. Extract the files to your vault's `.obsidian/plugins/{{PLUGIN_ID}}/` folder
3. Reload Obsidian
4. Enable the plugin in Settings > Community Plugins

## Usage

TODO: Add usage instructions

## Development

### Prerequisites

- Node.js 24.x
- Yarn package manager

### Using Nix (Recommended)

If you have Nix installed with flakes enabled:

```bash
# Enter the development shell
nix develop

# Or if using direnv
direnv allow
```

### Setup

```bash
# Install dependencies
yarn install

# Development build
yarn dev

# Development build with watch mode
yarn dev:watch

# Full production build (includes typecheck, lint, format, and tests)
yarn build
```

### Available Commands

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

### Project Structure

```
├── src/
│   ├── main.ts              # Plugin entry point
│   ├── styles.src.css       # Source CSS (minified to styles.css)
│   ├── __tests__/           # Test files
│   └── __mocks__/           # Mock files for testing
├── manifest.json            # Obsidian plugin manifest
├── versions.json            # Version compatibility mapping
├── CLAUDE.md               # AI agent guidelines
└── ...config files
```

### Creating a New Plugin from This Template

#### Quick Setup (Recommended)

Run the interactive setup script:

```bash
./setup.sh
```

The script will prompt you for:
- **Plugin ID**: Unique identifier (e.g., `my-plugin`)
- **Plugin name**: Human-readable name (e.g., `My Plugin`)
- **Plugin description**: Short description of what it does
- **CSS prefix**: Prefix for CSS classes (defaults to plugin ID)
- **Author name**: Your name
- **Author URL**: Your website or GitHub profile
- **Copyright year**: Year for LICENSE file

After setup:
1. Delete the setup script: `rm setup.sh`
2. Install dependencies: `yarn install`
3. Build the plugin: `yarn dev`
4. Initialize git: `git init && git add . && git commit -m 'Initial commit'`

#### Manual Setup

If you prefer to configure manually, replace these placeholders:

| Placeholder | Example | Files |
|-------------|---------|-------|
| `{{PLUGIN_ID}}` | `my-plugin` | package.json, manifest.json, publish.yml, README.md |
| `{{PLUGIN_NAME}}` | `My Plugin` | manifest.json, README.md |
| `{{PLUGIN_DESCRIPTION}}` | `A plugin that does X` | package.json, manifest.json, README.md |
| `{{PLUGIN_PREFIX}}` | `my-plugin` | CLAUDE.md, src/styles.src.css |
| `{{AUTHOR}}` | `Your Name` | package.json, manifest.json, LICENSE |
| `{{AUTHOR_URL}}` | `https://github.com/username` | manifest.json |
| `{{YEAR}}` | `2026` | LICENSE |

Also update:
- `flake.nix` description
- `justfile` header comment

## License

MIT
