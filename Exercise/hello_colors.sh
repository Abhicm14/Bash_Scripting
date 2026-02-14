#!/bin/bash

# Purpose: Print "Hello World" in bold + blink + different colors using echo

# ANSI escape sequence basics:
#   \e[      -> start of escape sequence (same as \033[)
#   1        -> bold attribute
#   5        -> blink attribute  (note: many modern terminals ignore blinking)
#   31       -> red   text color
#   32       -> green text color
#   33       -> brown/yellow text color
#   34       -> blue  text color
#   35       -> magenta text color
#   36       -> cyan text color
#   37       -> white text color
#   m        -> end of the attribute list (Select Graphic Rendition)
#   \e[0m    -> reset all attributes (turn off bold, blink, colors, etc.)

# General pattern:
#   echo -e "\e[<attr>;<attr>;<color>mYour Text Here\e[0m"
# Example:
#   echo -e "\e[1;5;31mHello World\e[0m"

# Bold + blink + red
echo -e "\e[1;5;31mHello World\e[0m"

# Bold + blink + brown/yellow
echo -e "\e[1;5;33mHello World\e[0m"

# Bold + blink + green
echo -e "\e[1;5;32mHello World\e[0m"

# Bold + blink + blue
echo -e "\e[1;5;34mHello World\e[0m"