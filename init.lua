-- window movements
local bindHotkey = {"cmd", "shift"}
-- move window to right
hs.hotkey.bind(bindHotkey, "l", function()
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

-- move window to left
hs.hotkey.bind(bindHotkey, "j", function()
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

-- move window to bottom
hs.hotkey.bind(bindHotkey, "k", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

-- move window to top
hs.hotkey.bind(bindHotkey, "i", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h / 2
  win:setFrame(f)
end)

-- make window full screen
hs.hotkey.bind(bindHotkey, "f", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- Show alerts
hs.urlevent.bind("launchenv", function(eventName, params)
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    hs.alert.show("Launching Environment...", nil, screen, 10.0)
end)

hs.urlevent.bind("stopenv", function(eventName, params)
      local win = hs.window.focusedWindow()
    local screen = win:screen()
    hs.alert.show("Aborted Running Processes", nil, screen, 10.0)
end)

hs.urlevent.bind("launchportal", function(eventName, params)
      local win = hs.window.focusedWindow()
    local screen = win:screen()
    hs.alert.show("Launching Portal...", nil, screen, 10.0)
end)

hs.urlevent.bind("stopportal", function(eventName, params)
      local win = hs.window.focusedWindow()
    local screen = win:screen()
    hs.alert.show("Stopped Portal Instance", nil, screen, 10.0)
end)

-- launch application
function launchApp(name)
  return function()
    hs.application.launchOrFocus(name)
  end
end

hs.hotkey.bind(bindHotkey, "b",launchApp("Firefox Developer Edition"));
hs.hotkey.bind(bindHotkey, "v",launchApp("Visual Studio Code"));
hs.hotkey.bind(bindHotkey, "n",launchApp("Notion"));
hs.hotkey.bind(bindHotkey, "s",launchApp("Slack"));
hs.hotkey.bind(bindHotkey, "c",launchApp("Google Chrome"));
hs.hotkey.bind(bindHotkey, "t",launchApp("Terminal"));
hs.hotkey.bind(bindHotkey, "q",launchApp("Sourcetree"));
hs.hotkey.bind(bindHotkey, "a",launchApp("DBeaver"));
hs.hotkey.bind(bindHotkey, "d",launchApp("Docker Desktop"));

-- move applications between displays
function moveWindowToDisplay(d)
  return function()
    local displays = hs.screen.allScreens()
    local win = hs.window.focusedWindow()
    win:moveToScreen(displays[d], false, true)
  end
end
hs.hotkey.bind(bindHotkey, "1", moveWindowToDisplay(1))
hs.hotkey.bind(bindHotkey, "2", moveWindowToDisplay(2))
