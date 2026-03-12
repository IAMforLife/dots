#!/bin/bash
# Reads matugen-colors.ini and sends OSC sequences to all foot terminals

CONFIG="$HOME/.config/foot/colors.ini"

# Parse hex values from the ini
fg=$(grep '^foreground' "$CONFIG" | cut -d= -f2 | tr -d ' ')
bg=$(grep '^background' "$CONFIG" | cut -d= -f2 | tr -d ' ')
c0=$(grep '^regular0'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c1=$(grep '^regular1'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c2=$(grep '^regular2'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c3=$(grep '^regular3'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c4=$(grep '^regular4'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c5=$(grep '^regular5'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c6=$(grep '^regular6'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c7=$(grep '^regular7'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c8=$(grep '^bright0'    "$CONFIG" | cut -d= -f2 | tr -d ' ')
c9=$(grep '^bright1'    "$CONFIG" | cut -d= -f2 | tr -d ' ')
c10=$(grep '^bright2'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c11=$(grep '^bright3'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c12=$(grep '^bright4'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c13=$(grep '^bright5'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c14=$(grep '^bright6'   "$CONFIG" | cut -d= -f2 | tr -d ' ')
c15=$(grep '^bright7'   "$CONFIG" | cut -d= -f2 | tr -d ' ')

# Build OSC sequence string
OSC=""
OSC+="\e]10;#${fg}\e\\"   # foreground
OSC+="\e]11;#${bg}\e\\"   # background
OSC+="\e]4;0;#${c0}\e\\"
OSC+="\e]4;1;#${c1}\e\\"
OSC+="\e]4;2;#${c2}\e\\"
OSC+="\e]4;3;#${c3}\e\\"
OSC+="\e]4;4;#${c4}\e\\"
OSC+="\e]4;5;#${c5}\e\\"
OSC+="\e]4;6;#${c6}\e\\"
OSC+="\e]4;7;#${c7}\e\\"
OSC+="\e]4;8;#${c8}\e\\"
OSC+="\e]4;9;#${c9}\e\\"
OSC+="\e]4;10;#${c10}\e\\"
OSC+="\e]4;11;#${c11}\e\\"
OSC+="\e]4;12;#${c12}\e\\"
OSC+="\e]4;13;#${c13}\e\\"
OSC+="\e]4;14;#${c14}\e\\"
OSC+="\e]4;15;#${c15}\e\\"

# Send to all foot PTYs
for pty in /dev/pts/*; do
  [[ -c "$pty" ]] && printf "$OSC" > "$pty" 2>/dev/null
done
