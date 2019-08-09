# fgvr <img src='man/figures/logo.png' align="right" height="139" />
R package to power-up data science analysis based on learned techniques in the FGV MBA course.

> Don't panic!
> --Douglas Adams on "The Hitchhiker's Guide to the Galaxy" book

The premise of this package is gathering a set of R functions that helps FGV MBA's students performing repetitive activities during the following steps: Data Cleaning, Data Enhancements, Data Preparation... and more!

All the functions and resources available in this package came from the **Business Analytics and Big Data** classes, where the following Professors shedded some light into our minds. 

- Gustavo Mirapalheta
- João Rafael Dias

Thanks you all for that!

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
base <- (your code to load any desired database to a dataframe object)

# example calling the function by passing all parameters:
#   dataset    = the dataset you want to split into test and train samples.
#   yvar       = the Y variable in your dataset.
#   seed       = the seed number used to generate the train and test samples.
#                the default value is 12345.
#   percentage = the percentage of data that goes to training sample.
#                the default value is 0.7.
mydataset <- fgvr::createTestAndTrainSamples(dataset = base, yvar = "Name_of_your_Y_var", 
                                             seed = 12345, percentage = 0.7)

# or omitting 'seed' and 'percentage' parameters, then the default values will be used.
mydataset <- fgvr::createTestAndTrainSamples(dataset = base, yvar = "Name_of_your_Y_var")

# getting the final samples and proportion.
mydataset$data.train
mydataset$data.test
mydataset$event.proportion
```

