## -----------------------------------------------------------------------------
#| label: setup
#| include: false
library(checktor)


## ----eval=FALSE---------------------------------------------------------------
# # install.packages("pak")
# pak::pak("coatless-rpkg/checktor")


## -----------------------------------------------------------------------------
pkg <- example_diagnose_scenario("code_examples/tf_usage_bad.R",
                                 show_content = FALSE)

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


## ----eval=FALSE---------------------------------------------------------------
# prescribe(results)


## ----eval=FALSE---------------------------------------------------------------
# health_report(results, file = "package-health.md")
# health_report(results, file = "package-health.html", format = "html")


## ----eval=FALSE---------------------------------------------------------------
# diagnose_code_issues()           # just the R sources
# diagnose_description_issues()    # just DESCRIPTION
# diagnose_documentation_issues()  # just the .Rd files
# diagnose_general_issues()        # size, URLs
# diagnose_policy_violations()     # CRAN policy


## ----eval=FALSE---------------------------------------------------------------
# configure_doctor(verbose_default = FALSE, progress_default = FALSE)
# 
# # or per call
# results <- checktor(verbose = FALSE, progress = FALSE)


## ----eval=FALSE---------------------------------------------------------------
# devtools::document()
# devtools::test()
# 
# results <- checktor()  # the extra-CRAN checkup
# prescribe(results)     # apply the remedies
# 
# devtools::check()      # the standard checks

