check_deps <- function(lesson) {
  url <- glue::glue("https://raw.githubusercontent.com/emptyfield-ds/{lesson}/HEAD/.deps")
  pkgs <- tryCatch(
    suppressWarnings(readLines(url, encoding = "UTF-8", warn = FALSE)),
    error = function(.e) NULL
  )

  if (is.null(pkgs)) {
    return(invisible())
  }
  rlang::check_installed(pkgs, "for this lesson.")
}
