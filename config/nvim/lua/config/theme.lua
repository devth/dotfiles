local function get_system_theme()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle and handle:read("*a") or ""
  if handle then handle:close() end
  return result:match("Dark") and "dark" or "light"
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
