#' Fetch the amazon reviews by product id.
#'
#' @param id integer. The product ID as in the URL, for example,
#'   \code{http://www.amazon.com/R-Graphics-Cookbook-Winston-Chang/product-reviews/1449316956}
#'   would give an ID of 1449316956.
#' @param page integer. Pagination support for long queries.
#' @return data.frame containing the reviews with names
#'   helpful_count, helpful_total, stars, title, date, description
#' @export
fetch_amazon_reviews <- function(id, page = 1) {
  curl <- RCurl::getCurlHandle(useragent = "R", followlocation = TRUE)
  URL <- paste0('http://www.amazon.com/my-favorite-book/product-reviews/', id)
  if (page > 1) URL <- paste0(URL, '/ref=cm_cr_pr_top_link_', page, '?pageNumber=', page)
  raw.html <- RCurl::getURL(URL, curl = curl)
  parsed.html <- XML::htmlParse(raw.html)

  if (page == 1) {
    pages <- as.vector(XML::xpathSApply(parsed.html, "//div[@class='CMpaginate']"))[[1]]
    page_count <- as.integer(gsub('.*([0-9]+)', '\\1', gsub(' \\| Next.*$', '', xmlValue(pages[[2]]))))
    more_reviews <- lapply(seq_len(page_count - 1) + 1,
                         function(page_num) fetch_amazon_reviews(id, page = page_num))
  } else more_reviews <- NULL

  reviews <- as.vector(XML::xpathSApply(parsed.html, '//table[@id="productReviews"]/tr/td/div'))
  reviews_df <- do.call(rbind, lapply(reviews, review_to_df))
  do.call(rbind, append(more_reviews, list(reviews_df)))
}

