
# Render GitBook format
bookdown::render_book("index.Rmd", "bookdown::gitbook")

# Render EPUB format
bookdown::render_book("index.Rmd", "bookdown::epub_book")

# Render PDF format
bookdown::render_book("index.Rmd", "bookdown::pdf_book")

