local function get_system_theme()
  local handle = io.popen(
    "osascript -e 'tell app \"System Events\" to tell appearance preferences to get dark mode' 2>/dev/null"
  )
  local result = handle and handle:read("*a") or ""
  if handle then
    handle:close()
  end
  return result:match("true") and "dark" or "light"
end

local function set_theme()
  local theme = get_system_theme()
  if theme == "dark" then
    vim.cmd("set bg=dark") -- Change to your dark theme
  else
    vim.cmd("set bg=light") -- Change to your light theme
  end
end

-- Run on startup
set_theme()

-- Background watcher to check for theme changes every 5 seconds
vim.loop.new_timer():start(0, 5000, vim.schedule_wrap(set_theme))
