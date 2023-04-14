as_zip <- function(lesson) {
  glue::glue("https://github.com/mjfrigaard/pdg/raw/main/inst/lessons/{lesson}.zip")
}

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
  # check_pak()
  # check_deps(lesson)
  usethis::use_course(
    url = as_zip(lesson),
    destdir = destdir
  )
}



