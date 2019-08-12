#' Create test and train samples 
#'
#' This function creates train and test datasets given a database and the Y variable.
#' @author Rodrigo Gonçalves and Leandro Daniel
#' @import dplyr
#' @importFrom caret createDataPartition
#' @param dataset The dataset you want to split into test and train samples.
#' @param yvar The Y variable in your dataset.
#' @param seed The seed number used to generate the train and test samples.
#'        The default value is 12345.
#' @param percentage The percentage of data that goes to training sample.
#'        The default value is 0.7.
#' @return An object list with the train dataset, test dataset and the proportions.
#' @keywords dataset
#' @export
#' @examples
#' base = loansdefaulters
#' mydataset <- createTestAndTrainSamples(dataset = base, 
#'                                        yvar = "y_loan_defaulter", 
#'                                        seed = 12345, 
#'                                        percentage = 0.7)
#' # or
#' mydataset <- createTestAndTrainSamples(dataset = base, yvar = "y_loan_defaulter")
#' # to use the final samples and to see the proportion
#' mydataset$data.train
#' mydataset$data.test
#' mydataset$event.proportion
createTestAndTrainSamples <- function(dataset, 
                                      yvar, 
                                      seed = 12345,
                                      percentage = 0.7) {
  
  # checking missing parameters and setting default values
  if(missing(seed)) {
    seed = 12345
  }  
  
  if(missing(percentage)) {
    percentage = 0.7
  } 
  
  dataset[[yvar]] <- as.integer(dataset[[yvar]])
  
  # performing train and test creation with the given dataset
  set.seed(seed) # keeping always the same samples
  index <- caret::createDataPartition(dataset[[yvar]], p = percentage, list = FALSE)
  data.train <- dataset[index, ]
  data.test  <- dataset[-index,]
  
  # checking event proportion in sample and test datasets against full dataset
  event_proportion <- list()
  event_proportion <- bind_rows(prop.table(table(dataset[[yvar]])),
                                prop.table(table(data.train[[yvar]])),
                                prop.table(table(data.test[[yvar]])))
  
  event_proportion$scope = ''
  event_proportion$scope[1] = 'full dataset'
  event_proportion$scope[2] = 'train dataset'
  event_proportion$scope[3] = 'test dataset'
  
  event_proportion <- select(event_proportion, scope, everything())
  
  # creating the list with train, test and proportion results
  split_dataset <- list()
  split_dataset$data.train <- data.train
  split_dataset$data.test  <- data.test
  split_dataset$event.proportion <- event_proportion
  
  return(split_dataset)
}