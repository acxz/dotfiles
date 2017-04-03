#!/bin/bash
i3-msg "workspace 10: mzc; append_layout ~/.config/i3/workspace_10.json"

(firefox &)
(termite -e "cava" &)
(termite -e "ncmpcpp" &)
