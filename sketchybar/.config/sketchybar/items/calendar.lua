local settings = require("settings")
local colors   = require("colors")

local date = sbar.add("item", "calendar.date", {
  position    = "right",
  update_freq = 60,
  width       = 0,
  y_offset    = 7,
  icon        = { drawing = "off" },
  label = {
    font = {
      family = settings.font.text,
      style  = settings.font.style_map["Regular"],
      size   = 11.0,
    },
    color         = colors.grey,
    padding_left  = 8,
    padding_right = 4,
  },
})

date:subscribe({ "forced", "routine", "system_woke" }, function(env)
  date:set({ label = os.date("%a, %b %d") })
end)

local clock = sbar.add("item", "calendar.clock", {
  position    = "right",
  update_freq = 5,
  y_offset    = -5,
  icon        = { drawing = "off" },
  label = {
    font = {
      family = settings.font.numbers,
      style  = settings.font.style_map["Bold"],
      size   = 13.0,
    },
    color         = colors.yellow,
    padding_left  = 8,
    padding_right = 8,
  },
})

clock:subscribe({ "forced", "routine", "system_woke" }, function(env)
  clock:set({ label = os.date("%H:%M") })
end)

sbar.add("bracket", "calendar.bracket", { date.name, clock.name }, {
  background = {
    color         = colors.bg1,
    border_color  = colors.bg2,
    border_width  = 1,
    height        = 28,
    corner_radius = 9,
  },
})

sbar.add("item", "calendar.padding", { position = "right", width = settings.group_paddings })
