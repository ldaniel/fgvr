context("create project")
library(fgvr)

test_that("function returns a list object containing all the directories path", {
  
  createProject("test", "d:/Temp")
  
  ##fgvr::createProject("test", "d:/Temp")
  
  # expect_equal(length(mydataset), 3)
  # expect_equal(typeof(mydataset$data.train), "list")
  # expect_equal(typeof(mydataset$data.test), "list")
  # expect_equal(typeof(mydataset$event.proportion), "list")
})