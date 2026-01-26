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

## License

MIT
