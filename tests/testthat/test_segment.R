library(ransj)
context("segment")

test_that("Test segment", {
  expect_equal(segment("You are beautiful!"), "you are beautiful")
})
