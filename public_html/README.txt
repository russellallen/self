I spent a little bit of time refactoring the Self website - simplifying the directory structure, using CSS and SSI to let me eliminate a bunch of duplication in the HTML, things like that - in preparation for moving the site to somewhere other than the Sun Labs server (since we don't work there anymore). There's not really much point in deploying the website right now, since there's nothing new here. But if we someday put out a new release of Self, we'll probably want to post this new website too.

The stuff in this "public_html" directory is not the entire website; we need to pull in a few things that are kept elsewhere in CVS. There's a script in the "release" directory called makeSelfWebsite that will do this automatically.

-- Adam, December 2007
