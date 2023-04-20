#' Check dependencies
#'
#' @param lesson name of lesson
#'
#' @return dependencies
#'
#' @importFrom glue glue
#' @importFrom rlang check_installed
#'
#' @examples
#' check_deps("import")
check_deps <- function(lesson) {
  url <- glue::glue("https://raw.githubusercontent.com/paradigmdatagroup/{lesson}/HEAD/.deps")
  pkgs <- tryCatch(
    suppressWarnings(readLines(url, encoding = "UTF-8", warn = FALSE)),
    error = function(.e) NULL
  )
  if (is.null(pkgs)) {
    return(invisible())
  }
  rlang::check_installed(pkgs, "for this lesson.")
}
