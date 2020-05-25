#!/bin/sh
i3-msg 'workspace 1; exec dex /usr/share/applications/google-chrome.desktop'
sleep 2
i3-msg 'workspace 2; exec dex /usr/share/applications/termite.desktop'
i3-msg 'exec dex /usr/share/applications/termite.desktop'
sleep 0.5
i3-msg 'workspace 3; exec dex /usr/share/applications/visual-studio-code.desktop'
sleep 2
i3-msg 'workspace 10; exec dex /usr/share/applications/telegramdesktop.desktop'
sleep 2

i3-msg 'workspace 1'
