# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# gui style autocomplete (use arrow)
zstyle ':completion:*' menu select

# TODO: move these in a more logical location:

# VS CODE SHORTCUTS
# =================

DEV_PATH="/Users/laurent/dev/"

function cc() {
    code "${DEV_PATH}$1"
}

_cc() {
    \cd "${DEV_PATH}"
    compadd ./*/*.code-workspace
}

compdef _cc cc

# BOOTSTRAP SHORCUTS
# ==================

TEMPLATES_PATH="/Users/laurent/dev/templates/"

function bootstrap() {
    SRC="${TEMPLATES_PATH}/$1"
    DST="$2"

    if [[ -f "${SRC}" ]]; then
        cp "${SRC}" "${DST}"
    else
        copier "${SRC}" "${DST}"
    fi
}

_bootstrap() {
    compadd $(ls ${TEMPLATES_PATH})
}

compdef _bootstrap bootstrap
