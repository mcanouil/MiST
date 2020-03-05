devtools::check()
devtools::check_win_devel()
cran <- rhub::check_for_cran()
mac <- rhub::check_on_macos()
sol <- rhub::check_on_solaris()

# rm CRAN-RELEASE
use_github_release(host = NULL, auth_token = github_token())
# git tag v1.0.0
# usethis::use_dev_version()
