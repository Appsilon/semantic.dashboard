context("dropdown_menu")

test_that("test message_item", {
  # expects some input
  expect_error(message_item())
  # test simple input
  si_str <- as.character(
    message_item("MMM", "Another test!", icon = "warning")
  )
  expect_true(any(grepl("<span class=\"description\">Another test!</span>",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("MMM",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("<i class=\"warning icon\"></i>",
                        si_str, fixed = TRUE)))
})

test_that("test equivalence messageItem", {
  ui_str1 <- as.character(
    message_item("MMM", "Another test!", icon = "warning")
  )
  ui_str2 <- as.character(
    messageItem("MMM", "Another test!", icon = "warning")
  )
  expect_identical(ui_str1, ui_str2)
})

test_that("test task_item", {
  # expects some input
  expect_error(task_item())
  # test simple input
  si_str <- as.character(
    task_item("Project progress...", 51, color = "red")
  )
  expect_true(any(grepl("class=\"ui active progress red\" data-percent=\"51\" data-total=\"100\"",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("<div class=\"label\">Project progress...</div>",
                        si_str, fixed = TRUE)))
})

test_that("test equivalence taskItem", {
  ui_str1 <- as.character(
    task_item("Project progress...", 51, color = "red")
  )
  ui_str2 <- as.character(
    taskItem("Project progress...", 51, color = "red")
  )
  expect_identical(ui_str1, ui_str2)
})


test_that("test notification_item", {
  # expects some input
  expect_error(notification_item())
  # test simple input
  si_str <- as.character(
    notification_item("This is notification!", color = "red")
  )
  expect_true(any(grepl("ui label red",
                        si_str, fixed = TRUE)))
  expect_true(any(grepl("This is notification!",
                        si_str, fixed = TRUE)))
})

test_that("test equivalence notificationItem", {
  ui_str1 <- as.character(
    notification_item("This is notification!", color = "blue")
  )
  ui_str2 <- as.character(
    notificationItem("This is notification!", color = "blue")
  )
  expect_identical(ui_str1, ui_str2)
})
