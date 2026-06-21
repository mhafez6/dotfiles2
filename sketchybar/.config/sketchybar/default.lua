local settings = require("settings")
local colors   = require("colors")

sbar.default({
  updates = "when_shown",
  icon = {
    font = {
      family = settings.font.text,
      style  = settings.font.style_map["Bold"],
      size   = 14.0,
    },
    color         = colors.white,
    padding_left  = settings.paddings,
    padding_right = settings.paddings,
  },
  label = {
    font = {
      family = settings.font.text,
      style  = settings.font.style_map["Regular"],
      size   = 13.0,
    },
    color         = colors.white,
    padding_left  = settings.paddings,
    padding_right = settings.paddings,
  },
  background = {
    height        = 28,
    corner_radius = 9,
    border_width  = 0,
    color         = colors.bg1,
  },
  popup = {
    background = {
      border_width  = 2,
      corner_radius = 9,
      border_color  = colors.popup.border,
      color         = colors.popup.bg,
      shadow        = { drawing = true },
    },
  },
  padding_left  = 5,
  padding_right = 5,
})
