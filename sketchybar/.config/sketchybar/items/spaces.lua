local colors    = require("colors")
local settings  = require("settings")
local app_icons = require("helpers.app_icons")

local spaces = {}

for i = 1, 9, 1 do
  local space = sbar.add("space", "space." .. i, {
    space = i,
    icon = {
      font = {
        family = settings.font.numbers,
        style  = settings.font.style_map["Bold"],
        size   = 12.0,
      },
      string        = i,
      padding_left  = 12,
      padding_right = 6,
      color           = colors.white,
      highlight_color = colors.green,
    },
    label = {
      padding_right   = 14,
      color           = colors.grey,
      highlight_color = colors.white,
      font            = "sketchybar-app-font:Regular:16.0",
      y_offset        = -1,
    },
    padding_right = 1,
    padding_left  = 1,
    background = {
      color        = colors.bg1,
      border_width = 1,
      border_color = colors.bg2,
      height       = 26,
    },
  })

  spaces[i] = space

  local space_bracket = sbar.add("bracket", "space_br." .. i, { space.name }, {
    background = {
      color         = colors.bg1,
      border_color  = colors.bg2,
      border_width  = 1,
      height        = 28,
      corner_radius = 7,
    }
  })

  sbar.add("space", "space.pad." .. i, {
    space  = i,
    script = "",
    width  = settings.group_paddings,
  })

  space:subscribe("space_change", function(env)
    local selected = env.SELECTED == "true"
    local color    = selected and colors.green or colors.bg2
    space:set({
      icon  = { highlight = selected },
      label = { highlight = selected },
      background = { border_color = color },
    })
    space_bracket:set({ background = { border_color = color } })
  end)

  space:subscribe("mouse.clicked", function(env)
    sbar.exec("yabai -m space --focus " .. i .. " 2>/dev/null")
  end)
end

-- Show app icons inside each space label
local space_observer = sbar.add("item", { drawing = false, updates = true })

space_observer:subscribe("space_windows_change", function(env)
  local icon_line = " "
  local no_app    = true
  for app, _ in pairs(env.INFO.apps) do
    no_app = false
    local icon = app_icons[app] or app_icons["default"]
    icon_line = icon_line .. icon .. " "
  end
  if no_app then icon_line = " —" end

  sbar.animate("tanh", 10, function()
    if spaces[env.INFO.space] then
      spaces[env.INFO.space]:set({ label = icon_line })
    end
  end)
end)
