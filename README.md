# fgvr <img src='man/figures/logo.png' align="right" height="139" />
R package to power-up data science analysis based on learned techniques in the FGV MBA course.

> Don't panic!
> --Douglas Adams on "The Hitchhiker's Guide to the Galaxy" book

The premise of this package is gathering a set of R functions that helps FGV MBA's students performing repetitive activities during the following steps: **Data Cleaning**, **Data Enhancements**, **Data Preparation**... and more!

All functions and resources available in this package was inspired on the **Business Analytics and Big Data** classes, where the following Professors shed some light into our minds: 

- Gustavo Mirapalheta (Exploratory Data Analysis)
- João Rafael Dias (Predictive Analytics)

Thank you all for that! :smile:

# Installation

To get the current development version from github:

```R
# install.packages("devtools")
devtools::install_github("ldaniel/fgvr")
```

# Running

The fgvr package has a set of handy functions.

## createProjectFromTemplate

This function creates an initial R project setup focused in data science.

```R
fgvr::createProjectFromTemplate("Predictive-Analytics", "c:/temp")
```
The following structure will be created:
```
[Project root directory]
|   README.md
|   __myproject__.Rproj
|
+---data
|   +---processed
|   |       readme.txt
|   |
|   \---raw
|           readme.txt
|
+---images
|       readme.txt
|
+---markdown
|       01_about_the_data.Rmd
|       02_data_preparation.Rmd
|       03_exploration_report.Rmd
|       conclusion.Rmd
|       index.Rmd
|       references.Rmd
|       _pdf.Rmd
|       _site.yml
|
+---models
|       readme.txt
|
\---src
    +---datapreparation
    |       step_00_config_environment.R
    |       step_01_create_functions.R
    |       step_02_data_ingestion.R
    |       step_03_data_cleaning.R
    |       step_04_label_translation.R
    |       step_05_data_enhancement.R
    |       step_06_dataset_preparation.R
    |
    +---playground
    |       playground.R
    |
    \---util
            generate_markdown_website.R
```

## createTestAndTrainSamples

This function creates train and test datasets given a database and the Y variable. In addition, this function also returns the sample proportion for each dataset.

```R
# using, just as an example, the sample dataset loansdefaulters, also included in the package 
base <- fgvr::loansdefaulters

# example calling the function by passing all parameters:
#   dataset    = the dataset you want to split into test and train samples.
#   yvar       = the Y variable in your dataset.
#   seed       = the seed number used to generate the train and test samples.
#                the default value is 12345.
#   percentage = the percentage of data that goes to training sample.
#                the default value is 0.7.
mydataset <- fgvr::createTestAndTrainSamples(dataset = base, yvar = "y_loan_defaulter", 
                                             seed = 12345, percentage = 0.7)

# or omitting 'seed' and 'percentage' parameters, then the default values will be used.
mydataset <- fgvr::createTestAndTrainSamples(dataset = base, yvar = "y_loan_defaulter")

# getting the final samples and proportion.
mydataset$data.train
mydataset$data.test
mydataset$event.proportion
```

