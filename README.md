# tclip

`tclip` is a simple, lightweight command-line tool written in Rust that reads outputs piped into it and puts them in the clipboard enabling us to copy text without touching a mouse or a touch pad.

## Installation

You can install `tclip` directly from [crates.io](https://crates.io/crates/tclip) using Cargo:

```bash
cargo install tclip
```

## Usage

Simply pipe any command's output into `tclip`:

```bash
# Copy a simple string
echo "Hello, World!" | tclip

# Copy the contents of a file
cat src/main.rs | tclip

# Copy the output of a command
ls -la | tclip
```

## Supported Platforms

`tclip` uses the [arboard](https://crates.io/crates/arboard) crate under the hood, giving it excellent cross-platform support. It works across:
- **Linux** (X11 and Wayland)
- **macOS**
- **Windows**


*(Note if youre in Lnux x11 and not using a clipboard manager because `tclip` exits immedietely after copying you will lose the content before you can paste it ).*

## License

This project is licensed under the MIT license.
