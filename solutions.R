# solutions <- function(solution_code) {
#   output_format <- knitr::opts_knit$get("rmarkdown.pandoc.to")
# 
#   if (output_format == "html") {
#     # For HTML output, use collapsible details element
#     cat('<details>\n',
#         '<summary><i>Click here to see the solution</i></summary>\n',
#         '<pre><code>', solution_code, '</code></pre>\n',
#         '</details>\n')
#   } else {
#     # For non-HTML output, show a regular code block
#     cat("### Solution\n\n```r\n", solution_code, "\n```\n")
#   }
# }

solutions <- function(solution_code) {
  # Render collapsible box in any HTML output (gitbook, html_document, etc.)
  if (isTRUE(knitr::is_html_output())) {
    
    # Escape code so < & > don't break HTML
    esc <- function(x) {
      x <- gsub("&", "&amp;", x, fixed = TRUE)
      x <- gsub("<", "&lt;",  x, fixed = TRUE)
      x <- gsub(">", "&gt;",  x, fixed = TRUE)
      x
    }
    
    html <- paste0(
      "<details>\n",
      "<summary><i>Click here to see the solution</i></summary>\n\n",
      "<pre><code class=\"language-r\">", esc(solution_code), "</code></pre>\n",
      "</details>\n"
    )
    
    knitr::asis_output(html)
    
  } else {
    # Non-HTML outputs: regular code block (or swap to a placeholder if you prefer to hide)
    knitr::asis_output(paste0("### Solution\n\n```r\n", solution_code, "\n```\n"))
  }
}
