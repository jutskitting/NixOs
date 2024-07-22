[env]
TERM = "screen-256color"

[window.dimensions]
columns = 0
lines = 0

[window.padding]
x = 2
y = 2

[window]
dynamic_title = true
decorations = "full"
opacity = 1

[font]
size = 8.5

[font.normal]
family = "monospace"
style = "Light"

[font.bold]
family = "monospace"
style = "Bold"

[font.italic]
family = "monospace"
style = "Light"  # or "Italic" if available

[colors.primary]
background = "0x000000"
foreground = "0xd8d8d8"

[colors.cursor]
text = "0x181818"
cursor = "0xd8d8d8"

[colors.normal]
black = "0x000000"
red = "0xab4642"
green = "0xa1b56c"
yellow = "0xf7ca88"
blue = "0x7cafc2"
magenta = "0xba8baf"
cyan = "0x86c1b9"
white = "0xd8d8d8"

[colors.bright]
black = "0x585858"
red = "0xab4642"
green = "0xa1b56c"
yellow = "0xf7ca88"
blue = "0x7cafc2"
magenta = "0xba8baf"
cyan = "0x86c1b9"
white = "0xd8d8d8"

[cursor]
style = "Block"
unfocused_hollow = true

[bell]
animation = "EaseOutExpo"
duration = 0

[[mouse.bindings]]
mouse = "Middle"
action = "PasteSelection"

[mouse]
hide_when_typing = true

[selection]
semantic_escape_chars = ",│`|:\"' ()[]{}<>"
save_to_clipboard = true

[debug]
render_timer = false
