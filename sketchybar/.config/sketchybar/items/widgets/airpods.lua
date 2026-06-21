local icons    = require("icons")
local colors   = require("colors")
local settings = require("settings")

local SCRIPT = os.getenv("HOME") .. "/.config/sketchybar/helpers/airpods.sh"

local airpods = sbar.add("item", "widgets.airpods", {
  position = "right",
  drawing  = false,
  icon = {
    string = icons.devices.airpods,
    color  = colors.white,
    font = {
      family = settings.font.text,
      style  = settings.font.style_map["Regular"],
      size   = 14.0,
    },
  },
  label = {
    string = "",
    font = {
      family = settings.font.numbers,
      style  = settings.font.style_map["Regular"],
      size   = 12.0,
    },
  },
  update_freq = 30,
})

airpods:subscribe({ "routine", "system_woke" }, function()
  sbar.exec(SCRIPT, function(result)
    local pct = result:gsub("%s+", "")
    if pct ~= "" then
      airpods:set({ drawing = true, label = { string = pct } })
    else
      airpods:set({ drawing = false })
    end
  end)
end)

sbar.add("bracket", "widgets.airpods.bracket", { airpods.name }, {
  background = {
    color        = colors.bg1,
    border_color = colors.bg2,
    border_width = 1,
  },
})

sbar.add("item", "widgets.airpods.padding", { position = "right", width = settings.group_paddings })
