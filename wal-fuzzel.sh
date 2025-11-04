#!/usr/bin/env sh

#!/usr/bin/env bash
# Generate fuzzel theme from pywal colors

colors_file="$HOME/.cache/wal/colors.json"
fuzzel_config="$HOME/.config/fuzzel/fuzzel.ini"

if [[ ! -f "$colors_file" ]]; then
  echo "Pywal colors.json not found."
  exit 1
fi

# Read colors
bg=$(jq -r '.colors.color0' "$colors_file")
fg=$(jq -r '.special.foreground' "$colors_file")
sel_bg=$(jq -r '.colors.color2' "$colors_file")
sel_fg=$(jq -r '.special.background' "$colors_file")
border=$(jq -r '.colors.color1' "$colors_file")

# Create or update the Fuzzel config
mkdir -p "$(dirname "$fuzzel_config")"

cat > "$fuzzel_config" <<EOF
[main]
font=JetBrainsMono Nerd Font:size=12
lines=10
width=40
horizontal-pad=20
vertical-pad=10
inner-pad=10

[colors]
background=${bg}cc
text=${fg}ff
match=${sel_fg}ff
selection=${sel_bg}ff
selection-text=${sel_fg}ff
border=${border}ff
EOF
