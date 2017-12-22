library(shinydashboard)
library(shiny.semantic)
library(tidyverse)
library(knitr)
library(kableExtra)

common_functions <- intersect(ls("package:shinydashboard"), ls("package:semantic.dashboard"))
common_functions %>% map(~ {
  shiny <- names(formals(get(.x, envir = as.environment("package:shinydashboard"))))
  semantic <- names(formals(get(.x, envir = as.environment("package:semantic.dashboard"))))
  common <- intersect(shiny, semantic)
  only_shiny <- setdiff(shiny, semantic)
  only_semantic <- setdiff(semantic, shiny)
  tibble(fun = .x,
         common = paste(common, collapse = ", "),
         only_shiny = paste(only_shiny, collapse = ", "),
         only_semantic = paste(only_semantic, collapse = ", "))
}) %>% do.call(rbind, .) -> arg_compare

kable(arg_compare, "html") %>%
  kable_styling(full_width = F) %>%
  column_spec(1, bold = T, border_right = T) %>%
  column_spec(2, width = "30em") %>%
  column_spec(3, width = "30em") %>%
  column_spec(4, width = "30em") %>%
  row_spec(which(arg_compare[,4]!=""), bold = T, color = "white", background = "#D7261E") %>%
  row_spec(which(arg_compare[,4]==""), bold = T, color = "white", background = "#D7261E")
