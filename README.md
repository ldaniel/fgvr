# fgvr
R package to power-up FGVs analysis based on learned techniques in the MBA course.

> Don't panic!
> --Douglas Adams on "The Hitchhiker's Guide to the Galaxy" book

The premise of fgvr package is to c in the `man/` directory.  Here's a simple example from the `stringr` package:
The premise of this package is gathering a set of R functions that helps FGV MBA students performing repetitive activities during the following steps:

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

* `roxygen2::roxygenise()` just sources all files in the `R/` directory

* `devtools::document()` sources all files in the `R/` directory, compiles
  source code in the `src/` directory, loads data in the `data/` directory
  and generally does an accurate job of simulating package loading.
