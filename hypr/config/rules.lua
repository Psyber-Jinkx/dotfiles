-- ▄▄▌ ▐ ▄▌▪   ▐ ▄ ·▄▄▄▄  ▄▄▌ ▐ ▄▌    ▄▄▄  ▄• ▄▌▄▄▌  ▄▄▄ ..▄▄ ·
-- ██· █▌▐███ •█▌▐███▪ ██ ██· █▌▐█    ▀▄ █·█▪██▌██•  ▀▄.▀·▐█ ▀.
-- ██▪▐█▐▐▌▐█·▐█▐▐▌▐█· ▐█▌██▪▐█▐▐▌    ▐▀▀▄ █▌▐█▌██▪  ▐▀▀▪▄▄▀▀▀█▄
-- ▐█▌██▐█▌▐█▌██▐█▌██. ██ ▐█▌██▐█▌    ▐█•█▌▐█▄█▌▐█▌▐▌▐█▄▄▌▐█▄▪▐█
--  ▀▀▀▀ ▀▪▀▀▀▀▀ █▪▀▀▀▀▀•  ▀▀▀▀ ▀▪    .▀  ▀ ▀▀▀ .▀▀▀  ▀▀▀  ▀▀▀▀
--
-- https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Workspace rules
hl.workspace_rule({ workspace = "special:magic", layout = "dwindle" })

-- Monitors (matched by description so connector names like DP-6/DP-7 don't matter)
local LENOVO = "Lenovo Group Limited P27h-30 V30DGR2H"
local HP     = "HP Inc. HP E24 G5 CNK33017DG"

local names, descs = {}, {}
local h = io.popen("hyprctl monitors 2>/dev/null")
if h then
  for line in h:lines() do
    local n = line:match("^Monitor (%S+)")
    if n then names[n] = true end
    local d = line:match("^%s*description:%s*(.-)%s*$")
    if d then descs[d] = true end
  end
  h:close()
end

local function assign(monitor, first, last)
  for ws = first, last do
    hl.workspace_rule({ workspace = tostring(ws), monitor = monitor })
  end
end

assign("desc:" .. LENOVO, 1, 3)
assign("desc:" .. HP, 4, 6)
assign("eDP-1", 7, 8)
-- -- if descs[HP] and descs[LENOVO] then
--   -- Work, three monitors: Lenovo 1-3, HP 4-6, laptop 7-8
--   assign("desc:" .. LENOVO, 1, 3)
--   assign("desc:" .. HP, 4, 6)
--   assign("eDP-1", 7, 8)
-- elseif descs[LENOVO] then
--   -- Work, laptop + Lenovo
--   assign("desc:" .. LENOVO, 1, 6)
--   assign("eDP-1", 7, 8)
-- elseif descs[HP] then
--   -- Laptop + HP
--   assign("desc:" .. HP, 1, 6)
--   assign("eDP-1", 7, 8)
-- elseif names["HDMI-A-1"] then
--   -- Home
--   assign("HDMI-A-1", 1, 6)
--   assign("eDP-1", 7, 8)
-- else
--   -- Laptop only
--   assign("eDP-1", 1, 8)
-- end

-- Layer rules
hl.layer_rule({
  match = {
    namespace = "swaync-control-center"
  },

  animation = "slide right"
})

hl.layer_rule({
  match = {
    namespace = "awww-daemon|selection"
  },

  no_anim = true
})

hl.window_rule({ float = true, match = { class = "org.telegram.desktop", title = "^(Media viewer)" } })
hl.window_rule({ float = true, match = { class = "zenity", title = "^(Winetricks -)(.*)|winetricks" } })

hl.window_rule({ stay_focused = true, match = { class = "xfce-polkit" } })
hl.window_rule({ stay_focused = true, match = { title = "^(Rename device)$", class = "blueman-manager" } })


-- Tags
hl.window_rule({ float = true, match = { tag = "float" } })
hl.window_rule({ opacity = 1, match = { tag = "opaque" } })
hl.window_rule({ border_size = 2, match = { tag = "bordered" } })


hl.window_rule({
  name = "Float by title",
  match = {
    title = "Font Manager|Volume Control|Qalculate!|Library|Add bookmark"
  },

  float = true,
  center = true,
  persistent_size = true,
})

-- Built with table.concat: a "\" line continuation inside a Lua string inserts
-- a newline and the next line's leading spaces, which broke the class matches.
hl.window_rule({
  name = "Float by class",
  match = {
    class = table.concat({
      "blueman-manager", "blueman-services", "nwg-look", "rog-control-center",
      "org.qbittorrent.qBittorrent", "kvantummanager",
      "org.gnome.seahorse.Application", "xfce-polkit", "org.polymc.PolyMC",
      "engrampa", "nm-connection-editor", "system-config-printer",
      "hyprland-share-picker", "org.bleachbit.BleachBit", "vlc",
      "exo-desktop-item-edit", "xdg-desktop-portal-gtk", "org.gnome.eog", "qt6ct",
    }, "|"),
  },

  float = true,
  center = true,
  persistent_size = true,
})

hl.window_rule({
  name = "Thunar dialogs",
  match = {
    class = "thunar|Thunar",
    title = 'Rename "*.*"|File Operation Progress|Confirm to replace files|Attention'
  },

  float = true,
  persistent_size = true,
})

hl.window_rule({
  name = "Thunar stayfocused",
  match = {
    class = "thunar|Thunar",
    title = 'Attention|Rename "*.*"|Create Document from .*|New .* ...|Create New Folder'
  },

  stay_focused = true
})

hl.window_rule({
  name = "Thunar move right bottom",
  match = {
    title = "^(File Operation Progress)$",
    class = "(thunar|Thunar)",
  },

  focus_on_activate = false,
  move = "1460 970"
})

hl.window_rule({
  name = "Thunar menu force center",
  match = {
    title = "^(Confirm to replace files)$",
    class = "(thunar|Thunar)"
  },

  center = true
})

hl.window_rule({
  name = "Small window size",
  match = {
    class = "org.gnome.seahorse.Application|org.polymc.PolyMC|nwg-look",
  },

  size = "900 600",
  center = true,
})

hl.window_rule({
  name = "Scrolling almost full width",
  match = {
    class = "codium|vesktop|zen",
  },

  scrolling_width = 0.95
})

hl.window_rule({
  name = "Alacritty opacity and border",
  match = {
    class = "Alacritty|peaclock"
  },

  opacity = "0.9 0.8",
  border_size = 2,
})

hl.window_rule({
  name = "Zen/firefox Picture in Picture",
  match = {
    title = "Picture-in-Picture",
    class = "^(zen)(.*)$",
  },

  size = "300 200",
  move = "1600 50",
  border_size = 2,
  pin = true,
  float = true,
  no_initial_focus = true,
  focus_on_activate = true,
  keep_aspect_ratio = true,
})

hl.window_rule({
  -- TODO fullscreens all wine apps
  name = "Games in fullscreen",
  match = {
    class = "steam_app_.*",
  },

  fullscreen = true
})

hl.window_rule({
  name = "Spotify pseudotile",   -- Extra gaps for Spotify
  match = {
    class = "spotify|Spotify"
  },

  pseudo = true,
  size = "1850 1000",
  scrolling_width = 1
})

hl.window_rule({
  name = "peaclock terminal",
  match = {
    class = "peaclock",
  },

  float = true,
  pin = true,
  size = "500 260",
  move = "711 60",
})

hl.window_rule({
  name = "Dev-tools",
  match = {
    title = "^(DevToolsApp)$"
  },

  float = true,
  move = "50% 15%",
  size = "900 600"
})

hl.window_rule({
  name = "Flameshot",
  match = {
    class = "flameshot"
  },
  float = true,
  fullscreen = true,
})

hl.window_rule({
  name = "Ueberzug",
  match = {
    class = "ueberzugpp(.*)",
  },

  float = true,
  no_initial_focus = true
})