context("create project from template")
library(fgvr)

test_that("function returns a list object containing all the directories path", {
  
  projectname <- "myteste"
  projectpath <- "d:/Temp"
  myproject <- fgvr::createProjectFromTemplate(projectname, projectpath)
  
  expect_equal(length(myproject), 8)
  # expect_equal(myproject$path, projectpath)
  # expect_equal(myproject$data.path, paste(projectpath,"data", sep = "/"))
  # expect_equal(myproject$data.raw.path, paste(projectpath, "data/raw", sep = "/"))
  # expect_equal(myproject$data.processed.path, paste(projectpath, "data/processed", sep = "/"))
  # expect_equal(myproject$images.path, paste(projectpath, "images", sep = "/"))
  # expect_equal(myproject$markdown.path, paste(projectpath, "markdown", sep = "/"))
  # expect_equal(myproject$models.path, paste(projectpath, "models", sep = "/"))
  # expect_equal(myproject$scripts.path, paste(projectpath, "scripts", sep = "/"))
  
  unlink(paste(projectpath, projectname, sep = "/"))
  
  if(dir.exists(paste(projectpath, projectname, sep = "/")))
  {
    do.call(file.remove, list(list.files(paste(projectpath, projectname, sep = "/"), full.names = TRUE)))
  }
})