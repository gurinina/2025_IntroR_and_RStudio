# Functions in R

## Functions and their arguments

### What are functions?

A key feature of R is functions. Functions are **"self contained" modules of code that accomplish a specific task**. Functions usually take in some sort of data structure (value, vector, dataframe etc.) as arguments, process them, and then return a result.

The general usage for a function is the name of the function followed by parentheses:
```r
function_name(input)
```
The input(s) are called **arguments**, which can include:

1. the physical object (any data structure) on which the function carries out a task 

2. specifications that alter the way the function operates (e.g. options)

Most functions can take several arguments. If you don't specify a required argument when calling the function, you will receive an error unless the function has set a default value for the argument. 

### Basic functions

We have already used a few examples of basic functions in the previous lessons i.e `c()`, and  `factor()`. These functions are available as part of R's built in capabilities, and we will explore a few more of these base functions below. 

Many of the base functions in R involve mathematical operations. One example would be the function `sqrt()`. The input/argument must be a number, and the output is the square root of that number. Let's try finding the square root of 81:

```r
sqrt(81)
```

Now what would happen if we **called the function** (e.g. ran the function), on a *vector of values* instead of a single value? 

```r
sqrt(glengths)
```

In this case the task was performed on each individual value of the vector `glengths` and the respective results were displayed.


Let's try another function, this time using one that we can change some of the *options* (arguments that change the behavior of the function), for example `round`:

```r
round(3.14159)
```

We can see that we get `3`. That's because the default is to round to the nearest whole number. **What if we want a different number of significant digits?** Let's first learn how to find available arguments for a function.

### Seeking help on arguments for functions

The best way of finding out this information is to use the `?` followed by the name of the function. Doing this will open up the help manual in the bottom right panel of RStudio that will provide a description of the function, usage, arguments, details, and examples: 

```r
?round
```	

Alternatively, if you are familiar with the function but just need to remind yourself of the names of the arguments, you can use:

```r
args(round)
```

Even more useful is the `example()` function. This will allow you to run the examples section from the Online Help to see exactly how it works when executing the commands. Let's try that for `round()`:

```r
example("round")
```

In our example, we can change the number of digits returned by **adding an argument**. We can type `digits=2` or however many we may want:


```r
round(3.14159, digits=2)
```

***
**Exercise** 

1. Let's use base R function to calculate **mean** value of the `glengths` vector. You might need to search online to find what function can perform this task.

2. Create a new vector `test <- c(1, NA, 2, 3, NA, 4)`. Use the same base R function from exercise 1 (with addition of proper argument), and calculate mean value of the `test` vector. The output should be `2.5`.

	> *NOTE:* In R, missing values are represented by the symbol `NA` (not available). It’s a way to make sure that users know they have missing data, and make a conscious decision on how to deal with it. There are ways to ignore NA during statistical calculation, or to remove NA from the vector. 
	
3. Another commonly used base function is `sort()`. Use this function to sort the `glengths` vector in **descending** order.

***


