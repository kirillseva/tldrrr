#' Get tldr summary of a system command
#'
#' @param command character. The system command that interests you.
#' @param platform character. If the man file is not platform-agnostic,
#'   search platform specific options. Defaults to your system platform.
#'
#' @export
tldr <- function(command, platform = get_platform()) {
  stopifnot(is.simple_string(command))
  render(query(force(platform), command), command)
}

make_url <- function(platform, command) {
  BASE_URL <- "https://raw.github.com/tldr-pages/tldr/main/pages/"
  paste0(BASE_URL, platform, "/", command, ".md")
}

get_md_file <- function(platform, command) {
  httr::content(httr::GET(url = make_url(platform, command)))
}

query <- memoise::memoize(function(platform, command) {
  result <- get_md_file("common", command)
  if (not_found(result)) {
    result <- get_md_file(platform, command)
  }
  result
})
