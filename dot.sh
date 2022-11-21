#!/usr/bin/env bash

COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_CYAN='\033[0;36m'
NO_COLOR='\033[0m'

declare -A dots=(
	["wm/sway"]="${HOME}/.config/sway"
	["wm/waybar"]="${HOME}/.config/waybar"
	["term/kitty"]="${HOME}/.config/kitty"
	["shell/fish"]="${HOME}/.config/fish"
	["dev/git"]="${HOME}/.config/git"
	["compilers/cargo.toml"]="${HOME}/.cargo/config.toml"
)

_exists() {
	[[ -f $1 ]] || [[ -d $1 ]] || readlink "$1" >/dev/null
}

_link() {
	for dotfile in "${!dots[@]}"; do
		out="${dots[$dotfile]}"
		echo -en " ${COLOR_CYAN}Install${NO_COLOR} ${dotfile}"

		if ! _exists "$out"; then
			ln -s "$(realpath "config/${dotfile}")" "$out"
			echo -e " [ ${COLOR_GREEN}OK${NO_COLOR} ]"
		else
			echo -e " [ ${COLOR_RED}IGNORED${NO_COLOR} ]"
		fi
	done
}

_unlink() {
	for dotfile in "${!dots[@]}"; do
		out="${dots[$dotfile]}"
		echo -en " ${COLOR_CYAN}Uninstall${NO_COLOR} ${dotfile}"

		if _exists "$out"; then
			unlink "$out"
			echo -e " [ ${COLOR_GREEN}OK${NO_COLOR} ]"
		else
			echo -e " [ ${COLOR_RED}IGNORED${NO_COLOR} ]"
		fi
	done
}

case "$1" in
link)
	shift && _link "$@"
	;;
unlink)
	shift && _unlink "$@"
	;;
*)
	cat <<EOF
dot - 0.1.0

USAGE:
 link   # Link user configuration
 unlink # Unlink user configuration
EOF
	;;
esac
