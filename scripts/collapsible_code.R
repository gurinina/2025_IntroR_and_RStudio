

# The following code is a helper function to conditionally show collapsible code blocks depending on the output format
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
