----
title: Home
----

This site is just testing static site generation using Hakyll rather than other 
tools.

Process:

 #. Install stack
 #. Use stack to create a [hakyll]() site using the `hakyll-template`
 #. Modify `site.hs` to switch from blog-esque generation to static pages
 #. Set [pandoc]() configuration to use MathJax
 #. Give up on installed MathJax and use the CDN instead
 #. Install bootstrap via bower, and begin the restyling effort

### Style demos

Here is one TeX math expression: $\lambda x.x$.  It's quite simple, easily 
rendered using Unicode characters.  So let's get a little trickier, with a 
limit expression: $\lim_{x\to\infty} f(x)$. Or a sum expression: 
$\sum_{n=1}^{\infty} 2^{-n} = 1$.  So far, so good; MathJax renders these 
nicely and puts them all inline with other text, so long as I steer clear of 
using `\limit`.

[hakyll]: http://jaspervdj.be/hakyll/
[pandoc]: http://pandoc.org/
