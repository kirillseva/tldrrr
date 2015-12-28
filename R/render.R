render <- function(document, command) {
  if (not_found(document)) {
    cat(paste0("Page not found. This is your chance to contribute to open source!\n\n",
    "Submit a pull request to: ", crayon::yellow("https://github.com/tldr-pages/tldr"),
    " with instructions on how to use ", crayon::red(command), "\n"))
    return(invisible(TRUE))
  }
  print_out(vapply(capture.output(cat(document)), colourize, character(1)))
}

colourize <- function(str) {
  if (substring(str, 1, 1) == '#') {
    str <- substring(str, 2) # remove the markup
    str <- gsub("^\\s+|\\s+$", "", str) # trim whitespaces
    crayon::bold$red(str)
  } else if (substring(str, 1, 1) == '>') {
    str <- substring(str, 2) # remove the markup
    str <- gsub("^\\s+|\\s+$", "", str) # trim whitespaces
    crayon::underline(str)
  } else if (substring(str, 1, 1) == '-') {
    str <- substring(str, 2) # remove the markup
    str <- gsub("^\\s+|\\s+$", "", str) # trim whitespaces
    paste0('• ', crayon::green(str))
  } else if (substring(str, 1, 1) == '`') {
    str <- gsub('`', '', str) # remove the markup
    str <- gsub("^\\s+|\\s+$", "", str) # trim whitespaces
    paste0('  ', str)
  } else { str }
}

print_out <- function(document) {
  lapply(document, function(x) { cat(x, '\n') })
  invisible(TRUE)
}
