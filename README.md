# tclip

`tclip` is a simple, lightweight command-line tool written in Rust that reads outputs piped into it and puts them in the clipboard enabling us to copy text without touching a mouse or a touch pad.

## Installation
 
if you have the cargo package manger installed you can simply install
`tclip` directly from [crates.io](https://crates.io/crates/tclip) using Cargo:

```bash
cargo install tclip
```
else

**For Windows**

Paste the line below in powershell to install `tclip`:

```powershell
irm https://raw.githubusercontent.com/yeabisra-b/tclip/main/install.ps1 | iex

```
**For Linux**

Paste the line below in Terminal to install `tclip`:

```bash
curl -sSL https://raw.githubusercontent.com/yeabisra-b/tclip/main/install.sh | bash

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

## Uninstallation

**If installed via Cargo:**
```bash
cargo uninstall tclip
```

**For Windows:**
```powershell
irm https://raw.githubusercontent.com/yeabisra-b/tclip/main/uninstall.ps1 | iex
```

**For Linux:**
```bash
curl -sSL https://raw.githubusercontent.com/yeabisra-b/tclip/main/uninstall.sh | bash
```

## License


This project is licensed under the MIT license.
