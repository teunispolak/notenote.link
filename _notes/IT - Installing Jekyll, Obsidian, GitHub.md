---
title: Installing Jekyll, Obsidian, GitHub
toc: false
season: summer
category: theme
tags: theme
---

Forked from [github](https://github.com/Maxence-L/notenote.link) and followed the instructions as indicated [here](https://notenote.link/notes/how-to-setup-this-site).

The "bundle" step gave issues. The "bundle" command by the way is equivalent to "bundle install", slightly adding to my confusion.

If my understanding is correct, "bundle" results in installation of the gems described in gems.lock. This gems.lock looks outdated at two points: it doesn't work with Ruby 3.0, which I installed with homebrew in addition to Mojave's default Ruby 2.7. Things can be kept separately, was my idea. Well, not really: the notenotelink template doesn't like Ruby 3.0 and apparently also webrick must be separately installed nowadays.

I applied the two solutions given in https://talk.jekyllrb.com/t/load-error-cannot-load-such-file-webrick/5417. First "bundle add webrick", and since that didn't cure it all, I also downgraded the homebrew Ruby to 2.7. I had to adjust ~/.bashr_profile to get the 2.7 version to work.

Next, "bundle install" and "bundle exec jekyll serve" gave a working site on localhost port 4000. And a horrible amount of error messages (some item deprecated) but hey, who cares. For now.

Created a short start-jekyll.sh bash script in the root of the jekyll site, plus a launch agent com.tepo.local.notpoemsandrubbish.plist in ~/Library/LaunchAgents to make sure that the site is served as soon as the host is running by adding the plist file to the startup sequence with 

```
launchctl load -w ~/Library/LaunchAgents/com.tepo.local.notpoemsandrubbish.plist
```

