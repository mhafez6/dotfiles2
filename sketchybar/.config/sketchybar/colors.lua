local transparent = 0x00000000

local gruvbox = {
  black   = 0xff282828,
  white   = 0xffebdbb2,
  red     = 0xffcc241d,
  green   = 0xff98971a,
  blue    = 0xff458588,
  yellow  = 0xffd79921,
  orange  = 0xffd65d0e,
  magenta = 0xffb16286,
  grey    = 0xffa89984,
  bg1     = 0xff3c3836,
  bg2     = 0xff504945,
}

local function with_alpha(color, alpha)
  if alpha > 1.0 or alpha < 0.0 then return color end
  return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
end

colors            = gruvbox
colors.transparent = transparent
colors.with_alpha  = with_alpha

colors.bar = {
  bg     = transparent,
  border = colors.bg1,
}
colors.popup = {
  bg     = colors.bg2,
  border = colors.bg1,
}

return colors
