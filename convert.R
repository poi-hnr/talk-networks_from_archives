"Convert a picture

Usage:
  convert.R [--resize=<rs>] <input> <output>

Options:
  --resize=<rs>   The resize string. [default: x160]

" -> doc

library(docopt)
library(magick)

arguments <- docopt(doc, version = "convert.R 1.0.0")

image_read(arguments$input) %>%
  image_resize(arguments$`--resize`) %>%
  image_write(arguments$output)
