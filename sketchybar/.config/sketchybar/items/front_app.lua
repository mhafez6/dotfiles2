local settings = require("settings")
local colors   = require("colors")

local front_app = sbar.add("item", "front_app", {
  display  = "active",
  position = "center",
  updates  = true,
  icon     = { drawing = false },
  label = {
    font = {
      family = settings.font.text,
      style  = settings.font.style_map["Bold"],
      size   = 12.0,
    },
    color         = colors.white,
    padding_left  = 10,
    padding_right = 10,
  },
  background = {
    color        = colors.bg1,
    border_color = colors.bg2,
    border_width = 1,
  },
})

front_app:subscribe("front_app_switched", function(env)
  front_app:set({ label = { string = env.INFO } })
end)
