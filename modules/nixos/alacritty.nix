env:
  TERM: screen-256color

window:
  opacity: 0.8
  dimensions:
    columns: 0
    lines: 0

  padding:
    x: 2
    y: 2

  decorations: full

draw_bold_text_with_bright_colors: true

font:
  normal:
    family: "DroidSansM"
    style: Retina

  # The bold font face
  bold:
    family: "DroidSansM"
    style: Bold

  # The italic font face
  italic:
    family: "DroidSansM"
  size: 8.0

debug.render_timer: false

# Base16 Default Dark 256 - alacritty color config
# Chris Kempson (http://chriskempson.com)
colors:
  # Default colors
  primary:
    background: '0x000000'
    foreground: '0xd8d8d8'

  # Colors the cursor will use if `custom_cursor_colors` is true
  cursor:
    text: '0x181818'
    cursor: '0xd8d8d8'
    style: Block
    unfocused_hollow: true

  # Normal colors
  normal:
    black:   '0x000000'
    red:     '0xab4642'
    green:   '0xa1b56c'
    yellow:  '0xf7ca88'
    blue:    '0x7cafc2'
    magenta: '0xba8baf'
    cyan:    '0x86c1b9'
    white:   '0xd8d8d8'

  # Bright colors
  bright:
    black:   '0x585858'
    red:     '0xab4642'
    green:   '0xa1b56c'
    yellow:  '0xf7ca88'
    blue:    '0x7cafc2'
    magenta: '0xba8baf'
    cyan:    '0x86c1b9'
    white:   '0xd8d8d8'

bell:
  animation: EaseOutExpo
  duration: 0


mouse_bindings:
  - { mouse: Middle, action: PasteSelection }

mouse:
  double_click: { threshold: 300 }
  triple_click: { threshold: 300 }

  faux_scrolling_lines: 1

  hide_when_typing: true

selection:
  semantic_escape_chars: ",?`|:\"' ()[]{}<>"
  save_to_clipboard: true

window.dynamic_title: true


live_config_reload: true
