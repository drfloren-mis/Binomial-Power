list.of.packages <- c("shiny")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, dependencies=TRUE)
shiny::runGitHub("Binomial-Power", username="drfloren-mis", launch.browser=TRUE)