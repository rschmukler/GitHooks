#!/bin/sh
#
# Automatically includes reference tags on commit messages if the active branch includes a references config variable
# ie. git config --set branch.<branch_name>.references <some_number> # Such as the github issue number or the Pivotal Tracker number
# Then all commit messages made in the branch will have " [#<some_number] appended onto the end"
#

NAME=$(git branch | grep '*' | sed 's/* //') 
REFERENCES=$(git config branch."$NAME".references)

if [ -n "$REFERENCES" ]
then
  echo $(cat "$1") > "$1"
  echo " [#$REFERENCES]" >> "$1"
fi

