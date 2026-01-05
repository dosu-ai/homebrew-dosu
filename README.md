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

After a new release of dosu-cli:

```bash
./scripts/update-formula.sh <version>
git add Formula/dosu.rb
git commit -m "Update dosu to v<version>"
git push
```

## Documentation

For dosu usage, see the [dosu-cli repository](https://github.com/dosu-ai/dosu-cli).

For Homebrew help, run `brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
