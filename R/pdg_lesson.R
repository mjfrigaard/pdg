#' Install lesson materials
#'
#' `use_lesson()` will install the materials for a given learning lesson. Then,
#' it will open a new RStudio Project containing the files you'll need for that
#' lesson.
#'
#' @param lesson The name of the lesson
#' @param destdir The path on your computer where you would like the learning
#'   materials installed. If `NULL`, defaults to your Desktop or some other
#'   conspicuous place.
#'
#' @importFrom utils install.packages packageVersion
use_lesson <- function(lesson, destdir = NULL) {
  check_pak()
  # check_deps(lesson)
  usethis::use_course(
    as_zip(lesson),
    destdir = destdir
  )
}

as_zip <- function(lesson) {
  glue::glue("pdg/inst/lesson/{lesson}.zip")
}

check_pak <- function() {
  if (!rlang::is_installed("pak") && packageVersion("pak") >= "0.1.2.9001") {
    install_it <- usethis::ui_yeah(
      "{usethis::ui_code('pak 0.1.2.9001')} or greater is required to \\
       install packages for this lesson. Install it now?"
    )
    if (!install_it) usethis::ui_stop("pak 0.1.2.9001 or greater is required.")

    install.packages("pak", repos = "https://r-lib.github.io/p/pak/dev/")
  }

  invisible(NULL)
}

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
