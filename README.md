# homebrew-tap

Homebrew tap for [Glorbo](https://github.com/foobarto/glorbo),
[Gapia Desktop](https://github.com/foobarto/gapia-desktop), and other foobarto
tools.

## Install

```bash
brew tap foobarto/tap
brew install glorbo
brew install gapia-desktop
```

## Available formulae

| Formula | Description | Upstream |
|---------|-------------|----------|
| `devbox` | Disposable, CWD-mounted dev VMs on Lima with an AI-CLI toolchain | [foobarto/devbox](https://github.com/foobarto/devbox) |
| `gapia-desktop` | GNOME display controls for VITURE XR glasses | [foobarto/gapia-desktop](https://github.com/foobarto/gapia-desktop) |
| `glorbo` | Filesystem-first agent orchestration (Elixir/OTP + Phoenix LiveView) | [foobarto/glorbo](https://github.com/foobarto/glorbo) |

## Gapia Desktop setup

The VITURE Linux SDK is licensed and downloaded separately. It is not included
in this tap or in Gapia Desktop release artifacts. Install from source with the
extracted SDK, then run the self-elevating, idempotent host integration once:

```bash
HOMEBREW_GAPIA_VITURE_SDK_DIR=/path/to/sdk brew install --build-from-source gapia-desktop
gapia-desktop-setup-host
```

Run `gapia-desktop-setup-host` without a `sudo` prefix. The wrapper requests
administrator access by absolute path, avoiding the restricted command search
path used by `sudo` on many Linux systems.

The current verified hardware profile is VITURE Beast on GNOME 50 Wayland.

## Glorbo — platform notes

**Linux** (full runtime): `brew install foobarto/tap/glorbo` pulls
the bwrap-sandboxed binary + declares `bubblewrap` as a
dependency. Homebrew-on-Linux on both `x86_64` and `aarch64`.

**macOS** (experimental, unsandboxed): the formula pulls a darwin
binary; agents run without the kernel sandbox because bwrap has
no macOS equivalent yet. `glorbo doctor` flags this. Not
recommended for production use.

**Windows**: install Glorbo inside [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)
and use the Linux Homebrew formula there. There are no native
Windows builds; agent runtime depends on Linux kernel primitives
(bwrap, inotify, user namespaces) that WSL provides transparently.

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


## License

Licensed under either of

- Apache License, Version 2.0
  ([LICENSE-APACHE](LICENSE-APACHE) or
  <http://www.apache.org/licenses/LICENSE-2.0>)
- MIT license
  ([LICENSE-MIT](LICENSE-MIT) or
  <http://opensource.org/licenses/MIT>)

at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally
submitted for inclusion in the work by you, as defined in the Apache-2.0
license, shall be dual licensed as above, without any additional terms
or conditions.
