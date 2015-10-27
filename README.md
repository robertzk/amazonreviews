R Amazon Reviews [![Build Status](https://travis-ci.org/robertzk/amazonreviews.svg?branch=master)](https://travis-ci.org/robertzk/amazonreviews)
=============

**Note**: This package is officially deprecated, Amazon has changed
their format to generate random HTML and prevent scraping.

Fetch a data.frame of reviews for an Amazon product using R. To install from this Github,
make sure you have the `devtools` package and run `install_github('amazonreviews', 'robertzk')`. 

Then you can fetch Amazon reviews by product ID:

````R
revs <- fetch_amazon_reviews(1449316956); print(tail(revs[, 1:6]))

#    helpful_count helpful_total stars           author                                      title              date
# 19             1             1     3     Susan Donath Only buy this if you want to learn ggplot2 February 16, 2014
# 20             1             1     5 Grant Coble-Neal                                 Great book  February 2, 2014
# 21             1             1     5         jb in sd    Good & thorough resource for scientists November 30, 2013
# 22             1             1     5  Stefano Picozzi            Right content at the right time November 28, 2013
# 23             3             4     4     Luiz Marques                 Good Coverage of the topic  January 14, 2013
# 24            NA            NA     3        I. Vining       It's more for ggplot2 than regular R    March 11, 2014
````

