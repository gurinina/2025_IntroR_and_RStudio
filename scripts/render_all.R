library(bookdown)

clean_book(clean = TRUE)


# Render GitBook format
bookdown::render_book("index.Rmd", "bookdown::gitbook", quiet = FALSE)

# Render EPUB format
bookdown::render_book("index.Rmd", "bookdown::epub_book")

# Render PDF format
bookdown::render_book("index.Rmd", "bookdown::pdf_book")

check_fences <- function(files = list.files(pattern = "[.](Rmd|md)$", recursive = TRUE)) {
  bad <- list()
  for (f in files) {
    x <- readLines(f, warn = FALSE)
    fence <- grepl("^(```|~~~)", x)
    if (!any(fence)) next
    opens <- grepl("^```\\{", x) | grepl("^~~~\\{", x)        # chunk/typed code blocks
    ticks <- gsub("^([`~]+).*", "\\1", x[fence])               # the exact fence string
    # running balance per fence width/symbol
    bal <- 0L
    last_open <- NULL
    for (i in which(fence)) {
      s <- sub("^([`~]+).*", "\\1", x[i])
      if (grepl("^([`~]+)\\{", x[i])) { bal <- bal + 1L; last_open <- i }
      else if (x[i] == s) { bal <- bal - 1L }
    }
    if (bal != 0L) bad[[f]] <- which(fence)
  }
  if (length(bad)) bad else "All fences look balanced in scanned files."
}
check_fences()
