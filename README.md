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
