# Render the book in GitBook format
bookdown::render_book("index.Rmd", "bookdown::gitbook")

# Open the resulting GitBook in the Viewer pane
rstudioapi::viewer("_book/index.html")

# The following code is a helper function to check if code fences are balanced in an Rmd or md file
check_code_fences <- function(file) {
  # Read the file
  content <- readLines(file)

  # Initialize a counter for code fences
  fence_count <- 0

  # Loop through each line to check for fences
  for (i in seq_along(content)) {
    line <- content[i]

    # Check if the line contains a code fence (``` or ```{r})
    if (grepl("^```", line)) {
      fence_count <- fence_count + 1
    }
  }

  # Final check: Output only if the number of fences is odd (i.e., unbalanced)
  if (fence_count %% 2 != 0) {
    cat("Code fences are unbalanced in file:", file, "\n")
  } else {
    cat("Code fences are balanced in file:", file, "\n")
  }
}

# Example usage: check your Rmd or md file
check_code_fences("path/to/your_file.md")

