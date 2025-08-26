

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


collapsible_code <- function(html_content, non_html_content) {
  output_format <- knitr::opts_knit$get("rmarkdown.pandoc.to")
  # opts_knit$get("out.format") is not reliable for determining the output format
  # print(c("format", output_format))
  if (output_format == "html") {
    # HTML output (GitBook/HTML): Show collapsible section
    cat(html_content)
  } else {
    # Non-HTML output (EPUB, PDF): Show regular R code block
    cat(non_html_content)
  }
}
