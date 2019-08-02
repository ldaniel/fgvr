# fgvr
R package to power-up FGVs analysis based on learned techniques in the MBA course.

> Don't panic!
> --Douglas Adams on "The Hitchhiker's Guide to the Galaxy" book

The premise of this package is gathering a set of R functions that helps FGV MBA's students performing repetitive activities during the following steps:

* Data Cleaning;
* Data Enhancements;
* Data Preparation;
* ... and more!

# Installation

To get the current development version from github:

```R
# install.packages("devtools")
devtools::install_github("ldaniel/fgvr")
```

# Running

The fgvr package has a set of handy functions.

## createTestAndTrainSamples

This function creates train and test datasets given a database and the Y variable. In addition, this function also returns the sample proportion for each dataset.

```R
base <- (your code to run any desired database to a dataframe object)

# example calling the function by passing all parameters:
#   dataset    = the dataset you want to split into test and train samples.
#   yvar       = the Y variable in your dataset.
#   seed       = the seed number used to generate the train and test samples.
#                the default value is 12345.
#   percentage = the percentage of data that goes to training sample.
#                the default value is 0.7.
mydataset <- fgvr::createTestAndTrainSamples(dataset = base, yvar = "Name_of_your_Y_var", 
                                             seed = 12345, percentage = 0.7)

# or ommiting 'seed' and 'percentage' parameters, then the default values will be used
mydataset <- fgvr::createTestAndTrainSamples(dataset = base, yvar = "Name_of_your_Y_var")

# to use the final samples and to see the proportion
mydataset$data.train
mydataset$data.test
mydataset$event.proportion
```

