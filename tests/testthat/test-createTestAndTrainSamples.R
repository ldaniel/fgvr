context("create test and train samples")
library(fgvr)

test_that("function returns 3 list items in the returned list", {
  mydataset <- fgvr::createTestAndTrainSamples(fgvr::loansdefaulters, "y_loan_defaulter", 12345, 0.7)
  
  expect_equal(length(mydataset), 3)
  expect_equal(typeof(mydataset$data.train), "list")
  expect_equal(typeof(mydataset$data.test), "list")
  expect_equal(typeof(mydataset$event.proportion), "list")
})