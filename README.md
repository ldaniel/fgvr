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

The fgvr package has a set of handy functions:

* `fgvr::createTestAndTrainSamples()` This function creates train and test datasets given a database and the Y variable. In addition, this function also returns the sample proportion for each dataset.
