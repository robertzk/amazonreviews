#' Convert an Amazon review XML node into a data.frame
#'
#' @param review XMLInternalElementNode. This will be parsed into a 1-row data.frame
#' @return a dataframe containing names: helpful_count, helpful_total, stars, title, date, description
review_to_df <- function(review) {
  helpfulness <-  grepl('people found this review helpful', XML::xmlValue(review[[3]][[5]]))
  # offset <- if (helpfulness) 2 else 0
  data.frame(
    helpful_count = if (helpfulness) parse_float(review[[1]]) else NA,
    helpful_total = if (helpfulness) parse_float(gsub('.* of ', '', XML::xmlValue(review[[1]]))) else NA,
    stars         = parse_float(review[[2]]),
    author        = XML::xmlValue(review[[3]][[1]][[3]]),
    title         = XML::xmlValue(review[[2]][[3]]),
    date          = substring(XML::xmlValue(review[[3]][[4]]), 4),
    description   = XML::xmlValue(review[[5]][[1]]),
    stringsAsFactors = FALSE
  )
}
