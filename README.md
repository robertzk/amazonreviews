R Amazon Reviews
=====

Fetch a data.frame of reviews for an Amazon product using R. To install from this Github,
make sure you have the `devtools` package and run `install_github('amazonreviews', 'robertzk')`. 

Then you can fetch Amazon reviews by product ID:

````R
revs <- fetch_amazon_reviews(1449316956); print(tail(revs[, 1:5]))

#   helpful_count helpful_total           author                                        title              date
#   1            18            19      Ravi Aranke Treasure trove of graphing ideas and recipes  January 10, 2013
#   2             4             4  Felipe Carrillo                                   Great book February 24, 2013
#   3             3             3         W. Hogan           Good to have physical copy on hand December 12, 2013
#   4             5             6  Dimitri Shvorob          Actually, ggplot2 graphics cookbook  February 6, 2013
#   5             1             1     Susan Donath   Only buy this if you want to learn ggplot2 February 16, 2014
#   6             1             1 Grant Coble-Neal                                   Great book  February 2, 2014
````

