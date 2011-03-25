# vim: set filetype=sh:

alias rm="gvfs-trash"
alias remove="/bin/rm"
alias alarm="play /home/douglas/.local/Dropbox/doug/Historicals/Ringtones/TfF-Everybody\ Wants-Alarm2.mp3"
alias previous_command_name='history|tail -n1|sed -e "s/^\s*[0-9]\+\s*//" -e "s/;\s*alert$//"'
alias alert='notify-send -i /usr/share/icons/gnome/32x32/apps/gnome-terminal.png "[$?] $(previous_command_name)"'

alias new-totem="totem --no-existing-session"
alias new-chrome="chromium-browser --temp-profile"

alias wget-mirror="wget -e robots=off --timestamping --recursive --level=inf --no-parent --page-requisites --convert-links --backup-converted"
alias wget-fullpage="wget -e robots=off --page-requisites --span-hosts --convert-links"

alias record-screen="ffmpeg -r 30 -s 1680x1050 -f x11grab -i :0.0 -vcodec msmpeg4v2 -qscale 2"
#alias record-screen="ffmpeg -f oss -i /dev/audio -r 30 -s 1680x1050 -f x11grab -i :0.0 -vcodec msmpeg4v2 -qscale 2"
