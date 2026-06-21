local icons    = require("icons")
local colors   = require("colors")
local settings = require("settings")

local battery = sbar.add("item", "widgets.battery", {
  position    = "right",
  update_freq = 180,
  popup       = { align = "center" },
  icon = {
    font = {
      family = settings.font.text,
      style  = settings.font.style_map["Regular"],
      size   = 16.0,
    },
  },
  label = {
    font = {
      family = settings.font.numbers,
      style  = settings.font.style_map["Regular"],
      size   = 12.0,
    },
  },
})

local remaining = sbar.add("item", {
  position = "popup." .. battery.name,
  icon  = { string = "Time remaining:", width = 100, align = "left" },
  label = { string = "??:??h",           width = 100, align = "right" },
})

battery:subscribe({ "routine", "power_source_change", "system_woke" }, function()
  sbar.exec("pmset -g batt", function(info)
    local found, _, charge = info:find("(%d+)%%")
    local label    = found and (charge .. "%") or "?%"
    local charging = info:find("AC Power")
    local color    = colors.green
    local icon

    if charging then
      icon = icons.battery.charging
    elseif found then
      charge = tonumber(charge)
      if    charge > 80 then icon = icons.battery._100
      elseif charge > 60 then icon = icons.battery._75
      elseif charge > 40 then icon = icons.battery._50
      elseif charge > 20 then icon = icons.battery._25; color = colors.orange
      else                     icon = icons.battery._0;  color = colors.red
      end
    else
      icon = icons.battery._0
    end

    battery:set({
      icon  = { string = icon,  color = color },
      label = { string = label, color = color },
    })
  end)
end)

battery:subscribe("mouse.clicked", function(env)
  local open = battery:query().popup.drawing == "off"
  battery:set({ popup = { drawing = "toggle" } })
  if open then
    sbar.exec("pmset -g batt", function(info)
      local found, _, r = info:find(" (%d+:%d+) remaining")
      remaining:set({ label = found and (r .. "h") or "No estimate" })
    end)
  end
end)

sbar.add("bracket", "widgets.battery.bracket", { battery.name }, {
  background = {
    color        = colors.bg1,
    border_color = colors.bg2,
    border_width = 1,
  },
})

sbar.add("item", "widgets.battery.padding", { position = "right", width = settings.group_paddings })
