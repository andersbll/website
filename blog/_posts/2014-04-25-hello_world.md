---
layout: blog_post
title: Hello brave new world
date: 2014-04-25
---

After months of rumination, I have finally converged to a good personal website solution.
As it turned out, the toughest part was to choose the right frameworks!
At first, I was reluctant to use the popular [Jekyll][jekyll] (I'm not a Ruby programmer) in favor of the Python-based [Pelican][pelican].
However, Jekyll and its surrounding ecosystem is more mature and I have not run into limitations like I did with my initial attempt using Pelican.

Some highlights of this website are:

- Static site generation.
This allows me to edit plain text files with [Markdown syntax][markdown] and having them transformed to static HTML that doesn't require fancy server-side logic.
- [Responsive design][responsive] using [Bootstrap][bootstrap].
Bootstrap also provides a useful library of sane building blocks that allow a HTML/JavaScript illiterate like me to produce cross-platform websites.
- Good separation between layout and content.
- Easy integration with BibTeX using [Jekyll-Scholar][jekyll-scholar].
- I can deploy changes and new content to the website with a simple `make deploy` command.

The source of my website is [on Github][source] - feel free to grab whatever you might find useful. Also, you should consider adding plenty of [HTML9][html9] pizzazz!

## Purpose of this blog
I have included a blog on my website as an attempt to exercise my communication skills.
While academia is still focused on the traditional publication pipeline through peer-review, there are plenty of good web-based publication alternatives nowadays.
A blog is a practical way to publish work and findings in an informal manner.
Another motivation behind this blog is the chance to dump the academic by-products that would never get published otherwise (e.g. presentations, notes, tutorials, mediocre results).
I suspect these by-products can be put online without too much work - and they might even be useful for others.

So far, this is all cheap talk on my part as I have yet to fill up this website!
My intentions are to write on a monthly basis (a lower bound).
At least, now that I have a website, I have one less excuse for keeping my work to myself.


[html9]: http://html9responsiveboilerstrapjs.com/
[jekyll]: http://jekyllrb.com
[jekyll-scholar]: http://github.com/inukshuk/jekyll-scholar
[bootstrap]: http://getbootstrap.com/
[markdown]: http://en.wikipedia.org/wiki/Markdown
[responsive]: http://en.wikipedia.org/wiki/Responsive_web_design
[pelican]: http://docs.getpelican.com/
[source]: http://github.com/andersbll/website
