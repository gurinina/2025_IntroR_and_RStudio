# Reading and data inspection

## Learning Objectives

* Read existing data into R and use base R functions to inspect data structures

## Reading data into R

### The basics

Many functions exist to read data in, and the function in R you use will depend on the file format being read in. Below we have a table with some examples of functions that can be used for importing some common text data types (plain text).

| Data type               | Extension | Function          | Package            |
|:------------------------|:----------|:------------------|:-------------------|
| Comma separated values  | csv       | `read.csv()`      | utils (default)    |
|                         |           | `read_csv()`      | readr (tidyverse)  |
| Tab separated values    | tsv       | `read_tsv()`      | readr              |
| Other delimited formats | txt       | `read.table()`    | utils              |
|                         |           | `read_table()`    | readr     
|(tidyverse) excel      | xlsx   | `read_xlsx()`      | readxl              |


For example, if we have text file where the columns are separated by commas (comma-separated values or comma-delimited), you could use the function `read.csv`. However, if the data are separated by a different delimiter in a text file (e.g. ":", ";", " "), you could use the generic `read.table` function and specify the delimiter (`sep = " "`) as an argument in the function. 

### Metadata

When working with large datasets, you will very likely be working with "metadata" file which contains the information about each sample in your dataset.

<img src="img/metadata_view.png" width="400"> 

The metadata is very important information and we encourage you to think about creating a document with as much metadata you can record before you bring the data into R.

### The `read.csv()` function

Let's bring in the metadata file we downloaded earlier (`mouse_exp_design.csv` or `mouse_exp_design.txt`) using the `read.csv` function. 

First, check the arguments for the function using the `?` to ensure that you are entering all the information appropriately:

```r
?read.csv
```

<img src="img/read.table-help.png" width="450"> 

The next item on the documentation page is the function **Description**, which specifies that the output of this set of functions is going to be a **data frame** - "*Reads a file in table format and **creates a data frame from it**, with cases corresponding to lines and variables to fields in the file.*"

In usage, all of the arguments listed for `read.table()` are the default values for all of the family members unless otherwise specified for a given function. Let's take a look at 2 examples:

1. **The separator**  

* in the case of `read.table()` it is `sep = ""` (space or tab)

* whereas for `read.csv()` it is `sep = ","` (a comma).

2. **The `header`** - This argument refers to the column headers that may (`TRUE`) or may not (`FALSE`) exist **in the plain text file you are reading in**. 

* in the case of `read.table()` it is `header = FALSE` (by default, it assumes you do not have column names)

* whereas for `read.csv()` it is `header = TRUE` (by default, it assumes that all your columns have names listed). 

***The take-home from the "Usage" section for `read.csv()` is that it has one mandatory argument, the path to the file and filename in quotations; in our case that is `data/mouse_exp_design.csv`***

> #### The `stringsAsFactors` argument
> 
> Note that the `read.table {utils}` family of functions has an argument called `stringsAsFactors`, which if set to TRUE, will coerce `character` columns in the data you are reading in to `factor` columns (i.e. coerce from `vector` to `factor`) in the resulting data frame. We want to set this as `FALSE` to maintain `character` columns in metadata. 

***

### Create a data frame by reading in the file

Let's read in the `mouse_exp_design.csv` file and create a new data frame called `metadata`.

```r
metadata <- read.csv(file="data/mouse_exp_design.csv")

```

> **NOTE:** RStudio supports the automatic completion of code using the <kbd>Tab</kbd> key. This is especially helpful for when reading in files to ensure the correct file path. The tab completion feature also provides a shortcut to listing objects, and inline help for functions. **Tab completion is your friend!** We encourage you to use it whenever possible.

Earlier we noted that the file we just read in had column names (first row of values) and how `read.csv()` deals with "headers". In addition to column headers, `read.csv()` also assumes that the first column contains the row names. Not all functions in the `read.table()` family of functions will do this and depending on which one you use, you may have to specify an additional argument to properly assign the row names and column names.

***
**Exercise 1**

1. Read "project-summary.txt" in to R using `read.table()` with the approriate arguments and store it as the variable `proj_summary`. To figure out the appropriate arguments to use with `read.table()`, keep the following in mind:
	* all the columns in the input text file have column name/headers
	* you want the first column of the text file to be used as row names (hint: look up the input for the `row.names =` argument in `read.table()`)

2. Display the contents of `proj_summary` in your console

***

## Inspecting data structures

There are a wide selection of base functions in R that are useful for inspecting your data and summarizing it. Let's use the `metadata` file that we created to test out data inspection functions. 

Take a look at the dataframe by typing out the variable name `metadata` and pressing return; the variable contains information describing the samples in our study. Each row holds information for a single sample, and the columns contain categorical information about the sample `genotype`(WT or KO),  `celltype` (typeA or typeB), and `replicate number` (1,2, or 3).

```r
metadata

          genotype celltype replicate
sample1        Wt    typeA		1
sample2        Wt    typeA		2
sample3        Wt    typeA		3
sample4        KO    typeA		1
sample5        KO    typeA		2
sample6        KO    typeA		3
sample7        Wt    typeB		1
sample8        Wt    typeB		2
sample9        Wt    typeB		3
sample10       KO    typeB		1
sample11       KO    typeB		2
sample12       KO    typeB		3

```

Suppose we had a larger file, we might not want to display all the contents in the console. Instead we could check the top (the first 6 lines) of this `data.frame` using the function `head()`:

```r
head(metadata)
```

### List of functions for data inspection

We already saw how the functions `head()` and `str()` (in the releveling section) can be useful to check the content and the structure of a `data.frame`. Below is a non-exhaustive list of functions to get a sense of the content/structure of data. The list has been divided into functions that work on all types of objects, some that work only on vectors/factors (1 dimensional objects), and others that work on data frames and matrices (2 dimensional objects).

We have some exercises below that will allow you to gain more familiarity with these. You will definitely be using some of them in the next few homework sections.

All data structures - content display:
* **`str()`:** compact display of data contents (similar to what you see in the Global environment)
* **`class()`:** displays the data type for vectors (e.g. character, numeric, etc.) and data structure for dataframes, matrices, lists
* **`summary()`:** detailed display of the contents of a given object, including descriptive statistics, frequencies
* **`head()`:**  prints the first 6 entries (elements for 1-D objects, rows for 2-D objects)
* **`tail()`:** prints the last 6 entries (elements for 1-D objects, rows for 2-D objects)

Vector and factor variables: 
* **`length()`:** returns the number of elements in a vector or factor

Dataframe and matrix variables:
* **`dim()`:** returns dimensions of the dataset (number_of_rows, number_of_columns) [Note, row numbers will always be displayed before column numbers in R]
* **`nrow()`:** returns the number of rows in the dataset
* **`ncol()`:** returns the number of columns in the dataset
* **`rownames()`:** returns the row names in the dataset  
* **`colnames()`:** returns the column names in the dataset

***
**Exercise 2**

* Use the `class()` function on `glengths` and `metadata`, how does the output differ between the two?
* Use the `summary()` function on the `proj_summary` dataframe, what is the median "rRNA_rate"?
* How long is the `samplegroup` factor?
* What are the dimensions of the `proj_summary` dataframe?
* When you use the `rownames()` function on `metadata`, what is the *data structure* of the output?
* [Optional] How many elements in (how long is) the output of `colnames(proj_summary)`? Don't count, but use another function to determine this.

***
