local P = {}
local palette1 = {
	fg0           = "#d4be98",
	fg1           = "#ddc7a1",
	red           = "#ea6962",
	orange        = "#e78a4e",
	yellow        = "#d8a657",
	green         = "#a9b665",
	aqua          = "#89b482",
	blue          = "#7daea3",
	purple        = "#d3869b",
	bright_yellow = "#fabd2f",
	bright_red    = "#fb4934",
	bright_orange = "#fe8019",
	bg_red        = "#ea6962",
	bg_green      = "#a9b665",
	bg_yellow     = "#d8a657",
}

local palette2 = {
	fg0       = "#654735",
	fg1       = "#4f3829",
	red       = "#c14a4a",
	orange    = "#c35e0a",
	yellow    = "#b47109",
	green     = "#6c782e",
	aqua      = "#4c7a5d",
	blue      = "#45707a",
	purple    = "#945e80",
	bg_red    = "#ae5858",
	bg_green  = "#6f8352",
	bg_yellow = "#a96b2c",
}
local background = {
	bg0              = "#32302f",
	bg1              = "#3c3836",
	bg2              = "#3c3836",
	bg3              = "#504945",
	bg4              = "#504945",
	bg5              = "#665c54",
	bg_statusline1   = "#3c3836",
	bg_statusline2   = "#46413e",
	bg_statusline3   = "#5b534d",
	bg_diff_green    = "#3d4220",
	bg_visual_green  = "#424a3e",
	bg_diff_red      = "#472322",
	bg_visual_red    = "#543937",
	bg_diff_blue     = "#0f3a42",
	bg_visual_blue   = "#404946",
	bg_visual_yellow = "#574833",
	bg_current_word  = "#45403d",
}
local grey = {
	grey0 = "#7c6f64",
	grey1 = "#928374",
	grey2 = "#a89984",
}
P.fg1  = palette1
P.fg2  = palette2
P.bg1  = background
P.grey = grey
return P
