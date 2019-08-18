context("create project from template")
library(fgvr)

test_that("function returns a list object containing all the directories path", {
  
  projectname <- Sys.getenv("project_name")
  projectpath <- Sys.getenv("project_path")
  myproject <- fgvr::createProjectFromTemplate(projectname, projectpath)
  
  expect_equal(length(myproject), 8)
  expect_equal(myproject$path, paste(projectpath, projectname, sep = "/"))
  expect_equal(myproject$data.path, paste(projectpath, projectname, "data", sep = "/"))
  expect_equal(myproject$data.raw.path, paste(projectpath, projectname, "data/raw", sep = "/"))
  expect_equal(myproject$data.processed.path, paste(projectpath, projectname, "data/processed", sep = "/"))
  expect_equal(myproject$images.path, paste(projectpath, projectname, "images", sep = "/"))
  expect_equal(myproject$markdown.path, paste(projectpath, projectname, "markdown", sep = "/"))
  expect_equal(myproject$models.path, paste(projectpath, projectname, "models", sep = "/"))
  expect_equal(myproject$src.path, paste(projectpath, projectname, "src", sep = "/"))
  
  # delete project created
  unlink(paste(projectpath, projectname, sep = "/"), recursive = TRUE)
})