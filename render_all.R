library(bookdown)

clean_book(clean = TRUE)


# Render GitBook format
bookdown::render_book("index.Rmd", "bookdown::gitbook", quiet = FALSE)

# After Gitbook is rendered, open 16-etidyverse.md in rsconnect and save it as
# 16-tidyverse.Rmd in the lessons directory
# Then run EPUB and PDF renderings

# Render EPUB format
bookdown::render_book("index.Rmd", "bookdown::epub_book")

# Render PDF format
bookdown::render_book("index.Rmd", "bookdown::pdf_book")


# After EPUB and PDF have rendered, open 16-wtidyverse.md in rsconnect and save it as
# 16-tidyverse.Rmd in the lessons directory
