# fgvr <img src='man/figures/logo.png' align="right" height="139" />
R package to power-up data science analysis based on learned techniques in the FGV MBA course.

> Don't panic!
> --Douglas Adams on "The Hitchhiker's Guide to the Galaxy" book

The premise of this package is gathering a set of R functions that helps FGV MBA's students performing repetitive activities during the following steps: **Data Cleaning**, **Data Enhancements**, **Data Preparation**... and more!

All functions and resources available in this package was inspired on the **Business Analytics and Big Data** classes, where the following Professors shed some light into our minds: 

|Name (Discipline)|Assignment Repository|
|---|---|
|**Gustavo Mirapalheta**</br>(Exploratory Data Analysis)|:octocat: [https://github.com/ldaniel/Exploratory-Data-Analysis]|
|**João Rafael Dias**</br>(Predictive Analytics)|:octocat: [https://github.com/ldaniel/Predictive-Analytics]|
|**Eduardo Francisco**</br>(Spatial statistics)|:octocat: [https://github.com/ldaniel/Spatial-Statistics]|
|**Rafael Scopel**</br>(Time Series Analysis)|:octocat: [https://github.com/ldaniel/Time-Series-Analysis]|
|**Rodrigo Togneri**</br>(Matrix Methods and Cluster Analysis)|:octocat: [https://github.com/ldaniel/Matrix-Methods-Cluster-Analysis]|

Thank you all for that! :smile:

# Contributors

Special thanks to these awesome contributors (@Daniel[https://github.com/DanielFCampos], @Rodrigo[https://github.com/RodriGonca] e @Ygor[https://github.com/ygorlima1]) who shared a lot of time and dedication to achieve such great work!

|Profile|Name|E-mail|
|---|---|---|
|<a href="https://github.com/DanielFCampos"><img src="https://avatars2.githubusercontent.com/u/31582602?s=460&v=4" title="DanielFCampos" width="80" height="80"></a>|Daniel Campos|[(daniel.ferraz.campos@gmail.com)](daniel.ferraz.campos@gmail.com)|
|<a href="https://github.com/ldaniel"><img src="https://avatars2.githubusercontent.com/u/205534?s=460&v=4" title="ldaniel" width="80" height="80"></a>|Leandro Daniel|[(contato@leandrodaniel.com)](contato@leandrodaniel.com)|
|<a href="https://github.com/RodriGonca"><img src="https://avatars2.githubusercontent.com/u/50252438?s=460&v=4" title="RodriGonca" width="80" height="80"></a>|Rodrigo Goncalves|[(rodrigo.goncalves@me.com)](rodrigo.goncalves@me.com)|
|<a href="https://github.com/ygorlima1"><img src="https://avatars2.githubusercontent.com/u/52429828?s=460&v=4" title="ygorlima1" width="80" height="80"></a>|Ygor Lima|[(ygor_redesocial@hotmail.com)](ygor_redesocial@hotmail.com)|

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
|   |       bigtable.feather
|   |       readme.txt
|   |
|   \---raw
|           game-of-thrones-deaths-data.txt
|           readme.txt
|
+---docs
|       readme.txt
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
|       source_train_test_dataset.rds
|
\---src
    +---datapreparation
    |       execute_data_preparation.R
    |       step_01_config_environment.R
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
            auxiliary_functions.R
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

