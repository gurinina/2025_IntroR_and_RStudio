# Saving data and plots to file

## Writing data to file 

Everything we have done so far has only modified the data in R; the files have remained unchanged. Whenever we want to save our datasets to file, we need to use a `write` function in R. 

To write our matrix to file in comma separated format (.csv), we can use the `write.csv` function. There are two required arguments: 

* the variable name of the data structure you are exporting

* the path and filename that you are exporting to. 

By default the delimiter or column separator is set, and columns will be separated by a comma.

```r
# Save a data frame to file
write.csv(sub_meta, file="data/subset_meta.csv")
```

Another commonly used function is `write.table`, which allows you to specify the delimiter or separator you wish to use. This function is commonly used to create tab-delimited files.

## Exporting figures to file

There are two ways in which figures and plots can be output to a file (rather than simply displaying on screen). 

(1) The first (and easiest) is to export directly from the RStudio 'Plots' panel, by clicking on `Export` when the image is plotted. This will give you the option of `png` or `pdf` and selecting the directory to which you wish to save it to. It will also give you options to dictate the size and resolution of the output image.

(2) The second option is to use R functions that can be hard-coded in to your script. This would allow you to run the script from start to finish and automate the process (not requiring human point-and-click actions to save). If we wanted to print our scatterplot to a pdf file format, we would need to use the functions which specifies the graphical format you intend on creating i.e.`pdf()`, `png()`, `tiff()` etc. Within the function you will need to specify a name for your image, and the width and height (optional). This will open up the device that you wish to write to:

```r
## Open device for writing
pdf("figures/scatterplot.pdf")
```

```r
## Make a plot which will be written to the open device, in this case the temp file created by pdf() or png()

ggplot(new_metadata) +
  geom_point(aes(x = age_in_days, y= samplemeans, color = genotype,
  			shape=celltype), size=rel(3.0)) 
```

Finally, close the "device", or file, using the `dev.off()` function. There are also `bmp`, `tiff`, and `jpeg` functions, though the jpeg function has proven less stable than the others. 
  			
```r    
## Closing the device is essential to save the temporary file created by pdf() or png()
dev.off()
```
***Note 1:*** *In the case of `pdf()`, if you had made additional plots before closing the device, they will all be stored in the same file with each plot usually getting its own page, unless otherwise specified.*

***
