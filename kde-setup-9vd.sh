#!/bin/bash
# Setup a standard 9 virtual desktop setup with Meta+[1-9] keys for switching.
#
# Additional:
#  1. Sticky window (toggle "on all desktop")
#  2. Moving window to other desktops
#  3. Moving window to other screens
set -euf -o pipefail
set -x

symbol=(_ '!' '@' '#' '$' '%' '^' '&' '*' '(' ')')

kwriteconfig5 --file ~/.config/kwinrc \
	--group Desktops --key Number 9


for i in 1 2 3 4 5 6 7 8 9; do
	kwriteconfig5 --file ~/.config/kglobalshortcutsrc \
		--group kwin --key "Switch to Desktop $i" \
		"Meta+$i,none,Switch to Desktop $i"

	kwriteconfig5 --file ~/.config/kglobalshortcutsrc \
		--group kwin --key "Window to Desktop $i" \
		"Meta+${symbol[$i]},none,Window to Desktop $i"

	kwriteconfig5 --file ~/.config/kglobalshortcutsrc \
		--group plasmashell --key "activate task manager entry $i" \
		"none,Meta+$i,Activate Task Manager Entry $i"
done


kwriteconfig5 --file ~/.config/kglobalshortcutsrc \
	--group kwin --key "Window On All Desktops" \
	"Meta+),none,Keep Window on All Desktops"


kwriteconfig4 --file ~/.config/kglobalshortcutsrc \
	--group kwin --key 'Switch to Next Screen' \
	'Meta+.,none,Switch to Next Screen'

kwriteconfig4 --file ~/.config/kglobalshortcutsrc \
	--group kwin --key 'Switch to Previous Screen' \
	'Meta+\,,none,Switch to Previous Screen'

kwriteconfig5 --file ~/.config/kglobalshortcutsrc \
	--group kwin --key 'Window to Next Screen' \
	'Meta+Shift+.,Meta+Shift+Right,Window to Next Screen'

kwriteconfig5 --file ~/.config/kglobalshortcutsrc \
	--group kwin --key 'Window to Previous Screen' \
	'Meta+Shift+\,,Meta+Shift+Left,Window to Previous Screen'


# Disable Emoji selector, which collides with 'Switch to Next Screen'
kwriteconfig5 --file ~/.config/kglobalshortcutsrc \
	--group='org.kde.plasma.emojier.desktop' \
	--key='_launch' 'none,Meta+.,Emoji Selector'

echo Done
