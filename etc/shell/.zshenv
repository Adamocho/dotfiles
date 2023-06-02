export PATH="$HOME/.local/bin:$PATH"
. "$HOME/.cargo/env"

export RUSTC_WRAPPER="$HOME/.cargo/bin/sccache"

# Reload to include ~/.local/bin scripts
rm "$HOME/.cache/dmenu_run"
dmenu_path
