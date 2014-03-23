\name{fetch_amazon_reviews}
\alias{fetch_amazon_reviews}
\title{Fetch the amazon reviews by product id.}
\usage{
fetch_amazon_reviews(id, page = 1)
}
\arguments{
  \item{id}{integer. The product ID as in the URL, for
  example,
  \code{http://www.amazon.com/R-Graphics-Cookbook-Winston-Chang/product-reviews/1449316956}
  would give an ID of 1449316956.}
}
\value{
data.frame containing the reviews with names helpful_count,
helpful_total, stars, title, date, description
}
\description{
Fetch the amazon reviews by product id.
}

