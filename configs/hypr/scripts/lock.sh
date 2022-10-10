#!/bin/sh

###
# way_lock
# Lock Wayland session
#
# Run-Depends
#  x11/swayidle
#  x11/swaylock
#  {any /bin/sh capable of background execution}
#
# Note: swayidle implements KDE's idle protocol[1], so the compositor
#       acting as a window manager must support it.  Swayidle will not
#       work as intended otherwise.
# [1] https://github.com/swaywm/sway/blob/57d6f6f19e3088dcb8e202acade8c39a80075b4a/protocols/idle.xml
###

# Number of seconds before screen turns off
timeout=10

# Turn screen off after $timeout seconds of inactivity.
# Turn it on again when there is activity.
#
# swayidle acts like a daemon, meaning it continues execution even after
# the script is terminated, so we need to execute it in the background
# to be able to terminate it later (unless you like your screen turning
# off every 10 seconds for some reason?)
swayidle \
    timeout $timeout 'swaymsg output \* dpms off' \
    resume           'swaymsg output \* dpms on' \
    &

# Lock the screen and wait for it to be unlocked.
swaylock

# Screen unlocked: terminate swayidle and clean up PID
kill -TERM $!
wait
