#' Create test and train samples
#'
#' This function creates train and test datasets given a database.
#' @param dataset The dataset you want to split into test and train samples.
#' @keywords dataset
#' @export
#' @examples
#' createTestAndTrainSamples(my_dataset, my_y_var)
#' 
createTestAndTrainSamples <- function(dataset = dataset, 
                                      yvar = y_column_name, 
                                      seed = seed_number,
                                      proportion = proportion_scale) {
  
  if(missing(seed)) {
    seed = 12345
  } 
  set.seed(seed)
  
  if(missing(proportion)) {
    proportion = 0.7
  } 
  
  dataset[[y_var]] <- as.integer(dataset[[y_var]])
  
  # performing train and test creation with the give dataset
  index <- caret::createDataPartition(dataset[[y_var]], p = proportion, list = FALSE)
  data.train <- dataset[index, ]
  data.test  <- dataset[-index,]
  
  # checking event proportion in sample and test datasets against full dataset
  event_proportion <- bind_rows(prop.table(table(dataset[[y_var]])),
                                prop.table(table(data.train[[y_var]])),
                                prop.table(table(data.test[[y_var]])))
  
  event_proportion$scope = ''
  event_proportion$scope[1] = 'full dataset'
  event_proportion$scope[2] = 'train dataset'
  event_proportion$scope[3] = 'test dataset'
  
  event_proportion <- select(event_proportion, scope, everything())
  
  split_dataset <- list()
  split_dataset$data.train <- data.train
  split_dataset$data.test  <- data.test
  split_dataset$event.proportion <- event_proportion
  
  return(split_dataset)
}
