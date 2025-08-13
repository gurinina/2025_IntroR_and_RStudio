solutions <- function(solution_code) {
  output_format <- knitr::opts_knit$get("rmarkdown.pandoc.to")

  if (output_format == "html") {
    # For HTML output, use collapsible details element
    cat('<details>\n',
        '<summary><i>Click here to see the solution</i></summary>\n',
        '<pre><code>', solution_code, '</code></pre>\n',
        '</details>\n')
  } else {
    # For non-HTML output, show a regular code block
    cat("### Solution\n\n```r\n", solution_code, "\n```\n")
  }
}
