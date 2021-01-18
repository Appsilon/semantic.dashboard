context("value_box")

test_that("basic value_box inputs", {
  # expects value
  expect_error(value_box())
  # simple input
  si_str <- as.character(
    value_box("Title", "val")
  )
  expect_true(any(grepl("ui statistic",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("<div class=\"label\">Title</div>",
                        si_str, fixed = TRUE)))
  # check extra parameters
  si_str <- as.character(
    value_box("Title", "val", icon = icon("dog"))
  )
  expect_true(any(grepl("<i class=\"dog icon\"></i>",
                        si_str, fixed = TRUE)))
  si_str <- as.character(
    value_box("Title", "val", color = "blue")
  )
  expect_true(any(grepl("ui fluid card blue",
                        si_str, fixed = TRUE)))
  si_str <- as.character(
    value_box("Title", "val", width = 6)
  )
  expect_true(any(grepl("six wide column",
                        si_str, fixed = TRUE)))
})


test_that("equivalence of infoBox and valueBox", {
  si_str1 <- as.character(
    value_box("Title", "val", color = "blue")
  )
  si_str2 <- as.character(
    infoBox("Title", "val", color = "blue")
  )
  si_str3 <- as.character(
    valueBox("Title", "val", color = "blue")
  )
  expect_equal(si_str1, si_str2)
  expect_equal(si_str3, si_str2)
  expect_equal(si_str1, si_str3)
})

test_that("value_box_output", {
  # expects some input
  expect_error(value_box_output())
  # simple input
  si_str <- as.character(
    value_box_output("oid")
  )
  expect_true(any(grepl("<div id=\"oid\" class=\"shiny-html-output\"></div>",
                        si_str, fixed = TRUE)))
  si_str <- as.character(
    value_box_output("oid", width = 6)
  )
  expect_true(any(grepl("six wide column",
                        si_str, fixed = TRUE)))
})

test_that("equivalence of valueBoxOutput and infoBoxOutput", {
  si_str1 <- as.character(
    value_box_output("id1")
  )
  si_str2 <- as.character(
    valueBoxOutput("id1")
  )
  si_str3 <- as.character(
    infoBoxOutput("id1")
  )
  expect_equal(si_str1, si_str2)
  expect_equal(si_str3, si_str2)
  expect_equal(si_str1, si_str3)
})

