local settings = require("settings")

local icons = {
  sf_symbols = {
    apple    = "󰀵",
    loading  = "󰔟",
    battery  = { _100 = "󰁹", _75 = "󰂁", _50 = "󰁾", _25 = "󰁼", _0 = "󰁺", charging = "󰂄" },
    volume   = { _100 = "󰕾", _66 = "󰖀", _33 = "󰕿", _10 = "󰕿", _0 = "󰖁" },
    devices  = { headphones = "󰋋", airpods = "󰋋" },
    wifi     = { connected = "󰖩", disconnected = "󰖪" },
    media    = { back = "󰒮", forward = "󰒭", play_pause = "󰐎", play = "󰐊", pause = "󰏤" },
    switch   = { on = "󱨥", off = "󱨦" },
  },
  nerdfont = {
    apple    = "",
    loading  = "",
    battery  = { _100 = "󰁹", _75 = "󰂁", _50 = "󰁾", _25 = "󰁼", _0 = "󰁺", charging = "󰂄" },
    volume   = { _100 = "󰕾", _66 = "󰖀", _33 = "󰕿", _10 = "󰕿", _0 = "󰖁" },
    devices  = { headphones = "󰋋", airpods = "󰋋" },
    wifi     = { connected = "󰖩", disconnected = "󰖪" },
    media    = { back = "󰒮", forward = "󰒭", play_pause = "󰐎", play = "󰐊", pause = "󰏤" },
    switch   = { on = "󱨥", off = "󱨦" },
  },
}

if settings.icons == "NerdFont" then
  return icons.nerdfont
else
  return icons.sf_symbols
end
