# Plotting and data visualization

## Dataframe setup for visualization

In this lesson we want to make plots to evaluate the average expression in each sample and its relationship with the age of the mouse. So, to this end, we will be adding a couple of additional columns of information to the `metadata` data frame that we can utilize for plotting. 

<p align="center">
<img src="img/new_metadata.png" width="600">
</p>


### Calculating average expression

Let's take a closer look at our counts data (`rpkm_data`). Each column represents a sample in our experiment, and each sample has > 36,000 total counts. We want to compute **the average value of expression** for each sample. Taking this one step at a time, if we just wanted the average expression for Sample 1 we can use the R base function `mean()`:

```r
mean(rpkm_ordered$sample1)
```

That is great, but we need to get this information from all 12 samples, so all 12 columns. We want a vector of 12 values that we can add to the metadata data frame. What is the best way to do this?

To get the mean of all the samples in a single line of code the `map()` family of function is a good option. 

### The `map` family of functions
> 
> The `map()` family of functions is available from the **`purrr`** package, which is part of the tidyverse suite of packages. We can `map()` functions to execute some task/function on every element in a vector, or every column in a dataframe, or every component of a list, and so on. 
> 
> - `map()` creates a list.
> - `map_lgl()` creates a logical vector.
> - `map_int()` creates an integer vector.
> - `map_dbl()` creates a "double" or numeric vector.
> - `map_chr()` creates a character vector.
> 
> The syntax for the `map()` family of functions is: 
> 
> ```r
> ## DO NOT RUN
> map(object, function_to_apply)
> ```

To obtain **mean values for all samples** we can use the `map_dbl()` function which generates a numeric vector. 

```r
library(purrr)  # Load the purrr

samplemeans <- map_dbl(rpkm_ordered, mean) 
```
The output of `map_dbl()` is a *named* vector of length 12. 
	
### Adding data to metadata

Before we add `samplemeans` as a new column to metadata, let's create a vector with the ages of each of the mice in our data set.

```r
# Create a numeric vector with ages. Note that there are 12 elements here

age_in_days <- c(40, 32, 38, 35, 41, 32, 34, 26, 28, 28, 30, 32)    	
```

Now, we are ready to combine the `metadata` data frame with the 2 new vectors to create a new data frame with 5 columns:
```r
# Add the new vectors as the last columns to the metadata 

new_metadata <- data.frame(metadata, samplemeans, age_in_days) 

# Take a look at the new_metadata object
head(new_metadata)
```

Using new_metadata, we are now ready for plotting and data visualization.

***
