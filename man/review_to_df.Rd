\name{review_to_df}
\alias{review_to_df}
\title{Convert an Amazon review XML node into a data.frame}
\usage{
review_to_df(review)
}
\arguments{
  \item{review}{XMLInternalElementNode. This will be parsed
  into a 1-row data.frame}
}
\value{
a dataframe containing names: helpful_count, helpful_total,
stars, title, date, description
}
\description{
Convert an Amazon review XML node into a data.frame
}

