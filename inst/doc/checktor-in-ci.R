## -----------------------------------------------------------------------------
#| label: setup
#| include: false
library(checktor)


## -----------------------------------------------------------------------------
#| label: scenario
# A throwaway package that deliberately uses T/F instead of TRUE/FALSE
bad_pkg <- example_diagnose_scenario("code_examples/tf_usage_bad.R",
                                     show_content = FALSE)

checkup(bad_pkg)

