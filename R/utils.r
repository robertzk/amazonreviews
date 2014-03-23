#' Parse an XMLNode into a float by stripping everything non-numeric
#' around the first numeric.
#' @param value XMLNode or character.
#' @return numeric that represents the parsed value.
parse_float <- function(value) {
  if (inherits(value, 'XMLInternalNode')) value <- xmlValue(value)
  as.numeric(gsub('[^0-9.].*$', '', gsub('^[^0-9.]*', '', value)))
}
