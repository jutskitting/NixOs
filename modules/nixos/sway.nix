{ writeText, ... }:
writeText "sway.conf" ''
font pango:monospace 4.000000
floating_modifier Mod4
default_border normal 1
default_floating_border normal 1
hide_edge_borders none
focus_wrapping no
focus_on_window_activation smart
mouse_warping output
workspace_layout default
workspace_auto_back_and_forth no

bindsym Mod4+1 workspace number 1
bindsym Mod4+2 workspace number 2
bindsym Mod4+3 workspace number 3
bindsym Mod4+4 workspace number 4
bindsym Mod4+5 workspace number 5
bindsym Mod4+6 workspace number 6
bindsym Mod4+7 workspace number 7
bindsym Mod4+8 workspace number 8
bindsym Mod4+9 workspace number 9
bindsym Mod4+Down focus down
bindsym Mod4+Left focus left
bindsym Mod4+Return exec /nix/store/2yv3377i0lbr4j9b4vrvfpwx0kd3qqfx-foot-1.16.2/bin/foot
bindsym Mod4+Right focus right
bindsym Mod4+Shift+1 move container to workspace number 1
bindsym Mod4+Shift+2 move container to workspace number 2
bindsym Mod4+Shift+3 move container to workspace number 3
bindsym Mod4+Shift+4 move container to workspace number 4
bindsym Mod4+Shift+5 move container to workspace number 5
bindsym Mod4+Shift+6 move container to workspace number 6
bindsym Mod4+Shift+7 move container to workspace number 7
bindsym Mod4+Shift+8 move container to workspace number 8
bindsym Mod4+Shift+9 move container to workspace number 9
bindsym Mod4+Shift+Down move down
bindsym Mod4+Shift+Left move left
bindsym Mod4+Shift+Right move right
bindsym Mod4+Shift+Up move up
bindsym Mod4+Shift+c reload
bindsym Mod4+Shift+e exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'
bindsym Mod4+Shift+h move left
bindsym Mod4+Shift+j move down
bindsym Mod4+Shift+k move up
bindsym Mod4+Shift+l move right
bindsym Mod4+Shift+minus move scratchpad
bindsym Mod4+Shift+q kill
bindsym Mod4+Shift+space floating toggle
bindsym Mod4+Up focus up
bindsym Mod4+a focus parent
bindsym Mod4+b splith
bindsym Mod4+d exec /nix/store/8nfks5br98fgf0gs8rp8bnhjmrkra7hh-dmenu-5.2/bin/dmenu_path | /nix/store/8nfks5br98fgf0gs8rp8bnhjmrkra7hh-dmenu-5.2/bin/dmenu | /nix/store/sq0w0jchkjqbxl47h52kfwa33qp1adfh-findutils-4.9.0/bin/xargs swaymsg exec --
bindsym Mod4+e layout toggle split
bindsym Mod4+f fullscreen toggle
bindsym Mod4+h focus left
bindsym Mod4+j focus down
bindsym Mod4+k focus up
bindsym Mod4+l focus right
bindsym Mod4+minus scratchpad show
bindsym Mod4+r mode resize
bindsym Mod4+s layout stacking
bindsym Mod4+space focus mode_toggle
bindsym Mod4+v splitv
bindsym Mod4+w layout tabbed

mode "resize" {
  bindsym Down resize grow height 10 px
  bindsym Escape mode default
  bindsym Left resize shrink width 10 px
  bindsym Return mode default
  bindsym Right resize grow width 10 px
  bindsym Up resize shrink height 10 px
  bindsym h resize shrink width 10 px
  bindsym j resize grow height 10 px
  bindsym k resize shrink height 10 px
  bindsym l resize grow width 10 px
}

default_border pixel 1

client.placeholder #000000 #0c0c0c #ffffff #000000 #0c0c0c
client.background #ffffff

client.focused #005500 #005500 #FFFFFF #005500
client.unfocused #222222 #222222 #888888 #292D2E
client.focused_inactive #333333 #333333 #888888 #292D2E
client.urgent #FF0000 #FF0000 #FFFFFF #FF0000

focus_follows_mouse no

gaps inner 10
gaps outer 10

bar {
  font pango:monospace 6.000000
  mode dock
  hidden_state hide
  position bottom
  status_command /nix/store/sdd6xw8a55zphlqhygbkhzpfc4baii55-i3status-2.14/bin/i3status
  swaybar_command /nix/store/r395ljs0yzfvf1b61lkn45mkx1si3fay-sway-1.8.1/bin/swaybar
  workspace_buttons yes
  strip_workspace_numbers no
  tray_output primary
  colors {
    background #323232
    statusline #ffffff
    separator #666666
    focused_workspace #4c7899 #285577 #ffffff
    active_workspace #333333 #5f676a #ffffff
    inactive_workspace #32323200 #32323200 #5c5c5c
    urgent_workspace #2f343a #900000 #ffffff
    binding_mode #2f343a #900000 #ffffff
  }

}

seat seat0 hide_cursor 3000

exec autotiling

exec swayidle -w \
  timeout 300 'swaylock -f -c 000000' \
  timeout 600 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' \
  before-sleep 'swaylock -f -c 000000'

exec "/nix/store/yj1vp6pcb4izg73p4007ckyhak5icxbp-dbus-1.14.10/bin/dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK XDG_CURRENT_DESKTOP XDG_SESSION_TYPE NIXOS_OZONE_WL; systemctl --user start sway-session.target"

''
