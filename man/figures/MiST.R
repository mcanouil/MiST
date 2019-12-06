library(ggplot2)
library(hexSticker)
library(magick)
library(showtext)

font_add_google("Roboto Slab", "roboto")
showtext_auto()

# carot_colour <- c("FFB85D", "F87217", "00ee76", "008b45")[1]
"./man/figures/mist_background.png" %>%
  image_read() %>%
  image_background(color = "transparent") %>%
  sticker(
    subplot = .,
    s_x = 1,
    s_y = 1,
    s_width = 1.279 * 1.5,
    s_height = 0.737 * 1.5,
    package = "MiST",
    p_color = "grey80",
    p_size = 36,
    p_x = 1,
    p_y = 1.2,
    p_family = "roboto",
    spotlight = FALSE,
    h_fill = "grey20",
    h_color = "grey50",
    dpi = 300,
    filename = "./man/figures/mist_hex.png"
  )
image_read("./man/figures/mist_hex.png")

