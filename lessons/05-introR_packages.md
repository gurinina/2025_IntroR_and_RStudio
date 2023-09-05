# Packages and libraries

## Packages and Libraries

**Packages** are collections of R functions, data, and compiled code in a well-defined format, created to add specific functionality. 

There are a set of **standard (or base) packages** which are considered part of the R source code and automatically available as part of your R installation. Base packages contain the **basic functions** that allow R to work, and enable standard statistical and graphical functions on datasets; for example, all of the functions that we have been using so far in our examples. 

The terms *package* and *library* are sometimes used synonymously. 

You can check what libraries are loaded in your current R session by typing into the console:

```r
sessionInfo() #Print version information about R, the OS and attached or loaded packages

# OR

search() #Gives a list of attached packages
```

As you work with R, you'll see that there are thousands of R packages that offer a wide variety of functionality. Many packages can be installed from the [CRAN](http://cran.r-project.org/) or [Bioconductor](https://www.bioconductor.org/) repositories.

### Package installation from CRAN 

CRAN is a repository where the latest downloads of R are found in addition to source code for different user contributed R packages.

<img src="img/cran_packages.png" width="600">

Packages for R can be installed from the [CRAN](http://cran.r-project.org/) package repository using the `install.packages` function.

An example is given below for the `ggplot2` package that will be required for some plots we will create later on. Run this code to install `ggplot2`.

```r
install.packages("ggplot2")
```

### Package installation from Bioconductor
Alternatively, packages can also be installed from [Bioconductor](https://www.bioconductor.org/), another repository of packages which provides tools for the analysis and comprehension of high-throughput **genomic data**.

<img src="img/bioconductor_logo.png" width="300">

You should already have installed Bioconductor, by installing BiocManager. *This only needs to be done once ever for your R installation.* 

```r
# DO NOT RUN THIS!

install.packages("BiocManager")
```

Now you can use the `install()` function from the `BiocManager` package to install a package by providing the name in quotations. 

Here we have the code to install `ggplot2`, through Bioconductor:

```r
# DO NOT RUN THIS!

BiocManager::install("ggplot2")
```

> The code above may not be familiar to you - it is essentially using a new operator, a double colon `::` to execute a function from a particular package. This is the syntax: `package::function_name()`. It's used to avoid conflicts in functions from different packages.


### Loading libraries
Once you have the package installed, you can **load the library** into your R session for use. Any of the functions that are specific to that package will be available for you to use by simply calling the function as you would for any of the base functions. *Note that quotations are not required here.*


```r
library(ggplot2)
```

We only need to install a package once on our computer. However, to use the package, we need to load the library every time we start a new R/RStudio environment. 

<img src="img/install_vs_library.jpeg" width="600">

### Finding functions specific to a package

This is your first time using `ggplot2`, how do you know where to start and what functions are available to you? One way to do this, is by using the `Package` tab in RStudio. If you click on the tab, you will see listed all packages that you have installed. For those *libraries that you have loaded*, you will see a blue checkmark in the box next to it. Scroll down to `ggplot2` in your list:

<img src="img/ggplot_help.png" width="300">  


If your library is successfully loaded you will see the box checked, as in the screenshot above. Now, if you click on `ggplot2` RStudio will open up the help pages and you can scroll through. 

**Other resources**

An alternative is to find the help manual online, which can be less technical and sometimes easier to follow. For example, [this website](https://ggplot2.tidyverse.org/reference/index.html) is much more comprehensive for ggplot2 and is the result of a Google search. 

If you can't find what you are looking for, you can use the [rdrr.io](https://rdrr.io/) website that searches through the help files across all packages available. It also provides source code for functions. 

To see the functions in a package you can also type:

```r
ls("package:ggplot2")
```

***

**Exercise**

The `ggplot2` package is part of the [`tidyverse` suite of integrated packages](https://www.tidyverse.org/packages/) which was designed to work together to make common data science operations more user-friendly. **We will be using the `tidyverse` suite in later lessons, and so let's install it using BiocManager**.

