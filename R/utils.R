is.simple_string <- function(str) {
  is.character(str) && identical(length(str), 1L) && !is.na(str) && nzchar(str)
}

#' @author Kevin Ushey
#' @source \url{https://github.com/rstudio/packrat/blob/ce9fb1de3ed490d3f85b0cae4534a3e998db659e/R/platform.R#L1}
is.windows <- function() {
  Sys.info()["sysname"] == "Windows"
}

#' @author Kevin Ushey
#' @source \url{https://github.com/rstudio/packrat/blob/ce9fb1de3ed490d3f85b0cae4534a3e998db659e/R/platform.R#L5}
is.mac <- function() {
  Sys.info()["sysname"] == "Darwin"
}

#' @author Kevin Ushey
#' @source \url{https://github.com/rstudio/packrat/blob/ce9fb1de3ed490d3f85b0cae4534a3e998db659e/R/platform.R#L9}
is.linux <- function() {
  Sys.info()["sysname"] == "Linux"
}

get_platform <- function() {
  if (is.mac()) { "osx" } else { tolower(Sys.info()["sysname"]) }
}

not_found <- function(result) {
  NOT_FOUND <- "Not Found"
  identical(result, NOT_FOUND)
}
