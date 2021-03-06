hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

hs.loadSpoon("MouseCircle")
hs.loadSpoon("WindowScreenLeftAndRight")
hs.loadSpoon("WinWin")

-- =====================
-- Window Highlighting
-- =====================
hs.window.highlight.ui.overlay = true
hs.window.highlight.ui.frameWidth = 5
hs.window.highlight.ui.frameColor = {1, 0.176, 0.522, 1}
-- hs.window.highlight.ui.flashDuration=0.3
hs.window.highlight.start()

-- =====================
-- Window Switching
-- =====================

-- Window hints
hs.hotkey.bind({"cmd"}, "E", function()
  hs.hints.windowHints()
end)

-- Window switcher
switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
switcher_space = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter{}) -- include minimized/hidden windows, current Space only
switcher_browsers = hs.window.switcher.new{'Safari','Google Chrome'} -- specialized switcher for your dozens of browser windows :)
-- bind to hotkeys; WARNING: at least one modifier key is required!
hs.hotkey.bind('alt','tab','Next window',function()switcher:next()end)
hs.hotkey.bind('alt-shift','tab','Prev window',function()switcher:previous()end)

-- Mouse follows window focus
hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
  spoon.WinWin:centerCursor()
end)

-- =====================
-- Window movement
-- =====================

-- Left half
hs.hotkey.bind({"alt", "cmd"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Top left
hs.hotkey.bind({"ctrl", "cmd"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Bottom Left
hs.hotkey.bind({"ctrl", "shift", "cmd"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)
  
-- Right half
hs.hotkey.bind({"alt", "cmd"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Top right
hs.hotkey.bind({"ctrl", "cmd"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Bottom right
hs.hotkey.bind({"ctrl", "shift", "cmd"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Full-screen - make current window take up the full screen
hs.hotkey.bind({"alt", "cmd"}, "u", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  win:setFrame(max)
end)

-- Multi-monitors - move window to next monitor
spoon.WindowScreenLeftAndRight:bindHotkeys({
    screen_left = { { "ctrl", "alt", "cmd"}, "Left" },
    screen_right = { { "ctrl", "alt", "cmd"}, "Right" }
})

-- =====================
-- Mouse
-- =====================

-- Centers the cursor on the current window
-- hs.hotkey.bind({"ctrl", "alt", "shift", "cmd"}, "m", function()
--   spoon.WinWin:centerCursor()
-- end)
-- Draws a circle around mouse on command
-- spoon.MouseCircle:bindHotkeys({
--     show = { { "ctrl", "shift", "alt"}, "d" }
-- })

-- =====================
-- App shortcuts
-- =====================

-- hs.hotkey.bind({"ctrl", "alt", "shift", "cmd"}, "s", function()
--   hs.application.launchOrFocus("Firefox")
-- end)

hs.hotkey.bind({"ctrl", "alt", "shift", "cmd"}, "t", function()
  hs.application.launchOrFocus("kitty")
end)

-- hs.hotkey.bind({"ctrl", "alt", "shift", "cmd"}, "s", function()
--   hs.application.launchOrFocus("Spotify")
-- end)

hs.hotkey.bind({"ctrl", "alt", "shift", "cmd"}, "c", function()
  hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind({"ctrl", "alt", "shift", "cmd"}, "b", function()
  hs.application.launchOrFocus("Brave Browser")
end)

hs.hotkey.bind({"ctrl", "alt", "shift", "cmd"}, "s", function()
  hs.application.launchOrFocus("Finder")
end)

hs.hotkey.bind({"ctrl", "alt", "shift", "cmd"}, "d", function()
  hs.application.launchOrFocus("Discord")
end)

hs.hotkey.bind({"ctrl", "alt", "shift", "cmd"}, "f", function()
  hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind({"ctrl", "alt", "shift", "cmd"}, "m", function()
  hs.application.launchOrFocus("zoom.us")
end)
