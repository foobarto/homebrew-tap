# homebrew-tap

Homebrew tap for [Glorbo](https://github.com/foobarto/glorbo) and
other foobarto tools.

## Install

```bash
brew tap foobarto/tap
brew install glorbo
```

## Available formulae

| Formula | Description | Upstream |
|---------|-------------|----------|
| `glorbo` | Filesystem-first agent orchestration (Elixir/OTP + Phoenix LiveView) | [foobarto/glorbo](https://github.com/foobarto/glorbo) |

## Glorbo — platform note

Glorbo is **Linux-only**. It depends on `bubblewrap` (kernel-enforced
sandboxing) and inotify kernel APIs (filesystem watcher); macOS has
neither. The formula declares `depends_on :linux` so a `brew install`
on macOS will refuse rather than ship a broken binary.

Homebrew on Linux (aka Linuxbrew) is fully supported on both
`x86_64` and `aarch64`.

## First-run

```bash
glorbo doctor          # check host preconditions
glorbo init            # scaffold ~/.glorbo/ with the example company
glorbo up              # start the dashboard at http://localhost:4000
```

Pre-1.0 — APIs, CLI flags, on-disk layout, and the SQLite schema
may change between minor versions.

## Releases

Formula updates land atomically with each tagged upstream release.
See [`Formula/glorbo.rb`](./Formula/glorbo.rb) for the current
version + sha256s.
