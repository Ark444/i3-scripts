Calendar
===

## Installation


Add those lines to your i3 config file:

```
bindsym $mod+c exec --no-startup-id i3-sensible-terminal -e <PATH_TO_YOUR_SCRIPT_FOLDER>/calendar.sh --geometry=220x175 --class TermCalendar
for_window [class="^TermCalendar$"] floating enable
```

I am unsure wether `--geometry` parameter is applicable to your terminal. I use [termite](https://github.com/thestinger/termite/).


