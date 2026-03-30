# Homebrew Dosu Tap

Homebrew tap for the [Dosu CLI](https://github.com/dosu-ai/dosu-cli).

## Installation

```bash
brew install dosu-ai/dosu/dosu
```

Or tap first:

```bash
brew tap dosu-ai/dosu
brew install dosu
```

## Updating the Formula

After a new release is published on [dosu-cli](https://github.com/dosu-ai/dosu-cli/releases), update the formula:

```bash
./scripts/update-formula.sh <version>
git add Formula/dosu.rb
git commit -m "Update dosu to v<version>"
git push
```

The script automatically:

- Resolves the Homebrew assets for macOS x86_64/arm64 and Linux x86_64/arm64
- Uses the GitHub Release API for the current Bun-based release format
- Hashes the asset directly if the Release API omits a `sha256` digest
- Updates the formula file

## Documentation

For dosu usage, see the [dosu-cli repository](https://github.com/dosu-ai/dosu-cli).

For Homebrew help, run `brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
