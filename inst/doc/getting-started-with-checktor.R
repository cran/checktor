## -----------------------------------------------------------------------------
#| label: setup
#| include: false
library(checktor)


## ----eval=FALSE---------------------------------------------------------------
# install.packages("checktor")


## ----eval=FALSE---------------------------------------------------------------
# # install.packages("pak")
# pak::pak("coatless-rpkg/checktor")


## -----------------------------------------------------------------------------
library(checktor)


## -----------------------------------------------------------------------------
pkg <- example_diagnose_scenario("code_examples/tf_usage_bad.R",
                                 show_content = FALSE)


## -----------------------------------------------------------------------------
#| label: show-bad-file
#| echo: false
#| results: asis
src <- readLines(file.path(pkg, "R", "tf_usage_bad.R"))
cat("```r\n", paste(src, collapse = "\n"), "\n```\n", sep = "")


## -----------------------------------------------------------------------------
# verbose and progress are off here, which keeps the printout compact
results <- checktor(pkg, verbose = FALSE, progress = FALSE)
results


## -----------------------------------------------------------------------------
summary(results)   # one row per category


## -----------------------------------------------------------------------------
issues(results)    # one row per issue, with file and line


## -----------------------------------------------------------------------------
is_healthy(results)
n_issues(results)
failed_checks(results)


## -----------------------------------------------------------------------------
checkup(pkg)


## -----------------------------------------------------------------------------
prescribe(results)


## ----eval=FALSE---------------------------------------------------------------
# health_report(results, file = "package-health.md")
# health_report(results, file = "package-health.html", format = "html")


## ----eval=FALSE---------------------------------------------------------------
# diagnose_code_issues()           # just the R sources
# diagnose_description_issues()    # just DESCRIPTION
# diagnose_documentation_issues()  # help pages, examples, vignettes, demos
# diagnose_general_issues()        # size, URLs, NEWS, README links
# diagnose_policy_violations()     # CRAN policy


## ----eval=FALSE---------------------------------------------------------------
# configure_doctor(verbose_default = FALSE, progress_default = FALSE)
# 
# # or per call
# results <- checktor(verbose = FALSE, progress = FALSE)


## -----------------------------------------------------------------------------
results$metadata$on_request_checks


## -----------------------------------------------------------------------------
lab_cran_comments_file(pkg, verbose = FALSE)


## ----eval=FALSE---------------------------------------------------------------
# options(checktor.disable = "news_file")


## ----eval=FALSE---------------------------------------------------------------
# devtools::document()
# devtools::test()
# 
# results <- checktor()  # the extra-CRAN checkup
# prescribe(results)     # read the remedies
# 
# devtools::check()      # the standard checks

