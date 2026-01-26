# Maintainer Documentation

This document is for maintainers of the Obsidian plugin template repository.

## Template Structure

```
├── .github/
│   ├── workflows/
│   │   ├── build.yml          # CI build on push/PR
│   │   ├── publish.yml        # Release workflow (triggered by tags)
│   │   └── junie.yml          # JetBrains Junie AI integration
│   └── dependabot.yml         # Automated dependency updates
├── src/
│   ├── main.ts                # Plugin entry point (example code)
│   ├── styles.src.css         # Source CSS (minified to styles.css)
│   ├── __tests__/             # Test files
│   └── __mocks__/             # Mock files for testing
├── CLAUDE.md                  # AI agent guidelines
├── MAINTAINERS.md             # This file
├── README.md                  # User-facing documentation
├── setup.sh                   # Interactive setup script
├── manifest.json              # Obsidian plugin manifest
├── versions.json              # Version compatibility mapping
├── package.json               # Node.js dependencies and scripts
├── flake.nix                  # Nix development environment
├── justfile                   # Task runner commands
└── ...config files            # ESLint, Prettier, TypeScript, Jest
```

## Placeholders

The template uses the following placeholders that are replaced by `setup.sh`:

| Placeholder | Description | Files |
|-------------|-------------|-------|
| `{{PLUGIN_ID}}` | Plugin identifier (e.g., `my-plugin`) | package.json, manifest.json, publish.yml, README.md |
| `{{PLUGIN_NAME}}` | Human-readable name (e.g., `My Plugin`) | manifest.json, README.md |
| `{{PLUGIN_DESCRIPTION}}` | Short description | package.json, manifest.json, README.md |
| `{{PLUGIN_PREFIX}}` | CSS class prefix | CLAUDE.md, src/styles.src.css |
| `{{AUTHOR}}` | Author's name | package.json, manifest.json, LICENSE |
| `{{AUTHOR_URL}}` | Author's URL | manifest.json |
| `{{YEAR}}` | Copyright year | LICENSE |

## Adding New Placeholders

When adding a new placeholder:

1. Use the format `{{PLACEHOLDER_NAME}}` (uppercase with underscores)
2. Add it to the `FILES` array in `setup.sh`
3. Add the sed replacement in the `replace_in_file` function
4. Update the prompt section to collect the value from the user
5. Update this documentation and README.md

## Version Alignment

This template is kept in sync with these production plugins:

- [obsidian-food-tracker](https://github.com/forketyfork/obsidian-food-tracker)
- [obsidian-grazie-plugin](https://github.com/forketyfork/obsidian-grazie-plugin)
- [obsidian-speech-bubbles](https://github.com/forketyfork/obsidian-speech-bubbles)
- [obsidian-youtrack-fetcher](https://github.com/forketyfork/obsidian-youtrack-fetcher)

When updating the template:

1. Test changes on one of the production plugins first
2. Update all related configs (e.g., if updating ESLint, update all plugins)
3. Ensure build passes: `yarn install && yarn build`

## Dependency Updates

Dependencies are managed via Dependabot. When reviewing PRs:

1. Check that the build passes
2. For major version updates, verify compatibility with Obsidian API
3. Keep TypeScript, ESLint, and Jest versions aligned across all plugins

### Key Dependencies

| Package | Purpose | Notes |
|---------|---------|-------|
| `obsidian` | Obsidian API types | Use `latest` |
| `esbuild` | Bundler | Fast builds |
| `typescript` | Type checking | Strict mode enabled |
| `eslint` | Linting | Flat config format |
| `jest` | Testing | With ts-jest |
| `prettier` | Formatting | |

## Development Environment

### Using Nix (Recommended)

```bash
nix develop
# or with direnv
direnv allow
```

### Manual Setup

Requires:
- Node.js 24.x
- Yarn package manager

## Release Process

The template itself doesn't have releases. For plugins created from this template:

1. Update version: `yarn version --patch|minor|major --no-git-tag-version`
2. The version script updates `manifest.json` and `versions.json`
3. Commit and push to a release branch
4. Create a tag matching the version
5. GitHub Actions will create a draft release

## CI/CD Workflows

### build.yml
- Triggers on push to main and PRs
- Runs: typecheck, lint, format check, build, tests

### publish.yml
- Triggers on tag push
- Builds the plugin
- Creates a draft GitHub release with artifacts

### junie.yml
- Integration for JetBrains Junie AI assistant
- Optional, can be removed if not using Junie

## AI Agent Guidelines (CLAUDE.md)

The CLAUDE.md file provides instructions to AI coding assistants. Key sections:

- **Development Environment**: Build commands
- **Code Style**: Formatting and conventions
- **CSS Best Practices**: Prefix requirements, avoiding inline styles
- **Obsidian API Best Practices**: Security, performance, patterns
- **Plugin Submission Guidelines**: Obsidian community requirements

Keep this file updated when:
- Adding new coding conventions
- Learning from PR reviews
- Discovering Obsidian API best practices

## Testing

```bash
# Run tests
yarn test:dev

# Run with coverage
yarn coverage
```

Test structure:
- Unit tests in `src/__tests__/`
- Mocks in `src/__mocks__/`
- Configuration in `jest.config.js`

## Common Issues

### macOS sed vs GNU sed

The `setup.sh` script uses `sed -i.bak` for compatibility with both macOS and Linux. The `.bak` files are deleted after processing.

### styles.css not generated

Run `yarn build:css` to minify `src/styles.src.css` to `styles.css`.

### Type errors after updating obsidian package

The Obsidian API types can change. Check:
- Release notes for breaking changes
- Update code to use new APIs
- Consider minimum Obsidian version in manifest.json
