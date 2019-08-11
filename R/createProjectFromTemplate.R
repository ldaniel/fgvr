#' Create a new R project from template
#'
#' This function creates an initial R project setup focused in data science.
#' @author Leandro Daniel
#' @import downloader
#' @param name The name of you R project (it will be created a directory using this name).
#' @return An object list with handy information about the project, like path and initial setup.
#' @keywords project, data-science, setup 
#' @export
#' @examples
#' createProject("Predictive-Analytics")
createProjectFromTemplate <- function(name, 
                                      directorypath = NULL) {
  
  # checking missing parameters and setting default values
  if(missing(name)) {
    name = "myproject"
  }
  
  if(missing(directorypath)) {
    directorypath = getwd()
  }
  
  name <- "test"
  directorypath <- "d:/Temp"
  
  currentDirectoryPath <- directorypath
  parentDirectoryPath  <- dirname(currentDirectoryPath)
  targetDirectoryPath  <- paste(parentDirectoryPath, name, sep = "")
  templateName         <- "projecttemplate.zip"
  zipFilePath          <- paste(currentDirectoryPath, templateName, sep = "/")
  
  if (!dir.exists(targetDirectoryPath)) {
    
    dir.create(targetDirectoryPath)
    
    downloader::download("https://github.com/ldaniel/fgvr/blob/master/assets/projecttemplate.zip", 
                         dest = zipFilePath,
                         mode = "wb") 
    
    unzip(zipfile = zipFilePath, exdir = targetDirectoryPath)
    
    projectDataDirectory          <- paste(targetDirectoryPath,  "data", sep = "/")
    projectDataRawDirectory       <- paste(projectDataDirectory, "raw", sep = "/")
    projectDataProcessedDirectory <- paste(projectDataDirectory, "processed", sep = "/")
    projectImagesDirectory        <- paste(targetDirectoryPath,  "images", sep = "/")
    projectMarkdownDirectory      <- paste(targetDirectoryPath,  "markdown", sep = "/")
    projectModelsDirectory        <- paste(targetDirectoryPath,  "models", sep = "/")
    projectScriptsDirectory       <- paste(targetDirectoryPath,  "scripts", sep = "/")
  } else {
    print(paste0("The directory already exists: ", targetDirectoryPath))
  }
  
  # creating the list with train, test and proportion results
  project <- list()
  project$path                <- currentDirectoryPath
  project$data.path           <- projectDataDirectory
  project$data.raw.path       <- projectDataRawDirectory
  project$data.processed.path <- projectDataProcessedDirectory
  project$images.path         <- projectImagesDirectory
  project$markdown.path       <- projectMarkdownDirectory
  project$models.path         <- projectModelsDirectory
  project$scripts.path        <- projectScriptsDirectory
  
  return(project)
}