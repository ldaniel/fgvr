#' Create Project
#'
#' This function creates an initial R project setup focused in data science.
#' @author Leandro Daniel
#' @import dplyr
#' @importFrom caret createDataPartition
#' @param name The name of you R project (it will be created a directory using this name).
#' @return An object list with handy information about the project, like path and initial setup.
#' @keywords project, data-science, setup 
#' @export
#' @examples
#' createProject("Predictive-Analytics")
createProject <- function(name) {
  
  # checking missing parameters and setting default values
  if(missing(name)) {
    name = "myproject"
  }
  
  currentDirectoryPath <- getwd()
  parentDirectoryPath  <- dirname(currentDirectoryPath)
  targetDirectoryPath <- paste(parentDirectoryPath, name, sep = "/")
  
  # creating the list with train, test and proportion results
  project <- list()
  project$path          <- currentDirectoryPath
  project$data.path     <- ""
  project$images.path   <- ""
  project$markdown.path <- ""
  project$models.path   <- ""
  project$scripts.path  <- ""
  
  return(project)
}