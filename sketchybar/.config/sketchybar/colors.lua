local cols = {
    transparent = 0x00000000
}

local catppuccin_mocha = {
    black = 0xff11111b,
    white = 0xffcdd6f4,
    red = 0xfff38ba8,
    green = 0xffa6e3a1,
    blue = 0xff89b4fa,
    yellow = 0xfff9e2af,
    orange = 0xfffab387,
    magenta = 0xffcba6f7,
    grey = 0xff7f849c,
    mauve = 0xffcba6f7,
    bg1 = 0xff1e1e2e,
    bg2 = 0xff181825,
}

local catppuccin_latte = {
    black = 0xff4c4f69,
    white = 0xffeff1f5,
    red = 0xffd20f39,
    green = 0xff40a02b,
    blue = 0xff1e66f5,
    yellow = 0xffdf8e1d,
    orange = 0xfffe640b,
    magenta = 0xff8839ef,
    grey = 0xff7c7f93,
    mauve = 0xff8839ef,
    bg1 = 0xffccd0da,
    bg2 = 0xffbcc0cc,
}

local monotone = {
    black = 0xffcdd6f4,
    white = 0xffcdd6f4,
    red = 0xffcdd6f4,
    green = 0xffcdd6f4,
    blue = 0xffcdd6f4,
    yellow = 0xffcdd6f4,
    orange = 0xffcdd6f4,
    magenta = 0xffcdd6f4,
    grey = 0xffcdd6f4,
    mauve = 0xffcdd6f4,
    bg1 = cols.transparent,
    bg2 = cols.transparent
}

local gruvbox = {
    black = 0xff282828,
    white = 0xffebdbb2,
    red = 0xffcc241d,
    green = 0xff98971a,
    blue = 0xff458588,
    yellow = 0xffd79921,
    orange = 0xffd65d0e,
    magenta = 0xffb16286,
    grey = 0xffa89984,
    mauve = 0xffb16286,
    bg1 = 0xff3c3836,
    bg2 = 0xff504945,
}

local gruvbox_light = {
    black = 0xff282828,
    white = 0xffebdbb2,
    red = 0xffcc241d,
    green = 0xff98971a,
    blue = 0xff458588,
    yellow = 0xffd79921,
    orange = 0xffd65d0e,
    magenta = 0xffb16286,
    grey = 0xff928374,
    mauve = 0xffb16286,
    bg1 = 0xffebdbb2,
    bg2 = 0xffd5c4a1,
}

local function with_alpha(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
end

local chiri_calm = {
    black = 0xff2a2926,
    white = 0xff2a2926,
    red = 0xff8b3a3a,
    green = 0xff627690,
    blue = 0xff627690,
    yellow = 0xff8a6a2a,
    orange = 0xff9a5a30,
    magenta = 0xff6a4a68,
    grey = 0xff6f6d68,
    mauve = 0xff6a4a68,
    bg1 = 0xffebe8e2,
    bg2 = 0xffddd9d2,
}

-- colors = catppuccin_mocha
-- colors = catppuccin_latte
-- colors = chiri_calm
-- colors = gruvbox_light
colors = gruvbox
colors.with_alpha = with_alpha

colors.bar = {
    bg = cols.transparent,
    border = colors.black,
}
colors.popup = {
    bg = colors.bg2,
    border = colors.black,
}
colors.bar.bg = cols.transparent
colors.bg1 = cols.transparent
colors.border = colors.with_alpha(colors.grey, 0.6)
return colors
