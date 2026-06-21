local icons    = require("icons")
local colors   = require("colors")
local settings = require("settings")

local volume_icon = sbar.add("item", "widgets.volume.icon", {
  position      = "right",
  padding_right = -1,
  icon = {
    string = icons.volume._100,
    color  = colors.white,
    font = {
      family = settings.font.text,
      style  = settings.font.style_map["Regular"],
      size   = 14.0,
    },
  },
  label = { drawing = false },
})

local volume_pct = sbar.add("item", "widgets.volume.pct", {
  position = "right",
  icon     = { drawing = false },
  label = {
    string = "??%",
    font = {
      family = settings.font.numbers,
      style  = settings.font.style_map["Regular"],
      size   = 12.0,
    },
  },
})

sbar.add("bracket", "widgets.volume.bracket", { volume_icon.name, volume_pct.name }, {
  background = {
    color        = colors.bg1,
    border_color = colors.bg2,
    border_width = 1,
  },
})

sbar.add("item", "widgets.volume.padding", { position = "right", width = settings.group_paddings })

local function update(vol)
  vol = tonumber(vol) or 0
  local icon
  if     vol > 60 then icon = icons.volume._100
  elseif vol > 30 then icon = icons.volume._66
  elseif vol > 5  then icon = icons.volume._33
  elseif vol > 0  then icon = icons.volume._10
  else                  icon = icons.volume._0
  end
  local lead = vol < 10 and "0" or ""
  volume_icon:set({ icon = { string = icon } })
  volume_pct:set({ label = lead .. vol .. "%" })
end

volume_pct:subscribe("volume_change",  function(env) update(env.INFO) end)
volume_icon:subscribe("volume_change", function(env) update(env.INFO) end)

volume_pct:subscribe("routine", function()
  sbar.exec("osascript -e 'output volume of (get volume settings)'", function(v)
    update(v:gsub("%s+", ""))
  end)
end)

local function scroll(env)
  local d = env.SCROLL_DELTA
  sbar.exec('osascript -e "set volume output volume (output volume of (get volume settings) + ' .. d .. ')"')
end
volume_icon:subscribe("mouse.scrolled", scroll)
volume_pct:subscribe("mouse.scrolled",  scroll)
