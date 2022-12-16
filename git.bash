#!/bin/bash
HTML=/var/www/html
COMMAND='git pull'
cd $HTML/rikardssonbygg && $COMMAND
cd $HTML/robinsmediateam.dev && $COMMAND
cd $HOME/composefiles && $COMMAND
cd $HOME/dotfiles && $COMMAND
