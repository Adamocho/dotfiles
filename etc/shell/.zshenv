export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
#. "$HOME/.cargo/env"

# Sccache export - comment out when it's not installed
#export RUSTC_WRAPPER="$HOME/.cargo/bin/sccache"
export RUSTC_WRAPPER=$(which sccache)

# For alacritty cursor support
export XCURSOR_SIZE=24
export XCURSOR_THEME='Adwaita'

# Man use nvim as pager
export MANPAGER='nvim +Man!'
