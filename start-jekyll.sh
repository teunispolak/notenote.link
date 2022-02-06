#!/bin/bash

# Jan 4, 2022
# This script can be run stand-alone: ./start-jekyll.sh does the trick since
# it has the execution bit set.
# At startup the script is automatically triggered by the
# ~/Library/LaunchAgents/com.tepo.local.notpoemsandrubbish.plist file.
# This last use case is why the source statement is included: the daemon needs PATH
#
# Note: cd /Users/teunis/notpoemsandrubbish is used to point to Gemfile and avoid
# an error. There must be a slightly more elegant way (redo bundle install or so)
# but that's for later.

source /Users/teunis/.bash_profile
cd /Users/teunis/notpoemsandrubbish
bundle exec jekyll serve
