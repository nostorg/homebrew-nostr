# Homebrew Tap for Nostr

This is a [homebrew tap](https://docs.brew.sh/Taps) for [nostr](https://nostr.com/) software, such as [gossip](https://github.com/mikedilger/gossip).

## How do I install these formulae?

First install [homebrew](https://brew.sh/). Then add the tap:

```
brew tap nostorg/nostr
```

Finally install a `<formula>` or `<cask>` (such as `gossip` or `lume`):

```
brew install <formula>
```

### How do I install `gossip`?

To install the latest stable version:

```
brew install gossip
```

To install the latest development branch:

```
brew install --HEAD gossip
```

To install the cask (DMG/Application release build):

```
brew install --cask gossip
```

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
