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
