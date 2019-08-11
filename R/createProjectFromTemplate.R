#' Create a new R project from template
#'
#' This function creates an initial R project setup focused in data science.
#' @author Leandro Daniel
#' @import downloader
#' @param name The name of you R project (it will be created a directory using this name).
#' @param directorypath The directory path in which the project will be created.
#' @return An object list with handy information about the project, like path and initial setup.
#' @keywords project, data-science, setup 
#' @export
#' @examples
#' createProjectFromTemplate("Predictive-Analytics", "c:/temp")
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
  projectTemplateURL   <- "https://github.com/ldaniel/fgvr/blob/master/assets/projecttemplate.zip?raw=true"
  
  if (!dir.exists(targetDirectoryPath)) {
    
    # create target directory path
    dir.create(targetDirectoryPath)
    
    # download project template zip file from fgvr Githug repository
    downloader::download(projectTemplateURL, dest = zipFilePath, mode = "wb") 
    
    # unzip file to the target directory path
    unzip(zipfile = zipFilePath, exdir = targetDirectoryPath)
    
    # remove project template zip file
    unlink(zipFilePath)
    
    projectDataDirectory          <- paste(targetDirectoryPath,  "data", sep = "/")
    projectDataRawDirectory       <- paste(projectDataDirectory, "raw", sep = "/")
    projectDataProcessedDirectory <- paste(projectDataDirectory, "processed", sep = "/")
    projectImagesDirectory        <- paste(targetDirectoryPath,  "images", sep = "/")
    projectMarkdownDirectory      <- paste(targetDirectoryPath,  "markdown", sep = "/")
    projectModelsDirectory        <- paste(targetDirectoryPath,  "models", sep = "/")
    projectScriptsDirectory       <- paste(targetDirectoryPath,  "scripts", sep = "/")
    
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
  } else {
    print(paste0("The directory already exists and the project will not be created: ", 
                 targetDirectoryPath))
    project <- NULL
  }
  
  return(project)
}