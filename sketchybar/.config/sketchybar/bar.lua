local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  topmost = false,
  height = 37,
  position = "top",
  color = colors.bar.bg,
  padding_right = 2,
  padding_left = 2,
  corner_radius = 5,
  margin = 17,
  y_offset = 5,
  border_width = 0,
  border_color = colors.bar.border
})
