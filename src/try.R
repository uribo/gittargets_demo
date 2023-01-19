library(targets)
library(gittargets)
tar_git_snapshot()

tar_read(body_lm)

sha <-
  tar_git_log() |>
  dplyr::slice(2L) |>
  dplyr::pull(commit_code)

tar_git_checkout(ref = sha)

tar_read(body_lm)


# aaa ---------------------------------------------------------------------
# git commit
tar_git_snapshot()
tar_git_checkout()
