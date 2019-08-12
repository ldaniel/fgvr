#' Create a new R project from template
#'
#' This function creates an initial R project setup focused in data science.
#' @author Leandro Daniel
#' @import downloader
#' @importFrom stringr str_replace
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
  
  # set variables
  currentDirectoryPath <- directorypath
  parentDirectoryPath  <- dirname(currentDirectoryPath)
  targetDirectoryPath  <- paste(parentDirectoryPath, name, sep = "")
  templateName         <- "projecttemplate.zip"
  zipFilePath          <- paste(currentDirectoryPath, templateName, sep = "/")
  projectTemplateURL   <- "https://github.com/ldaniel/fgvr/blob/master/assets/projecttemplate.zip?raw=true"
  
  # checking if directory already exists
  if (!dir.exists(targetDirectoryPath)) {
    
    # create target directory path
    dir.create(targetDirectoryPath)
    
    # download project template zip file from fgvr Github repository
    downloader::download(projectTemplateURL, dest = zipFilePath, mode = "wb") 
    
    # unzip file to the target directory path
    unzip(zipfile = zipFilePath, exdir = targetDirectoryPath)
    
    # remove project template zip file
    unlink(zipFilePath)
    
    # list all files created and replace "__myproject__" with the project name
    fileslist <- list.files(targetDirectoryPath, recursive = TRUE)
    for(file in fileslist){
      fullFilePath <- paste(targetDirectoryPath, file, sep = "/")
      fileContent    <- readLines(fullFilePath)
      fileNewContent <- gsub(pattern = "__myproject__", replace = name, x = fileContent)
      writeLines(fileNewContent, con = fullFilePath)
      print(paste0("Replacing '__myproject__' text with project name in the file: ", file))
      
      if(stringr::str_detect(file, "__myproject__")) {
        file.rename(fullFilePath, stringr::str_replace(fullFilePath, "__myproject__", name))
        print(paste0("Renaming file name from '__myproject__' to project name: ", file))
      }
    }
    
    # creating the result list with project information
    project <- list()
    project$path                <- currentDirectoryPath
    project$data.path           <- paste(targetDirectoryPath,  "data", sep = "/")
    project$data.raw.path       <- paste(projectDataDirectory, "raw", sep = "/")
    project$data.processed.path <- paste(projectDataDirectory, "processed", sep = "/")
    project$images.path         <- paste(targetDirectoryPath,  "images", sep = "/")
    project$markdown.path       <- paste(targetDirectoryPath,  "markdown", sep = "/")
    project$models.path         <- paste(targetDirectoryPath,  "models", sep = "/")
    project$scripts.path        <- paste(targetDirectoryPath,  "scripts", sep = "/")
  } else {
    print(paste0("The directory already exists and the project will not be created: ", 
                 targetDirectoryPath))
    project <- NULL
  }
  
  return(project)
}