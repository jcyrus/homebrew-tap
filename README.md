# Homebrew Tap

Personal Homebrew tap for my open source projects.

## Installation

Tap this repository:

```bash
brew tap jcyrus/tap
```

## Available Formulas

### GhostWire

Secure, ephemeral TUI chat client built with Rust and Ratatui.

```bash
brew install ghostwire
```

**Repository:** [jcyrus/GhostWire](https://github.com/jcyrus/GhostWire)

### Spektr

Blazing-fast TUI utility for cleaning development artifacts.

```bash
brew install spektr
```

**Repository:** [jcyrus/spektr](https://github.com/jcyrus/spektr)

## Usage

After installation, you can run any of the tools directly:

```bash
ghostwire    # Launch GhostWire
spektr       # Launch Spektr
nebulavault  # Launch NebulaVault
```

### NebulaVault

High-performance, secure SSH connection manager with GPU-accelerated GUI.

```bash
brew install nebulavault
```

**Repository:** [jcyrus/nebulavault](https://github.com/jcyrus/nebulavault)

### BrowserPort

A cross-platform browser picker utility.

```bash
brew install --cask browserport
```

**Repository:** [jcyrus/browserport](https://github.com/jcyrus/browserport)

## Development

To test formulas locally:

```bash
brew install --build-from-source Formula/<formula>.rb
```

## License

Individual formulas are licensed according to their respective projects (see each formula's license field).
