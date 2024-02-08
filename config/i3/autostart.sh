#!/bin/sh
layout_path=$HOME/.config/i3/layouts
r_shared=/usr/share/applications
r_local=$HOME/.local/share/applications

# Apply layouts
for i in $( seq 1 10 ); do
	[ -f $layout_path/w$i.json ] && i3-msg "workspace $i; append_layout $layout_path/w$i.json"
done

# Most are Electron / Chrome apps, they start slooow
i3-msg "exec dex $r_shared/slack.desktop; exec dex $r_local/google-chrome-proton.desktop"
sleep 5
i3-msg "exec dex $r_shared/Alacritty.desktop"
i3-msg "exec dex $r_shared/Alacritty.desktop"
sleep 1
i3-msg "exec dex $r_shared/visual-studio-code.desktop"
sleep 5
i3-msg "exec dex $r_shared/obsidian.desktop"
sleep 2
#i3-msg "exec dex $r_shared/google-chrome.desktop; exec dex $r_local/google-chrome-orchideio.desktop"
i3-msg "exec dex $r_shared/google-chrome.desktop"
sleep 5
i3-msg "exec dex $r_shared/bitwarden.desktop"
sleep 2
#i3-msg "exec dex $r_shared/telegramdesktop.desktop; exec dex $r_shared/discord.desktop"
i3-msg "exec dex $r_shared/telegramdesktop.desktop"
sleep 5

i3-msg "workspace 1"
